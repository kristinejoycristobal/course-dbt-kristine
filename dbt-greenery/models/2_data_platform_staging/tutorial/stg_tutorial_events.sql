{{
  config(
    materialized='view'
    , unique_key = 'event_guid'
  )
}}
    select
        id                              as event_id
        , event_id                      as event_guid           
        , session_id                    as session_guid
        , event_type
        , created_at                    as event_timestamp
        , user_id                       as user_guid
        , split_part(page_url, '/', 4)  as page_type
        , split_part(page_url, '/', 5)  as product_guid
        , page_url

    from 
        {{ source('tutorial', 'events') }}