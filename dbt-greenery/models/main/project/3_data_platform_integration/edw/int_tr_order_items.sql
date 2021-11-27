{{
  config(
    materialized='view'
    , unique_key = 'order_product_guid'
  )
}}

    with order_items as(
    select
        *
    from 
        {{ ref('stg_tutorial_order_items') }}
    )
    ,orders as(
    select
        *
    from 
        {{ ref('stg_tutorial_orders') }}
    )
    ,products as(
    select
        *
    from 
        {{ ref('stg_tutorial_products') }}
    )
    ,order_items_products_joined as(
    select 
        order_items.order_product_guid
        , order_items.order_guid
        , orders.order_created_at
        , order_items.order_item_id
        , order_items.product_guid       
        , products.product_name
        , products.product_price  
        , order_items.order_quantity
    from 
        order_items
    left join 
        orders
        on 
        order_items.order_guid = orders.order_guid
    left join 
        products
        on 
        order_items.product_guid = products.product_guid
    )
    select * from order_items_products_joined