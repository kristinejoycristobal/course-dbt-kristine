
with agg_sessions as(
        select
            count(distinct session_guid)::decimal as total_sessions
            ,count(distinct case when event_type in ('page_view','add_to_cart','checkout') then session_guid end )::decimal as total_sessions_with_page_view
            ,count(distinct case when event_type in ('add_to_cart','checkout')  then session_guid  end )::decimal as total_sessions_with_add_to_cart
            ,count(distinct case when event_type = 'checkout' then session_guid  end )::decimal as total_sessions_with_checkout
        from  
            {{ ref('fct_events') }}
)

select
     *
    ,round(((total_sessions_with_page_view - total_sessions ) / total_sessions ) * 100, 2) as percentage_dropoff_pageviews_to_sessions
    ,round(((total_sessions_with_add_to_cart - total_sessions_with_page_view ) / total_sessions_with_page_view ) * 100, 2) as percentage_dropoff_addtocarts_to_pageviews
    ,round(((total_sessions_with_checkout - total_sessions_with_add_to_cart ) / total_sessions_with_add_to_cart ) * 100, 2) as percentage_dropoff_checkouts_to_addtocarts
from 
    agg_sessions