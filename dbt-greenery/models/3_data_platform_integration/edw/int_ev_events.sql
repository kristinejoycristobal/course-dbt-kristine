{{
  config(
    materialized='view'
    , unique_key = 'event_guid'
  )
}}

    with events as(
    select
        *
    from 
        {{ ref('stg_tutorial_events') }}
    )
    ,products as(
    select
        *
    from 
        {{ ref('stg_tutorial_products') }}
    )
    ,events_products_joined as(
    select 
        events.event_id
        , events.event_guid      
        , events.session_guid
        , events.event_type    
        , events.event_timestamp
        , events.user_guid
        , events.page_type
        , events.product_guid         
        , products.product_name
    from 
        events
    left join 
        products
        on 
        events.product_guid = products.product_guid
    where 
        events.event_timestamp is not null /* exclude null event_timestamp */
    )
    select * from events_products_joined