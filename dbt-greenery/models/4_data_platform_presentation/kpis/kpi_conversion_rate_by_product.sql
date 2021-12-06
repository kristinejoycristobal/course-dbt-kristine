{{
  config(
    materialized='view'
  )
}}

    with agg_product_sessions as(
        select 
            product_name
            ,count(distinct session_guid)::decimal as total_sessions
            ,sum(total_add_to_cart)::decimal as total_converted_product
        from  
        {{ ref('fct_product_sessions') }}
        group by 
            1
    )
    select *
        , round(( total_converted_product / total_sessions) * 100, 2) as product_conversion_rate
    from 
        agg_product_sessions