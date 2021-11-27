{{
  config(
    materialized='table'
    , unique_key = 'user_guid'
  )
}}

    select
        *
    from 
        {{ ref('int_bc_users') }}