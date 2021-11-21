{% snapshot tutorial_orders_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='id',
      strategy='check',
      check_cols="all"
    )
  }}

  select * 
  from {{ source('tutorial', 'orders') }}

{% endsnapshot %}