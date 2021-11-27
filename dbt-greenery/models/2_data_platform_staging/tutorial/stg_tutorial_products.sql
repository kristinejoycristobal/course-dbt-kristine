{{
  config(
    materialized='view'
    , unique_key = 'product_guid'
  )
}}

    select
        id                  as product_id
        , product_id        as product_guid
        , name              as product_name
        , price             as product_price
        , quantity          as product_quantity
    from 
        {{ source('tutorial', 'products') }}