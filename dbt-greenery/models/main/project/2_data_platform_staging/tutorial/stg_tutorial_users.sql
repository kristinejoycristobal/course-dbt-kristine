{{
  config(
    materialized='view'
    , unique_key = 'user_guid'
  )
}}

    select
        id                  as user_id
        , user_id           as user_guid
        , first_name        as user_first_name
        , last_name         as user_last_name
        , email             as user_email
        , phone_number      as user_phone_number
        , address_id        as user_address_guid
        , created_at        as user_created_at
        , updated_at        as user_updated_at
    from 
        {{ source('tutorial', 'users') }}
