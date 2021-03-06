-module (elocale_table_fair_utf8).
-export ([t/1]).

t ('n_sep_by_space') -> {ok, <<"1">>};
t ('DAY_5') -> {ok, <<"پنجشنبه">>};
t ('MON_1') -> {ok, <<"ژانویه">>};
t ('ERA_T_FMT') -> {ok, <<"">>};
t ('MON_12') -> {ok, <<"دسامبر">>};
t ('thousands_sep') -> {ok, <<",">>};
t ('MON_2') -> {ok, <<"فوریه">>};
t ('grouping') -> {ok, <<"">>};
t ('ERA_D_T_FMT') -> {ok, <<"">>};
t ('int_frac_digits') -> {ok, <<"0">>};
t ('ABMON_1') -> {ok, <<"ژانویه">>};
t ('MON_5') -> {ok, <<"مه">>};
t ('p_sign_posn') -> {ok, <<"1">>};
t ('int_curr_symbol') -> {ok, <<"IRR ">>};
t ('ABDAY_6') -> {ok, <<"جمعه">>};
t ('T_FMT') -> {ok, <<"%OH:%OM:%OS">>};
t ('ABDAY_7') -> {ok, <<"شنبه">>};
t ('ABMON_2') -> {ok, <<"فوریه">>};
t ('ABMON_10') -> {ok, <<"اكتبر">>};
t ('DAY_1') -> {ok, <<"یکشنبه">>};
t ('MON_6') -> {ok, <<"ژوئن">>};
t ('mon_thousands_sep') -> {ok, <<"٬">>};
t ('DAY_2') -> {ok, <<"دوشنبه">>};
t ('ABMON_5') -> {ok, <<"مه">>};
t ('ABMON_11') -> {ok, <<"نوامبر">>};
t ('p_cs_precedes') -> {ok, <<"0">>};
t ('AM_STR') -> {ok, <<"">>};
t ('ABMON_4') -> {ok, <<"آوریل">>};
t ('PM_STR') -> {ok, <<"">>};
t ('YESSTR') -> {ok, <<"">>};
t ('ABDAY_1') -> {ok, <<"یکشنبه">>};
t ('currency_symbol') -> {ok, <<"ریال">>};
t ('MON_11') -> {ok, <<"نوامبر">>};
t ('negative_sign') -> {ok, <<"-">>};
t ('THOUSEP') -> {ok, <<",">>};
t ('ALT_DIGITS') -> {ok, <<"۰۰">>};
t ('MON_10') -> {ok, <<"اكتبر">>};
t ('DAY_6') -> {ok, <<"جمعه">>};
t ('n_cs_precedes') -> {ok, <<"0">>};
t ('T_FMT_AMPM') -> {ok, <<"">>};
t ('mon_decimal_point') -> {ok, <<"٫">>};
t ('D_FMT') -> {ok, <<"%Oy/%Om/%Od">>};
t ('p_sep_by_space') -> {ok, <<"1">>};
t ('ABMON_7') -> {ok, <<"ژوئیه">>};
t ('mon_grouping') -> {ok, <<"">>};
t ('ABMON_6') -> {ok, <<"ژوئن">>};
t ('DAY_3') -> {ok, <<"سه‌شنبه">>};
t ('MON_7') -> {ok, <<"ژوئیه">>};
t ('NOSTR') -> {ok, <<"">>};
t ('frac_digits') -> {ok, <<"0">>};
t ('ERA_D_FMT') -> {ok, <<"">>};
t ('MON_9') -> {ok, <<"سپتامبر">>};
t ('D_T_FMT') -> {ok, <<"‫%A %Oe %B %Oy، %OH:%OM:%OS‬">>};
t ('MON_8') -> {ok, <<"اوت">>};
t ('ABMON_9') -> {ok, <<"سپتامبر">>};
t ('DAY_7') -> {ok, <<"شنبه">>};
t ('ABDAY_2') -> {ok, <<"دوشنبه">>};
t ('CODESET') -> {ok, <<"UTF-8">>};
t ('YESEXPR') -> {ok, <<"^[yYآبHf].*">>};
t ('CRNCYSTR') -> {ok, <<"+ریال">>};
t ('ABMON_8') -> {ok, <<"اوت">>};
t ('n_sign_posn') -> {ok, <<"1">>};
t ('RADIXCHAR') -> {ok, <<".">>};
t ('MON_4') -> {ok, <<"آوریل">>};
t ('NOEXPR') -> {ok, <<"^[nNخنok].*">>};
t ('ABMON_3') -> {ok, <<"مارس">>};
t ('ABDAY_3') -> {ok, <<"سه‌شنبه">>};
t ('DAY_4') -> {ok, <<"چهارشنبه">>};
t ('ERA') -> {ok, <<"">>};
t ('MON_3') -> {ok, <<"مارس">>};
t ('ABDAY_5') -> {ok, <<"پنجشنبه">>};
t ('decimal_point') -> {ok, <<".">>};
t ('ABMON_12') -> {ok, <<"دسامبر">>};
t ('ABDAY_4') -> {ok, <<"چهارشنبه">>};
t (P) -> {error, {unknown_locale_property, ?MODULE, P}}.

