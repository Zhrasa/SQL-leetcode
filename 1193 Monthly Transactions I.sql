# Table: Transactions
# +---------------+---------+
# | Column Name   | Type    |
# +---------------+---------+
# | id            | int     |
# | country       | varchar |
# | state         | enum    |
# | amount        | int     |
# | trans_date    | date    |
# +---------------+---------+
# id is the primary key of this table.
# The table has information about incoming transactions.
# The state column is an enum of type ["approved", "declined"].
# Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.
# Return the result table in any order.

# Write your MySQL query statement below # I first use count(country) AS trans_count but if the value of country is null it gave error
select 
DATE_format(trans_date,'%Y-%m') AS month ,
country, 
count(id) AS trans_count,
SUM(case when state='approved' then 1 else 0 end) AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(case when state='approved' then amount else 0 end) AS  approved_total_amount
FROM Transactions t1
GROUP BY country , month
