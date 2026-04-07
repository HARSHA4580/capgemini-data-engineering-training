Data Cleaning Pipeline 

Objective:
Clean messy data using PySpark and MySQL to make it accurate and reliable.

Issues in Data:

Missing values in customer_id, name, city
Duplicate records
Negative age values
Incomplete customer details

Cleaning Steps:

Removed rows with NULL customer_id
Replaced NULL name and city with 'Unknown'
Removed duplicate records
Removed rows with negative age