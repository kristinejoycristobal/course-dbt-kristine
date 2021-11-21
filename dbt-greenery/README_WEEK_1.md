## How many users do we have?
Total of 130 users

```sql
SELECT 
  COUNT(DISTINCT user_id) AS total_distinct_user_id
  ,COUNT(DISTINCT user_guid) AS total_distinct_user_guid
  ,COUNT(DISTINCT user_guid) AS total_distinct_user_email
FROM 
  dbt_kristine.stg_tutorial_users;
```

## On average, how many orders do we receive per hour?
Average of 8 orders per hour

```sql
WITH agg_orders AS
(
SELECT 
  DATE_TRUNC('hour', order_created_at) AS order_created_date_hour
  ,COUNT(1) AS total_orders
FROM 
  dbt_kristine.stg_tutorial_orders
GROUP BY 1
)
SELECT 
  ROUND(AVG(total_orders)) AS average_orders
FROM 
  agg_orders;
```

## On average, how long does an order take from being placed to being delivered?
Average of 4 days

```sql
WITH delivered_orders AS(
  SELECT
      order_id
    , order_guid
    , order_created_at
    , delivered_at
    , DATE_PART('day',delivered_at) - DATE_PART('day',order_created_at) AS delivery_duration_in_days 
  FROM
    dbt_kristine.stg_tutorial_orders
  WHERE
    order_status = 'delivered'
)
SELECT
  ROUND(AVG(delivery_duration_in_days)) AS average_delivery_duration_in_days
FROM
  delivered_orders;
```


## How many users only made one purchase? Two purchases? Three + purchases?

Business question: How do we define purchase? 

If same definition as orders:

1 purchase | 2 purchases | 3+ purchases
-----------|-------------|--------------
    25     |      22     |       81


If purchase is define as paid product, I think pending orders need to be excluded? 
If yes, then:

1 purchase | 2 purchases | 3+ purchases
-----------|-------------|--------------
    25     |      25     |       78

```sql
WITH purchased_orders AS(
  SELECT 
     user_guid
    , COUNT(DISTINCT order_guid) AS total_purchased 
  FROM 
    dbt_kristine.stg_tutorial_orders 
  --WHERE order_status != 'pending'
  GROUP BY 1
)
SELECT 
  CASE 
    WHEN total_purchased = 1 then '1 purchase' 
    WHEN total_purchased = 2 then '2 purchases' 
    WHEN total_purchased >= 3 then '3+ purchases' 
    ELSE 'Unknown' 
  END AS purchased_bucket
  ,COUNT(DISTINCT user_guid) total_users 
FROM 
  purchased_orders
GROUP BY 1 
ORDER BY 1;
```

## On average, how many unique sessions do we have per hour?

Average of 7  sessions per hour - Overall

Average of 1  session per hour in 2020
Average of 31 sessions per hour in 2021

```sql
WITH agg_sessions AS(
  SELECT 
    DATE_TRUNC('hour',event_timestamp) AS event_datehour
    , COUNT(DISTINCT session_guid) AS total_sessions 
  FROM 
    dbt_kristine.stg_tutorial_events 
  --WHERE DATE_TRUNC('day', event_timestamp) < '2021-01-01'
  GROUP BY 1
)
SELECT 
  AVG(total_sessions) AS average_sessions_per_hour
FROM
  agg_sessions
;
```