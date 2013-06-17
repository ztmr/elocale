-module (elocale).
-export ([
  codeset/1, codeset/2,
  datetime_fmt/1, datetime_fmt/2, date_fmt/1, date_fmt/2,
  time_fmt/1, time_fmt/2, time_ampm_fmt/1, time_ampm_fmt/2,
  time_am_str/1, time_am_str/2, time_pm_str/1, time_pm_str/2,
  day/2, day/3, abbrev_day/2, abbrev_day/3,
  mon/2, mon/3, abbrev_mon/2, abbrev_mon/3,
  era/1, era/2,
  era_date_fmt/1, era_date_fmt/2, era_time_fmt/1, era_time_fmt/2,
  era_datetime_fmt/1, era_datetime_fmt/2,
  alternate_digits/1, alternate_digits/2,
  radix_char/1, radix_char/2,
  thousands_separator_li/1, thousands_separator_li/2,
  yes_str/1, yes_str/2, yes_expression/1, yes_expression/2,
  no_str/1, no_str/2, no_expression/1, no_expression/2,
  currency_string/1, currency_string/2,
  is_negative_number_space_separated/1,
  is_negative_number_space_separated/2,
  is_positive_number_space_separated/1,
  is_positive_number_space_separated/2,
  is_currency_symbol_before_negative_number/1,
  is_currency_symbol_before_negative_number/2,
  is_currency_symbol_before_positive_number/1,
  is_currency_symbol_before_positive_number/2,
  negative_number_sign_position/1, negative_number_sign_position/2,
  positive_number_sign_position/1, positive_number_sign_position/2,
  fractional_digits_i10l/1, fractional_digits_i10l/2,
  fractional_digits/1, fractional_digits/2,
  currency_symbol_i10l/1, currency_symbol_i10l/2,
  currency_symbol/1, currency_symbol/2,
  monetary_thousands_separator/1, monetary_thousands_separator/2,
  thousands_separator/1, thousands_separator/2,
  monetary_decimal_point/1, monetary_decimal_point/2,
  decimal_point/1, decimal_point/2,
  positive_sign/1, positive_sign/2, negative_sign/1, negative_sign/2,
  grouping/1, grouping/2, monetary_grouping/1, monetary_grouping/2
]).

-define (ELOCALE_AVAILABLE_KEYS, [
  %% LangInfo (langinfo.h)
  'CODESET', 'D_T_FMT', 'D_FMT', 'T_FMT', 'T_FMT_AMPM', 'AM_STR', 'PM_STR',
  'DAY_1', 'DAY_2', 'DAY_3', 'DAY_4', 'DAY_5', 'DAY_6', 'DAY_7',
  'ABDAY_1', 'ABDAY_2', 'ABDAY_3', 'ABDAY_4', 'ABDAY_5', 'ABDAY_6', 'ABDAY_7',
  'MON_1', 'MON_2', 'MON_3', 'MON_4', 'MON_5', 'MON_6',
  'MON_7', 'MON_8', 'MON_9', 'MON_10', 'MON_11', 'MON_12',
  'ABMON_1', 'ABMON_2', 'ABMON_3', 'ABMON_4', 'ABMON_5', 'ABMON_6',
  'ABMON_7', 'ABMON_8', 'ABMON_9', 'ABMON_10', 'ABMON_11', 'ABMON_12',
  'ERA', 'ERA_D_FMT', 'ERA_D_T_FMT', 'ERA_T_FMT', 'ALT_DIGITS',
  'RADIXCHAR', 'THOUSEP', 'YESSTR', 'YESEXPR', 'NOSTR', 'NOEXPR',
  'CRNCYSTR',

  %% Numeric and monetary notation properties (`lconv' @ locale.h)
  'decimal_point', 'thousands_sep', 'grouping', 'int_curr_symbol',
  'currency_symbol', 'mon_decimal_point', 'mon_thousands_sep',
  'mon_grouping', 'positive_sign', 'negative_sign', 'int_frac_digits',
  'frac_digits', 'p_cs_precedes', 'p_sep_by_space', 'n_cs_precedes',
  'n_sep_by_space', 'p_sign_posn', 'n_sign_posn'
]).

%% @doc Encoding name.
codeset (Culture) ->
  codeset (Culture, undefined).
codeset (Culture, Encoding) ->
  call_ (Culture, Encoding, 'CODESET').

%% @doc Localized date-time format.
datetime_fmt (Culture) ->
  datetime_fmt (Culture, undefined).
datetime_fmt (Culture, Encoding) ->
  call_ (Culture, Encoding, 'D_T_FMT').

%% @doc Localized date format.
date_fmt (Culture) ->
  date_fmt (Culture, undefined).
date_fmt (Culture, Encoding) ->
  call_ (Culture, Encoding, 'D_FMT').

%% @doc Localized time format.
time_fmt (Culture) ->
  time_fmt (Culture, undefined).
time_fmt (Culture, Encoding) ->
  call_ (Culture, Encoding, 'T_FMT').

%% @doc Localized AM/PM time format.
time_ampm_fmt (Culture) ->
  time_ampm_fmt (Culture, undefined).
time_ampm_fmt (Culture, Encoding) ->
  call_ (Culture, Encoding, 'T_FMT_AMPM').

%% @doc Localized AM constant.
time_am_str (Culture) ->
  time_am_str (Culture, undefined).
time_am_str (Culture, Encoding) ->
  call_ (Culture, Encoding, 'AM_STR').

%% @doc Localized PM constant.
time_pm_str (Culture) ->
  time_pm_str (Culture, undefined).
time_pm_str (Culture, Encoding) ->
  call_ (Culture, Encoding, 'PM_STR').

%% @doc Localized name of the day.
day (N, Culture) -> day (N, Culture, undefined).
day (N, Culture, Encoding) when is_integer (N) andalso N > 0 andalso N =< 7 ->
  call_ (Culture, Encoding, list_to_atom ("DAY_" ++ integer_to_list (N))).

%% @doc Localized abbreviation of the name of the day.
abbrev_day (N, Culture) -> abbrev_day (N, Culture, undefined).
abbrev_day (N, Culture, Encoding) when is_integer (N) andalso N > 0 andalso N =< 7 ->
  call_ (Culture, Encoding, list_to_atom ("ABDAY_" ++ integer_to_list (N))).

%% @doc Localized name of the month.
mon (N, Culture) -> mon (N, Culture, undefined).
mon (N, Culture, Encoding) when is_integer (N) andalso N > 0 andalso N =< 12 ->
  call_ (Culture, Encoding, list_to_atom ("MON_" ++ integer_to_list (N))).

%% @doc Localized abbreviation of the name of the month.
abbrev_mon (N, Culture) -> abbrev_mon (N, Culture, undefined).
abbrev_mon (N, Culture, Encoding) when is_integer (N) andalso N > 0 andalso N =< 12 ->
  call_ (Culture, Encoding, list_to_atom ("ABMON_" ++ integer_to_list (N))).

era (Culture) -> era (Culture, undefined).
era (Culture, Encoding) ->
  call_ (Culture, Encoding, 'ERA').

era_date_fmt (Culture) ->
  era_date_fmt (Culture, undefined).
era_date_fmt (Culture, Encoding) ->
  call_ (Culture, Encoding, 'ERA_D_FMT').

era_time_fmt (Culture) ->
  era_time_fmt (Culture, undefined).
era_time_fmt (Culture, Encoding) ->
  call_ (Culture, Encoding, 'ERA_T_FMT').

era_datetime_fmt (Culture) ->
  era_datetime_fmt (Culture, undefined).
era_datetime_fmt (Culture, Encoding) ->
  call_ (Culture, Encoding, 'ERA_D_T_FMT').

alternate_digits (Culture) ->
  alternate_digits (Culture, undefined).
alternate_digits (Culture, Encoding) ->
  call_ (Culture, Encoding, 'ALT_DIGITS').

radix_char (Culture) ->
  radix_char (Culture, undefined).
radix_char (Culture, Encoding) ->
  call_ (Culture, Encoding, 'RADIXCHAR').

%% @doc Thousands separator (LangInfo).
thousands_separator_li (Culture) ->
  thousands_separator_li (Culture, undefined).
thousands_separator_li (Culture, Encoding) ->
  call_ (Culture, Encoding, 'THOUSEP').

%% @doc Localized YES regular expression.
yes_expression (Culture) ->
  yes_expression (Culture, undefined).
yes_expression (Culture, Encoding) ->
  call_ (Culture, Encoding, 'YESEXPR').

%% @doc Localized NO regular expression.
no_expression (Culture) ->
  no_expression (Culture, undefined).
no_expression (Culture, Encoding) ->
  call_ (Culture, Encoding, 'NOEXPR').

%% @doc Localized YES string.
yes_str (Culture) ->
  yes_str (Culture, undefined).
yes_str (Culture, Encoding) ->
  call_ (Culture, Encoding, 'YESSTR').

%% @doc Localized NO string.
no_str (Culture) ->
  no_str (Culture, undefined).
no_str (Culture, Encoding) ->
  call_ (Culture, Encoding, 'NOSTR').

%% @doc Localized currency string.
currency_string (Culture) ->
  currency_string (Culture, undefined).
currency_string (Culture, Encoding) ->
  call_ (Culture, Encoding, 'CRNCYSTR').

%% @doc 1 iff a space separates currency_symbol from a negative value.
is_negative_number_space_separated (Culture) ->
  is_negative_number_space_separated (Culture, undefined).
is_negative_number_space_separated (Culture, Encoding) ->
  call_ (Culture, Encoding, 'n_sep_by_space') =:= <<"1">>.

%% @doc 1 iff a space separates currency_symbol from a positive value.
is_positive_number_space_separated (Culture) ->
  is_positive_number_space_separated (Culture, undefined).
is_positive_number_space_separated (Culture, Encoding) ->
  call_ (Culture, Encoding, 'p_sep_by_space') =:= <<"1">>.

%% @doc 1 if currency_symbol precedes a negative value, 0 if succeeds.
is_currency_symbol_before_negative_number (Culture) ->
  is_currency_symbol_before_negative_number (Culture, undefined).
is_currency_symbol_before_negative_number (Culture, Encoding) ->
  call_ (Culture, Encoding, 'n_cs_precedes') =:= <<"1">>.

%% @doc 1 if currency_symbol precedes a positive value, 0 if succeeds.
is_currency_symbol_before_positive_number (Culture) ->
  is_currency_symbol_before_positive_number (Culture, undefined).
is_currency_symbol_before_positive_number (Culture, Encoding) ->
  call_ (Culture, Encoding, 'p_cs_precedes') =:= <<"1">>.

%% @doc Negative sign position.
%% Possible values for both `negative_number_sign_position'
%% and `positive_number_sign_position':
%% <ul>
%% <li>0 (Parentheses surround the quantity and currency_symbol.)</li>
%% <li>1 (The sign string precedes the quantity and currency_symbol.)</li>
%% <li>2 (The sign string follows the quantity and currency_symbol.)</li>
%% <li>3 (The sign string immediately precedes the currency_symbol.)</li>
%% <li>4 (The sign string immediately follows the currency_symbol.)</li>
%% </ul>
negative_number_sign_position (Culture) ->
  negative_number_sign_position (Culture, undefined).
negative_number_sign_position (Culture, Encoding) ->
  call_ (Culture, Encoding, 'n_sign_posn').

%% @doc Positive sign position.
%% See `negative_number_sign_position' for details.
positive_number_sign_position (Culture) ->
  positive_number_sign_position (Culture, undefined).
positive_number_sign_position (Culture, Encoding) ->
  call_ (Culture, Encoding, 'p_sign_posn').

%% @doc Int'l fractional digits.
fractional_digits_i10l (Culture) ->
  fractional_digits_i10l (Culture, undefined).
fractional_digits_i10l (Culture, Encoding) ->
  call_ (Culture, Encoding, 'int_frac_digits').

%% @doc Local fractional digits.
fractional_digits (Culture) ->
  fractional_digits (Culture, undefined).
fractional_digits (Culture, Encoding) ->
  call_ (Culture, Encoding, 'frac_digits').

%% @doc Int'l currency symbol.
currency_symbol_i10l (Culture) ->
  currency_symbol_i10l (Culture, undefined).
currency_symbol_i10l (Culture, Encoding) ->
  call_ (Culture, Encoding, 'int_curr_symbol').

%% @doc Local currency symbol.
currency_symbol (Culture) ->
  currency_symbol (Culture, undefined).
currency_symbol (Culture, Encoding) ->
  call_ (Culture, Encoding, 'currency_symbol').

%% @doc Monetary thousands separator.
monetary_thousands_separator (Culture) ->
  monetary_thousands_separator (Culture, undefined).
monetary_thousands_separator (Culture, Encoding) ->
  call_ (Culture, Encoding, 'mon_thousands_sep').

%% @doc Thousands separator (non-monetary).
thousands_separator (Culture) ->
  thousands_separator (Culture, undefined).
thousands_separator (Culture, Encoding) ->
  call_ (Culture, Encoding, 'thousands_sep').

%% @doc Monetary decimal point.
monetary_decimal_point (Culture) ->
  monetary_decimal_point (Culture, undefined).
monetary_decimal_point (Culture, Encoding) ->
  call_ (Culture, Encoding, 'mon_decimal_point').

%% @doc Decimal point (non-monetary).
decimal_point (Culture) ->
  decimal_point (Culture, undefined).
decimal_point (Culture, Encoding) ->
  call_ (Culture, Encoding, 'decimal_point').

%% @doc Positive sign.
positive_sign (Culture) ->
  positive_sign (Culture, undefined).
positive_sign (Culture, Encoding) ->
  call_ (Culture, Encoding, 'positive_sign').

%% @doc Negative sign.
negative_sign (Culture) ->
  negative_sign (Culture, undefined).
negative_sign (Culture, Encoding) ->
  call_ (Culture, Encoding, 'negative_sign').

%% @doc Grouping (non-monetary).
%% Each element is the number of digits in each group;
%% elements with higher indices are farther left.
%% An element with value CHAR_MAX means that no further grouping is done.
%% An element with value 0 means that the previous element is used
%% for all groups farther left.
grouping (Culture) ->
  grouping (Culture, undefined).
grouping (Culture, Encoding) ->
  call_ (Culture, Encoding, 'grouping').

%% @doc Monetary grouping.
%% See `grouping' for more details on return values.
monetary_grouping (Culture) ->
  monetary_grouping (Culture, undefined).
monetary_grouping (Culture, Encoding) ->
  call_ (Culture, Encoding, 'mon_grouping').


call_ (Culture, undefined, Key) ->
  call_ (Culture, "UTF-8", Key);
call_ (undefined, Encoding, Key) ->
  call_ ("C", Encoding, Key);
call_ (Culture, Encoding, Key) ->
  case lists:member (Key, ?ELOCALE_AVAILABLE_KEYS) of
    true ->
      XCult = string:to_lower (string:join (string:tokens (Culture, "_"), "")),
      XEnc = string:to_lower (string:join (string:tokens (Encoding, "-"), "")),
      Mod = list_to_atom ("elocale_table_"++XCult++"_"++XEnc),
      UlpErr = unknown_locale_property,
      UbkndErr = unknown_backend_error,
      case catch (Mod:t (Key)) of
        {ok, Value}             -> Value;
        {error, {UlpErr, _, _}} -> <<"">>;
        {error, _} = Error      -> Error;
        {'EXIT', Error}         -> {error, {UbkndErr, Culture, Encoding, Error}}
      end;
    false ->
      {error, {unknown_key, ?MODULE, Key}}
  end.


%% EUnit Tests
-ifdef (TEST).
-include_lib ("eunit/include/eunit.hrl").

common_test () ->
  ?assertEqual (<<"UTF-8">>, codeset ("C", "UTF-8")),
  ?assertEqual (<<"UTF-8">>, codeset ("C")),
  ?assertEqual (<<"UTF-8">>, codeset ("POSIX", undefined)),
  ?assertEqual (<<"UTF-8">>, codeset ("POSIX", "UTF-8")),
  ?assertEqual (<<"červen">>, mon (6, "cs_CZ")),
  ?assertEqual (<<"čen">>, abbrev_mon (6, "cs_CZ")),
  ?assertEqual (<<"Neděle">>, day (1, "cs_CZ")),
  ?assertEqual (<<"Ne">>, abbrev_day (1, "cs_CZ")),
  ?assertEqual (<<"CZK ">>, currency_symbol_i10l ("cs_CZ")),
  ?assertEqual (<<"Kč">>, currency_symbol ("cs_CZ")),
  ?assertEqual (<<"USD ">>, currency_symbol_i10l ("en_US")),
  ?assertEqual (<<"$">>, currency_symbol ("en_US")),
  ?assertEqual (<<"GBP ">>, currency_symbol_i10l ("en_GB")),
  ?assertEqual (<<"£">>, currency_symbol ("en_GB")),
  ?assertEqual (<<"IRR ">>, currency_symbol_i10l ("fa_IR")),
  ?assertEqual (<<"ریال">>, currency_symbol ("fa_IR")),
  ?assertEqual (<<"ano">>, yes_str ("cs_CZ")),
  ?assertEqual (<<"Yes">>, yes_str ("en_US")),
  ok.

-endif.

