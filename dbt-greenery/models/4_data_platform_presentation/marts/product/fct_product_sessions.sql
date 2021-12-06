{%- set event_types = get_event_types() -%}

with agg_sessions as(
select
     product_guid
    ,product_name
    ,session_guid
    ,{%- for event_type in event_types %}
        count( distinct case when event_type = '{{event_type}}' then event_id end) as total_{{event_type}}
    {%- if not loop.last %},{% endif -%}
    {% endfor %}
from 
  {{ ref('int_ev_events') }}
where 
    product_name is not null
group by 
  1,
  2,
  3
)
select 
     product_guid
    ,product_name
    ,session_guid
    ,total_page_view
    ,total_add_to_cart
    ,total_delete_from_cart
    ,total_checkout
    ,total_package_shipped
from 
  agg_sessions
