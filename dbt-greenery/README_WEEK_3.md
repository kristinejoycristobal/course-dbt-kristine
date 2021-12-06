## 1.a What is our overall conversion rate?
36.10

```sql
SELECT 
  *
FROM 
  dbt_kristine.kpi_conversion_rate_overall;
```

| total_sessions | total_converted_sessions | overall_conversion_rate |
|----------------+--------------------------+-------------------------|
|           1108 |                      400 |                   36.10 |


## 1.b What is our conversion rate by product??

```sql
SELECT 
  *
FROM 
  dbt_kristine.kpi_conversion_rate_by_product;
```

|   product_name      | total_sessions | total_converted_product | product_conversion_rate |
|---------------------|----------------+-------------------------+-------------------------|
| Alocasia Polly      |             50 |                      28 |                   56.00 |
| Aloe Vera           |             59 |                      38 |                   64.41 |
| Angel Wings Begonia |             45 |                      31 |                   68.89 |
| Arrow Head          |             73 |                      41 |                   56.16 |
| Bamboo              |             71 |                      38 |                   53.52 |
| Bird of Paradise    |             59 |                      35 |                   59.32 |
| Birds Nest Fern     |             63 |                      35 |                   55.56 |
| Boston Fern         |             53 |                      32 |                   60.38 |
| Cactus              |             61 |                      33 |                   54.10 |
| Calathea Makoyana   |             50 |                      33 |                   66.00 |
| Devil's Ivy         |             60 |                      31 |                   51.67 |
| Dragon Tree         |             65 |                      36 |                   55.38 |
| Ficus               |             58 |                      37 |                   63.79 |
| Fiddle Leaf Fig     |             49 |                      32 |                   65.31 |
| Jade Plant          |             42 |                      24 |                   57.14 |
| Majesty Palm        |             61 |                      37 |                   60.66 |
| Money Tree          |             56 |                      29 |                   51.79 |
| Monstera            |             51 |                      28 |                   54.90 |
| Orchid              |             66 |                      38 |                   57.58 |
| Peace Lily          |             60 |                      28 |                   46.67 |
| Philodendron        |             58 |                      35 |                   60.34 |
| Pilea Peperomioides |             57 |                      33 |                   57.89 |
| Pink Anthurium      |             56 |                      35 |                   62.50 |
| Ponytail Palm       |             54 |                      30 |                   55.56 |
| Pothos              |             50 |                      25 |                   50.00 |
| Rubber Plant        |             63 |                      36 |                   57.14 |
| Snake Plant         |             59 |                      35 |                   59.32 |
| Spider Plant        |             62 |                      32 |                   51.61 |
| String of pearls    |             79 |                      43 |                   54.43 |
| ZZ Plant            |             69 |                      39 |                   56.52 |


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
