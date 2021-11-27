
    select 
         user_guid
        , count(distinct order_guid)  as total_orders_overall
        , round(sum(order_total))     as total_order_amount_overall
    from 
       {{ ref('fct_orders') }}
    group by 
        1