{{
  config(
    materialized='view'
    , unique_key = 'order_product_guid'
  )
}}

    select
        id              as order_item_id
        , coalesce(order_id,'') ||'-'|| coalesce(product_id,'') as order_product_guid
        , order_id      as order_guid
        , product_id    as product_guid           
        , quantity      as order_quantity
    from 
        {{ source('tutorial', 'order_items') }}