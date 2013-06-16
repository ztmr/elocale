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
  
