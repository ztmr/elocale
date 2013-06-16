POSIX locale API for Erlang
===========================
```Erlang
  <<"UTF-8">> = elocale:codeset ("C", "UTF-8").
  <<"UTF-8">> = elocale:codeset ("C").
  <<"UTF-8">> = elocale:codeset ("POSIX", undefined).
  <<"UTF-8">> = elocale:codeset ("POSIX", "UTF-8").
  <<"červen">> = elocale:mon (6, "cs_CZ").
  <<"čen">> = elocale:abbrev_mon (6, "cs_CZ").
  <<"Neděle">> = elocale:day (1, "cs_CZ").
  <<"Ne">> = elocale:abbrev_day (1, "cs_CZ").
  <<"CZK ">> = elocale:currency_symbol_i10l ("cs_CZ").
  <<"Kč">> = elocale:currency_symbol ("cs_CZ").
  <<"USD ">> = elocale:currency_symbol_i10l ("en_US").
  <<"$">> = elocale:currency_symbol ("en_US").
  <<"GBP ">> = elocale:currency_symbol_i10l ("en_GB").
  <<"£">> = elocale:currency_symbol ("en_GB").
  <<"IRR ">> = elocale:currency_symbol_i10l ("fa_IR").
  <<"ریال">> = elocale:currency_symbol ("fa_IR").
  <<"%a %d %b %Y %r %Z">> = elocale:datetime_fmt ("en_US").
  <<"%a %d %b %Y %T %Z">> = elocale:datetime_fmt ("en_GB").
  <<"%a %d %b %Y %T">> = elocale:datetime_fmt ("ru_RU").
  <<"^[aAyY].*">> = elocale:yes_expression ("cs_CZ").
  <<"^[nN].*">> = elocale:no_expression ("cs_CZ").
```

Note that the date/time formats conforms to POSIX standards
and cannot be used directly from bare Erlang.
Of course, there are libraries like this:
[http://github.com/kennystone/strftimerl](http://github.com/kennystone/strftimerl).

Also don't forget to configure your operating system to support
all the locales you're going to generate. The procedure should
be as easy as the following Linux command:
```
  sudo localedef -v -c -i cs_CZ -f UTF-8 cs_CZ.UTF-8
```

The current EUnit test suite expects the support of at least
locales pre-generated and shipped with this project:
`C`, `POSIX`, `cs_CZ`, `en_US`, `en_GB`, `fa_IR`, `ru_RU`, `fr_FR`
(all of them are encoded with UTF-8).
