{{
  config(
    materialized='view'
  )
}}

    with agg_user_orders_overall as(
        select 
            sum(case when total_orders_overall >= 2 then 1 else 0 end)::decimal as total_repeat_customers
            ,count(distinct user_guid)::decimal as total_users
        from  
        {{ ref('agg_user_orders_overall') }}
    )
    select *
        , round((total_repeat_customers / total_users) * 100) as percentage_repeat_rate
    from 
        agg_user_orders_overall