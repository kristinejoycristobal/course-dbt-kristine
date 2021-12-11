## 1. Modeling challenge
## How are our users moving through the product funnel?

![image](https://user-images.githubusercontent.com/85191840/145689237-fe39ad6b-d54e-4f5b-8c07-90f2c84dd86e.png)



```sql
SELECT 
  *
FROM 
  dbt_kristine.rpt_product_funnel;
```



## Which steps in the funnel have largest drop off points?
The largest drop off points is between page views and overall sessions with -37%.

```sql
SELECT 
  *
FROM 
  dbt_kristine.rpt_product_funnel;
```

![image](https://user-images.githubusercontent.com/85191840/145689268-cc450a6a-d803-4841-819e-499e9ae592ea.png)



## Reflection questions -- please answer 2A or 2B, or both!

## 2A. dbt next steps for you
## Reflecting on your learning in this class...
## If your organization is using dbt, what are 1-2 things you might do differently / recommend to your organization based on learning from this course?

  Start thinking about solidifying our dbt project by:

 * installing dbt-expectations package and add it into our testing stategy
 * creating macros to simplify part of the model that are often repreated
 * adding exposures to our dbt project to see the lineage/relationships to other bi tool
 * starting to dive deeper on the power of dbt artifcats/metadata and see how we can leverage it to improve our dbt models


## 2B. Setting up for production / scheduled dbt run of your project
 Since I am the only data engineer in our team and we don't have the capacity to develop and manage the orchestration, dbt cloud would still be my choice of tool to orchestrate our dbt models to give more time and focus on high impactful projects.
 * I would start with scheduling a dbt run, dbt test and dbt docs serve on a daily basis and as the need arise I will implement a tagging to our dbt models base on the data latency requirements to kick off more frequent scheduling ( hourly, every 4 hrs, etc)
