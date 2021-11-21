{% snapshot tutorial_order_items_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='id',
      strategy='check',
      check_cols="all"
    )
  }}

  select * 
  from {{ source('tutorial', 'order_items') }}

{% endsnapshot %}