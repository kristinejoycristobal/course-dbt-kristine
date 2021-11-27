{{
  config(
    materialized='view'
    , unique_key = 'product_guid'
  )
}}

    select
        *
    from 
        {{ ref('stg_tutorial_products') }}