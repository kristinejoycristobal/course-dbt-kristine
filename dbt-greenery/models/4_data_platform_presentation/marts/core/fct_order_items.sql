{{
  config(
    materialized='table'
    , unique_key = 'order_product_guid'
  )
}}

    select
        *
    from 
        {{ ref('int_tr_order_items') }}