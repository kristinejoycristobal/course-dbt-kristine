
with agg_sessions as(
select
    user_guid
    ,session_guid
    ,min(event_timestamp) as session_start
    ,max(event_timestamp) as session_end
    ,count(distinct case when event_type = 'page_view' then event_id end) AS total_page_view
    ,count(distinct case when event_type = 'add_to_cart' then event_id end) AS total_add_to_cart
    ,count(distinct case when event_type = 'delete_from_cart' then event_id end) AS total_delete_from_cart
    ,count(distinct case when event_type = 'checkout' then event_id end) AS total_checkout
    ,count(distinct case when event_type = 'package_shipped' then event_id end) AS total_package_shipped
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