## 1.a What is our overall conversion rate?
36.10

```sql
SELECT 
  *
FROM 
  dbt_kristine.kpi_conversion_rate_overall;
```

![image](https://user-images.githubusercontent.com/85191840/144775996-de405bf9-4630-4796-8fe0-a20fc6ac7730.png)



## 1.b What is our conversion rate by product??

```sql
SELECT 
  *
FROM 
  dbt_kristine.kpi_conversion_rate_by_product;
```

![image](https://user-images.githubusercontent.com/85191840/144775927-08854d6b-a8a5-4bfc-a02c-c4b9c1a2f87a.png)



## 2. Macros created:
  * get_event_types
  * grant

## 3. Post-hook created:
  * added post-hook to grant select and schema usage permission to reporting role.

## 4. Installed packages:
  * dbt_utils
  * dbt_expectations
    - applying dbt_expectations.expect_table_row_count_to_equal_other_table in my mart models to make sure the number of rows match to the original table in staging
    - applying dbt_expectations.expect_column_values_to_be_in_set to get the list of expected event_types
    
## 5. dbt DAGs

![image](https://user-images.githubusercontent.com/85191840/144775726-fa0a8a11-428f-4eb9-a8e9-6cbd3342df7c.png)
