
select
    *
from 
  {{ ref('int_ev_events') }}
where
    event_type = 'page_view'
