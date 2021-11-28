## What is our user repeat rate?
80

```sql
SELECT 
  *
FROM 
  dbt_kristine.kpi_user_repeat_rate;
```

## What are good indicators of a user who will likely purchase again? 
high number of orders
more frequent user orders
## What about indicators of users who are likely NOT to purchase again? 
low number of orders
less frequent user orders
## If you had more data, what features would you want to look into to answer this question?

I would look into the recency, frequency and monetary (RFM) value of each user and answer the below questions:

Recency: How recently a user has made a purchase
Frequency: How often a user makes a purchase
Monetary Value: How much money a user spends on purchases


## Explain the marts models you added. Why did you organize the models in the way you did?

The way I organize the models and project in dbt is inspried by the  data platform architecture that I've been following and implementing in my current and past company.

![image](https://user-images.githubusercontent.com/85191840/143690593-04f7d0b5-9600-45e2-a181-bb21594296bf.png)

## Paste in an image of your DAG from the docs

![image](https://user-images.githubusercontent.com/85191840/143690524-8d8faa98-b17b-4bc3-8c75-2b088bc0da44.png)

## What assumptions are you making about each model? (i.e. why are you adding each test?)
- order_guid in the orders table should be unique and not null
- user_guid in the users table should be unique and not null
- delivered date is not before the order place data in fct_orders table
- session end date is not before the session start date in the fct_sessions table
- if foreign key is used in a table it should exist from the main table thru relationship checks


## Did you find any “bad” data as you added and ran tests on your models? 
Yes, as follows:

1. Having a null event_timestamp in the events table


```sql
select * from "dbt"."dbt_kristine_dbt_test__audit"."not_null_stg_tutorial_events_event_timestamp"
```

2. Having a negative amount for order_total in the orders table

```sql
select * from "dbt"."dbt_kristine_dbt_test__audit"."positive_values_stg_tutorial_orders_order_total"
```

3. Stale data in the following source tables:
  Orders
  Events
  Users

## How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
  To make sure no bad data will be supplied in the downstream presentantion layer, the following were applied to exclude bad data from the integration layer.

        orders.order_total > 0  /* exclude negative amount */
        events.event_timestamp is not null /* exclude null event_timestamp */

  Also, bespoke test in the staging layer to make sure these will be reported.

## Your stakeholders at Greenery want to understand the state of the data each day. 
## Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.

As a best practice, we would be scheduling a dbt test just after our scheduled dbt run to ensure that our tests are passing regularly.
And we would set up an email alert and a slack notification to alert the stakeholders.

