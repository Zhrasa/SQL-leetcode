# Table: Customer
# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | customer_id | int     |
# | product_key | int     |
# +-------------+---------+
# This table may contain duplicates rows. 
# customer_id is not NULL.
# product_key is a foreign key (reference column) to Product table.
# Table: Product
# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | product_key | int     |
# +-------------+---------+
# product_key is the primary key (column with unique values) for this table.
# Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
# Return the result table in any order.
# ####################################
# Remember you should NEVER:
# 1. include DISTINCT or UNIQUE in HAVING clause
# 2. include attributes in HAVING clause that are not presented in GROUP BY clause
#############################
with pc AS (
    select count(*) AS ct FROM Product),
unic_c_pc AS (
    select distinct customer_id ,  c.product_key as cpc
    from Customer c),
c_pc AS (
select unic_c_pc.customer_id , count(cpc) ct
from unic_c_pc
group by unic_c_pc.customer_id)
select c_pc.customer_id from c_pc ,pc
where c_pc.ct=pc.ct
