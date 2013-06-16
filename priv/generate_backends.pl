#!/usr/bin/env perl
#
# $Id: $
#
# Module:  locale -- description
# Created: 06-FEB-2013 11:07
# Author:  tmr
#

use strict;
use warnings;

use POSIX qw(locale_h);
use I18N::Langinfo;
use File::Basename;

my $DEFAULT_LCID = 'C.UTF-8';
my @ENCODINGS    = qw( UTF-8 ); #qw( UTF-8 ISO-8859-1 ISO-8859-1 ASCII );
my @CULTURES     = qw( C POSIX cs_CZ en_GB en_US fa_IR fr_FR ru_RU );
my $OUT_DIR      = dirname ($0)."/../src/generated";

my @LANGINFO_VARS = qw(
  CODESET D_T_FMT D_FMT T_FMT T_FMT_AMPM AM_STR	PM_STR
  DAY_1 DAY_2 DAY_3 DAY_4 DAY_5 DAY_6 DAY_7
  ABDAY_1 ABDAY_2 ABDAY_3 ABDAY_4 ABDAY_5 ABDAY_6 ABDAY_7
  MON_1 MON_2 MON_3 MON_4 MON_5 MON_6 MON_7 MON_8 MON_9 MON_10 MON_11 MON_12
  ABMON_1 ABMON_2 ABMON_3 ABMON_4 ABMON_5 ABMON_6 ABMON_7 ABMON_8 ABMON_9 ABMON_10 ABMON_11 ABMON_12
  ERA ERA_D_FMT ERA_D_T_FMT ERA_T_FMT ALT_DIGITS RADIXCHAR THOUSEP YESEXPR NOEXPR CRNCYSTR
);

sub collect_locale {
  my $lcid = shift;
  setlocale (LC_ALL, $lcid) or setlocale (LC_ALL, $DEFAULT_LCID);

  # Get a reference to a hash of locale-dependent info
  my $locale_values = localeconv();
  my %result;

  # Output sorted list of the values
  for (sort keys %$locale_values) {
    $result{$_} = $locale_values->{$_};
  }

  no strict "refs";
  for (@LANGINFO_VARS) {
    my $fun = 'I18N::Langinfo::'.$_;
    $result{$_} = langinfo (&$fun);
  }

  \%result;
}

for my $cult (@CULTURES) {
  for my $enc (@ENCODINGS) {
    my $kvt = &collect_locale ($cult.'.'.$enc);
    my %kv = %{$kvt};
    my $xenc = lc ($enc); $xenc =~ s/-//g;
    my $xcult = lc ($cult); $xcult =~ s/_//g;
    my $mod = "elocale_table_${xcult}_${xenc}";
    my $file = "${OUT_DIR}/${mod}.erl";
    open (FH, ">${file}");
    printf FH "-module ($mod).\n";
    printf FH "-export ([t/1]).\n\n";
    for my $k (keys %kv) {
      printf FH "t ('%s') -> {ok, <<\"%s\">>};\n", $k, $kv{$k};
    }
    printf FH "t (P) -> {error, {unknown_locale_property, ?MODULE, P}}.\n\n";
    close (FH);
  }
}

# vim: fdm=syntax:fdn=3:tw=74:ts=2:syn=perl
