if exists("b:current_syntax")
 finish
endif

syn case ignore

syn keyword hivesqlSpecial   false null true

syn keyword hivesqlKeyword   access add as asc begin by check cluster column
syn keyword hivesqlKeyword   compress connect current cursor decimal default desc
syn keyword hivesqlKeyword   else elsif end exception exclusive file for from
syn keyword hivesqlKeyword   function group having identified if immediate increment
syn keyword hivesqlKeyword   index initial into is level loop maxextents mode modify
syn keyword hivesqlKeyword   nocompress nowait of offline on online start
syn keyword hivesqlKeyword   successful synonym table then to trigger uid
syn keyword hivesqlKeyword   unique user validate values view whenever hivevar
syn keyword hivesqlKeyword   where with option order pctfree privileges procedure
syn keyword hivesqlKeyword   public resource return row rowlabel rownum rows
syn keyword hivesqlKeyword   session share size smallint type using full outer join right inner
syn keyword hivesqlKeyword   format delimited fields terminated by collection items external
syn keyword hivesqlKeyword   stored sequencefile partitioned data local inpath overwrite clustered buckets sorted
syn keyword hivesqlKeyword   keys extended textfile location distribute directory tablesample using reduce lateral
syn keyword hivesqlKeyword   coalesce case when

syn keyword hivesqlOperator  not and or < <= == >= > <> !=
syn keyword hivesqlOperator  in any some all between exists
syn keyword hivesqlOperator  like escape rlike regexp
syn keyword hivesqlOperator  union intersect minus
syn keyword hivesqlOperator  prior distinct isnull count
syn keyword hivesqlOperator  sysdate out
syn keyword hivesqlOperator  round floor ceil rand concat substr upper ucase
syn keyword hivesqlOperator  lower lcase trim ltrim rtrim regexp_replace size
syn keyword hivesqlOperator  cast from_unixtime to_date year month day get_json_object
syn keyword hivesqlOperator  sum avg min max transform
syn keyword hivesqlOperator  variance var_samp stddev_pop stddev_samp
syn keyword hivesqlOperator  covar_pop covar_samp corr percentile percentil_approx
syn keyword hivesqlOperator  histogram_numeric collect_set inline explode
syn keyword hivesqlOperator  exp ln log10 log2 log pow sqrt bin hex unhex conv
syn keyword hivesqlOperator  abs pmod sin asin cos acos tan atan degrees radians
syn keyword hivesqlOperator  positive negative sign e pi binary
syn keyword hivesqlOperator  map_keys map_values array_contains sort_array
syn keyword hivesqlOperator  unix_timestamp dayofmonth hour minute second weekofyear
syn keyword hivesqlOperator  datediff date_add date_sub from_utc_timestamp to_utc_timestamp
syn keyword hivesqlOperator  ascii context_ngrams concate_ws find_in_set format_number
syn keyword hivesqlOperator  in_file instr length locate lpad ltrim ngrams parse_url
syn keyword hivesqlOperator  printf regexp_extract repeat reverse rpad trim sentences
syn keyword hivesqlOperator  space split str_to_map translate trim java_method reflect
syn keyword hivesqlOperator  xpath xpath_string xpath_boolean xpath_short xpath_int xpath_long xpath_float xpath_double xpath_number

syn keyword hivesqlStatement alter analyze audit comment commit create
syn keyword hivesqlStatement delete drop execute explain grant insert lock noaudit
syn keyword hivesqlStatement rename revoke rollback savepoint select set
syn keyword hivesqlStatement truncate update describe load use

syn keyword hivesqlType      tinyint smallint int bigint float double boolean string
syn keyword hivesqlType      array map struct named_struct create_union timestamp date varchar char

syn match   hivesqlVar       "hive\.[a-zA-Z.]\+"
syn match   hivesqlVar       "mapred\.[a-zA-Z.]\+"
syn match   hivesqlVar       "$(\([A-Za-z0-9_]\)*)"

syn region  hivesqlString    start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region  hivesqlString    start=+'+ skip=+\\\\\|\\'+ end=+'+

syn match   hivesqlNumber    "-\=\<\d*\.\=[0-9_]\>"

syn region  hivesqlComment   start="/\*" end="\*/" contains=sqlTodo
syn match   hivesqlComment   "--.*$" contains=sqlTodo
syn match   hivesqlComment   "#.*$" contains=sqlTodo
syn sync    ccomment         hivesqlComment

syn keyword hivesqlTodo      contained TODO FIXME XXX DEBUG NOTE

hi def link hivesqlComment   Comment
hi def link hivesqlKeyword   Identifier
hi def link hivesqlNumber    Number
hi def link hivesqlOperator  Constant
hi def link hivesqlSpecial   Special
hi def link hivesqlStatement Statement
hi def link hivesqlString    String
hi def link hivesqlType      Type
hi def link hivesqlTodo      Todo
hi def link hivesqlVar       PreProc

let b:current_syntax = "hiveql"
