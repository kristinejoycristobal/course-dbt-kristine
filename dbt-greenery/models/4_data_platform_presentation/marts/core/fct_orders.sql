{{
  config(
    materialized='table'
    , unique_key = 'orders'
  )
}}

    select
        *
    from 
        {{ ref('int_tr_orders') }}