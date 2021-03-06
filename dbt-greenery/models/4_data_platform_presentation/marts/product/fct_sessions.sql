{%- set event_types = get_event_types() -%}

with agg_sessions as(
select
    user_guid
    ,session_guid
    ,min(event_timestamp) as session_start
    ,max(event_timestamp) as session_end
    ,{%- for event_type in event_types %}
        count( distinct case when event_type = '{{event_type}}' then event_id end) as total_{{event_type}}
    {%- if not loop.last %},{% endif -%}
    {% endfor %}
from 
  {{ ref('int_ev_events') }}
group by 
  1,
  2
)
select 
    user_guid
    ,session_guid
    ,session_start
    ,session_end
    ,total_page_view
    ,total_add_to_cart
    ,total_delete_from_cart
    ,total_checkout
    ,total_package_shipped
    ,(date_part('day', session_end - session_start) * 24 + 
      date_part('hour', session_end - session_start)) * 60 +
      date_part('minute', session_end - session_start) as session_duration_in_minutes
from 
  agg_sessions