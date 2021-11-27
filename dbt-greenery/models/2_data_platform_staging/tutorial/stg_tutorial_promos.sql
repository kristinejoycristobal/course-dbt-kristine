{{
  config(
    materialized='view'
    , unique_key = 'promo_code'
  )
}}

    select
        id                  as promo_id
        , lower(promo_id)   as promo_code 
        , discout           as promo_discount_percentage
        , status            as promo_status
    from 
        {{ source('tutorial', 'promos') }}