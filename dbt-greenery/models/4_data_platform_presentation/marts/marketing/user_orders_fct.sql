
    select 
         user_guid
        , date(order_created_at) as order_date  
        , round(sum(order_total)) as total_order_amount
    from 
       {{ ref('int_tr_orders') }}
    where 
        order_created_at is not null
    group by 
        1,
        2