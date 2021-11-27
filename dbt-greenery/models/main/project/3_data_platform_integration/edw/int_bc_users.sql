{{
  config(
    materialized='view'
    , unique_key = 'user_guid'
  )
}}

    with users as(
    select
        *
    from 
        {{ ref('stg_tutorial_users') }}
    )
    ,addresses as(
    select
        *
    from 
        {{ ref('stg_tutorial_addresses') }}
    )
    ,users_addresses_joined as(
    select 
          users.user_id
        , users.user_guid
        , users.user_created_at
        , users.user_updated_at
        , users.user_first_name
        , users.user_last_name
        , users.user_email
        , users.user_phone_number
        , users.user_address_guid
        , addresses.address as user_address          
        , addresses.zipcode as user_zipcode
        , addresses.state   as user_state
        , addresses.country as user_country
    from 
        users
    left join 
        addresses
    on 
        users.user_address_guid = addresses.address_guid
    )
    select * from users_addresses_joined