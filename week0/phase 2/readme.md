Phase 2 – 

Objective:
Convert raw data into useful information using PySpark.

Problem:
Different datasets were given. They needed to be combined and analyzed to get insights.

Process:

Loaded data into PySpark
Cleaned data (handled null values, fixed types)
Joined datasets using customer_id and order_id
Applied filtering, grouping, and aggregation

Key Functions Used:

join() – combine data
groupBy() – group data
agg() – calculate totals/count
filter() – remove unwanted data
select() – pick needed columns

Output:

Customer-wise totals
Summary of transactions
Clean dataset for analysis

Challenges:

Finding correct join keys
Handling missing values

Learnings:

Learned PySpark transformations
Understood importance of data cleaning and joins