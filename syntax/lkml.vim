if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "lkml"

syntax sync fromstart

" View Keywords
syntax keyword lkmlViewKeyword alias
syntax keyword lkmlViewKeyword alpha_sort
syntax keyword lkmlViewKeyword approximate
syntax keyword lkmlViewKeyword approximate_threshold
syntax keyword lkmlViewKeyword bypass_suggest_restrictions
syntax keyword lkmlViewKeyword can_filter
syntax keyword lkmlViewKeyword case
syntax keyword lkmlViewKeyword case_sensitive
syntax keyword lkmlViewKeyword convert_tz
syntax keyword lkmlViewKeyword datatype
syntax keyword lkmlViewKeyword default_value
syntax keyword lkmlViewKeyword derived_table
syntax keyword lkmlViewKeyword description
syntax keyword lkmlViewKeyword dimension
syntax keyword lkmlViewKeyword dimension_group
syntax keyword lkmlViewKeyword direction
syntax keyword lkmlViewKeyword distribution
syntax keyword lkmlViewKeyword distribution_style
syntax keyword lkmlViewKeyword drill_fields
syntax keyword lkmlViewKeyword fanout_on
syntax keyword lkmlViewKeyword field
syntax keyword lkmlViewKeyword fields
syntax keyword lkmlViewKeyword filter
syntax keyword lkmlViewKeyword filters
syntax keyword lkmlViewKeyword full_suggestions
syntax keyword lkmlViewKeyword group_label
syntax keyword lkmlViewKeyword hidden
syntax keyword lkmlViewKeyword html
syntax keyword lkmlViewKeyword icon_url
syntax keyword lkmlViewKeyword indexes
syntax keyword lkmlViewKeyword label
syntax keyword lkmlViewKeyword link
syntax keyword lkmlViewKeyword list_field
syntax keyword lkmlViewKeyword map_layer_name
syntax keyword lkmlViewKeyword measure
syntax keyword lkmlViewKeyword order_by_field
syntax keyword lkmlViewKeyword persist_for
syntax keyword lkmlViewKeyword primary_key
syntax keyword lkmlViewKeyword required_fields
syntax keyword lkmlViewKeyword set
syntax keyword lkmlViewKeyword skip_drill_filter
syntax keyword lkmlViewKeyword sortkeys
syntax keyword lkmlViewKeyword sql_distinct_key
syntax keyword lkmlViewKeyword sql_latitude
syntax keyword lkmlViewKeyword sql_longitude
syntax keyword lkmlViewKeyword sql_table_name
syntax keyword lkmlViewKeyword style
syntax keyword lkmlViewKeyword suggest_dimension
syntax keyword lkmlViewKeyword suggest_explore
syntax keyword lkmlViewKeyword suggest_persist_for
syntax keyword lkmlViewKeyword suggestable
syntax keyword lkmlViewKeyword suggestions
syntax keyword lkmlViewKeyword tiers
syntax keyword lkmlViewKeyword timeframes
syntax keyword lkmlViewKeyword type
syntax keyword lkmlViewKeyword url
syntax keyword lkmlViewKeyword value
syntax keyword lkmlViewKeyword value_format
syntax keyword lkmlViewKeyword value_format_name
syntax keyword lkmlViewKeyword view
syntax keyword lkmlViewKeyword view_label
syntax keyword lkmlViewKeyword when

highlight link lkmlViewKeyword Keyword

" Model keywords
syntax keyword lkmlModelKeyword access_filter_fields
syntax keyword lkmlModelKeyword always_filter
syntax keyword lkmlModelKeyword always_join
syntax keyword lkmlModelKeyword cancel_grouping_fields
syntax keyword lkmlModelKeyword case_sensitive
syntax keyword lkmlModelKeyword conditionally_filter
syntax keyword lkmlModelKeyword connection
syntax keyword lkmlModelKeyword description
syntax keyword lkmlModelKeyword explore
syntax keyword lkmlModelKeyword field
syntax keyword lkmlModelKeyword fields
syntax keyword lkmlModelKeyword filters
syntax keyword lkmlModelKeyword foreign_key
syntax keyword lkmlModelKeyword from
syntax keyword lkmlModelKeyword hidden
syntax keyword lkmlModelKeyword include
syntax keyword lkmlModelKeyword join
syntax keyword lkmlModelKeyword label
syntax keyword lkmlModelKeyword named_value_format
syntax keyword lkmlModelKeyword persist_for
syntax keyword lkmlModelKeyword relationship
syntax keyword lkmlModelKeyword required_joins
syntax keyword lkmlModelKeyword sql_always_where
syntax keyword lkmlModelKeyword sql_on
syntax keyword lkmlModelKeyword sql_table_name
syntax keyword lkmlModelKeyword symmetric_aggregates
syntax keyword lkmlModelKeyword type
syntax keyword lkmlModelKeyword unless
syntax keyword lkmlModelKeyword value
syntax keyword lkmlModelKeyword value_format
syntax keyword lkmlModelKeyword view_label
syntax keyword lkmlModelKeyword view_name
syntax keyword lkmlModelKeyword week_start_day

highlight link lkmlModelKeyword Keyword

" Comment
syntax match lkmlComment /\v#.*$/

highlight link lkmlComment Comment

" String
syntax region lkmlString start=/\v"/ skip=/\v\\./ end=/\v"/

highlight link lkmlString String

" SQL
syntax match lkmlSql /\<sql\w*:\_.\{-};;/ contains=lkmlSqlStatement,lkmlSqlBody
syntax keyword lkmlSqlStatement sql contained nextgroup=lkmlSqlBody
syntax keyword lkmlSqlStatement sql_trigger_value contained nextgroup=lkmlSqlBody
syntax region lkmlSqlBody start=/:\zs/ end=/\ze;;/ contained

highlight link lkmlSqlBody String
highlight link lkmlSqlStatement Keyword

" Bool
syntax keyword lkmlBoolean yes no

highlight link lkmlBoolean Boolean
