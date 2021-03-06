-module (elocale_table_frfr_utf8).
-export ([t/1]).

t ('n_sep_by_space') -> {ok, <<"1">>};
t ('DAY_5') -> {ok, <<"jeudi">>};
t ('MON_1') -> {ok, <<"janvier">>};
t ('ERA_T_FMT') -> {ok, <<"">>};
t ('MON_12') -> {ok, <<"décembre">>};
t ('thousands_sep') -> {ok, <<" ">>};
t ('MON_2') -> {ok, <<"février">>};
t ('grouping') -> {ok, <<"">>};
t ('ERA_D_T_FMT') -> {ok, <<"">>};
t ('int_frac_digits') -> {ok, <<"2">>};
t ('ABMON_1') -> {ok, <<"janv.">>};
t ('MON_5') -> {ok, <<"mai">>};
t ('p_sign_posn') -> {ok, <<"1">>};
t ('int_curr_symbol') -> {ok, <<"EUR ">>};
t ('ABDAY_6') -> {ok, <<"ven.">>};
t ('T_FMT') -> {ok, <<"%T">>};
t ('ABDAY_7') -> {ok, <<"sam.">>};
t ('ABMON_2') -> {ok, <<"févr.">>};
t ('ABMON_10') -> {ok, <<"oct.">>};
t ('DAY_1') -> {ok, <<"dimanche">>};
t ('MON_6') -> {ok, <<"juin">>};
t ('mon_thousands_sep') -> {ok, <<" ">>};
t ('DAY_2') -> {ok, <<"lundi">>};
t ('ABMON_5') -> {ok, <<"mai">>};
t ('ABMON_11') -> {ok, <<"nov.">>};
t ('p_cs_precedes') -> {ok, <<"0">>};
t ('AM_STR') -> {ok, <<"">>};
t ('ABMON_4') -> {ok, <<"avril">>};
t ('PM_STR') -> {ok, <<"">>};
t ('YESSTR') -> {ok, <<"">>};
t ('ABDAY_1') -> {ok, <<"dim.">>};
t ('currency_symbol') -> {ok, <<"€">>};
t ('MON_11') -> {ok, <<"novembre">>};
t ('negative_sign') -> {ok, <<"-">>};
t ('THOUSEP') -> {ok, <<" ">>};
t ('ALT_DIGITS') -> {ok, <<"">>};
t ('MON_10') -> {ok, <<"octobre">>};
t ('DAY_6') -> {ok, <<"vendredi">>};
t ('n_cs_precedes') -> {ok, <<"0">>};
t ('T_FMT_AMPM') -> {ok, <<"">>};
t ('mon_decimal_point') -> {ok, <<",">>};
t ('D_FMT') -> {ok, <<"%d/%m/%Y">>};
t ('p_sep_by_space') -> {ok, <<"1">>};
t ('ABMON_7') -> {ok, <<"juil.">>};
t ('mon_grouping') -> {ok, <<"">>};
t ('ABMON_6') -> {ok, <<"juin">>};
t ('DAY_3') -> {ok, <<"mardi">>};
t ('MON_7') -> {ok, <<"juillet">>};
t ('NOSTR') -> {ok, <<"">>};
t ('frac_digits') -> {ok, <<"2">>};
t ('ERA_D_FMT') -> {ok, <<"">>};
t ('MON_9') -> {ok, <<"septembre">>};
t ('D_T_FMT') -> {ok, <<"%a %d %b %Y %T %Z">>};
t ('MON_8') -> {ok, <<"août">>};
t ('ABMON_9') -> {ok, <<"sept.">>};
t ('DAY_7') -> {ok, <<"samedi">>};
t ('ABDAY_2') -> {ok, <<"lun.">>};
t ('CODESET') -> {ok, <<"UTF-8">>};
t ('YESEXPR') -> {ok, <<"^[oOyY].*">>};
t ('CRNCYSTR') -> {ok, <<"+€">>};
t ('ABMON_8') -> {ok, <<"août">>};
t ('n_sign_posn') -> {ok, <<"1">>};
t ('RADIXCHAR') -> {ok, <<",">>};
t ('MON_4') -> {ok, <<"avril">>};
t ('NOEXPR') -> {ok, <<"^[nN].*">>};
t ('ABMON_3') -> {ok, <<"mars">>};
t ('ABDAY_3') -> {ok, <<"mar.">>};
t ('DAY_4') -> {ok, <<"mercredi">>};
t ('ERA') -> {ok, <<"">>};
t ('MON_3') -> {ok, <<"mars">>};
t ('ABDAY_5') -> {ok, <<"jeu.">>};
t ('decimal_point') -> {ok, <<",">>};
t ('ABMON_12') -> {ok, <<"déc.">>};
t ('ABDAY_4') -> {ok, <<"mer.">>};
t (P) -> {error, {unknown_locale_property, ?MODULE, P}}.

