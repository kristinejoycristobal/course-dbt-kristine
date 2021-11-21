{{
  config(
    materialized='view'
    , unique_key = 'order_guid'
  )
}}

    select
        id                          as order_id
        , order_id                  as order_guid      
        , status                    as order_status
        , created_at                as order_created_at    
        , lower(promo_id)           as promo_code
        , order_cost
        , shipping_cost 
        , shipping_service          
        , order_total
        , user_id                   as user_guid
        , address_id                as address_guid
        , tracking_id               as tracking_guid
        , estimated_delivery_at     as estimated_delivery_at
        , delivered_at              as delivered_at

    from 
        {{ source('tutorial', 'orders') }}