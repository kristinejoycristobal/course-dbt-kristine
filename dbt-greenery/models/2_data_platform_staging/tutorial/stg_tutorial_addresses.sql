{{
  config(
    materialized='view'
    , unique_key = 'address_guid'
  )
}}

    select
        id                  as address_id
        , address_id        as address_guid
        , address           
        , zipcode
        , state
        , country
    from 
        {{ source('tutorial', 'addresses') }}