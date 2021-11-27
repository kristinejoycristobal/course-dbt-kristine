{{
  config(
    materialized='table'
    , unique_key = 'product_guid'
  )
}}

    select
        *
    from 
        {{ ref('int_bc_products') }}