# Table: Visits
# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | visit_id    | int     |
# | customer_id | int     |
# +-------------+---------+
# visit_id is the column with unique values for this table.
# This table contains information about the customers who visited the mall.
# Table: Transactions
# +----------------+---------+
# | Column Name    | Type    |
# +----------------+---------+
# | transaction_id | int     |
# | visit_id       | int     |
# | amount         | int     |
# +----------------+---------+
# transaction_id is column with unique values for this table.
# This table contains information about the transactions made during the visit_id.


# Write your MySQL query statement below   #### very bad runtime :(
select 
V.customer_id ,
 sum(CASE WHEN t.transaction_id is null THEN 1 ELSE 0 END) AS count_no_trans
FROM Visits V 
left join Transactions t ON V.visit_id=T.visit_id
group by V.customer_id
having count_no_trans<>0

# Write your MySQL query statement below   #### better
# Write your MySQL query statement below
select 
V.customer_id ,
 count(1) AS count_no_trans
FROM Visits V 
left join Transactions t ON V.visit_id=T.visit_id
where t.transaction_id is null
group by V.customer_id
