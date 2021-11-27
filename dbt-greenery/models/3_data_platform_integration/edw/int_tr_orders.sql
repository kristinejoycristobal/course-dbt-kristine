{{
  config(
    materialized='view'
    , unique_key = 'order_guid'
  )
}}

    with orders as(
    select
        *
    from 
        {{ ref('stg_tutorial_orders') }}
    )
    ,promos as(
    select
        *
    from 
        {{ ref('stg_tutorial_promos') }}
    )
    ,orders_promos_joined as(
    select 
        orders.order_id
        , orders.order_guid      
        , orders.order_status
        , orders.order_created_at    
        , orders.promo_code
        , promos.promo_discount_percentage
        , orders.order_cost
        , orders.shipping_cost         
        , orders.order_total
        , orders.user_guid
        , orders.delivery_address_guid      
        , orders.estimated_delivery_at
        , orders.tracking_guid
        , orders.shipping_service  
        , orders.delivered_at
    from 
        orders
    left join 
        promos
        on 
        orders.promo_code = promos.promo_code
    )
    select * from orders_promos_joined