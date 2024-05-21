# Table: Customer
# +---------------+---------+
# | Column Name   | Type    |
# +---------------+---------+
# | customer_id   | int     |
# | name          | varchar |
# | visited_on    | date    |
# | amount        | int     |
# +---------------+---------+
# In SQL,(customer_id, visited_on) is the primary key for this table. # This table contains data about customer transactions in a restaurant.
# visited_on is the date on which the customer with ID (customer_id) has visited the restaurant. # amount is the total paid by a customer.
# You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
# Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.
# Return the result table ordered by visited_on in ascending order.
# Write your MySQL query statement below
# carful of using the alias c The subquery sums amounts for the range between DATE_SUB(c.visited_on, INTERVAL 6 DAY) and c.visited_on where c.visited_on is from the outer query


SELECT c.visited_on,
(SELECT sum(amount) from Customer c2 where 
c2.visited_on between date_sub(c.visited_on,interval 6 day) AND c.visited_on) AS amount
,( SELECT round(sum(amount)/7,2) from Customer c2 where 
c2.visited_on between date_sub(c.visited_on,interval 6 day) AND c.visited_on) AS average_amount
FROM Customer c
where c.visited_on >= (select date_ADD(min(visited_on),interval 6 day) from Customer)
group by c.visited_on
order by visited_on 
