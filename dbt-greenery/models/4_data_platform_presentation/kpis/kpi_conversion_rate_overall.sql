{{
  config(
    materialized='view'
  )
}}

    with agg_sessions as(
        select 
            count(distinct session_guid)::decimal as total_sessions
            ,sum(total_checkout)::decimal as total_converted_sessions
        from  
        {{ ref('fct_sessions') }}
    )
    select *
        , round((total_converted_sessions / total_sessions) * 100, 2) as overall_conversion_rate
    from 
        agg_sessions
