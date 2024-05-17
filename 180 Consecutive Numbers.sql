# Table: Logs
# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | id          | int     |
# | num         | varchar |
# +-------------+---------+
# In SQL, id is the primary key for this table.
# id is an autoincrement column.
# Find all numbers that appear at least three times consecutively.

# Return the result table in any order.

# The result format is in the following example.

# Write your MySQL query statement below    ## first solution( it is wrong if id is not continuously)

# The LAG() function in SQL is a window function that provides access to a row at a specified physical offset before the current row within the result set. It's commonly used to compare values between consecutive rows, such as finding the difference between the current row's value and the previous row's value.
# LAG(column_name, offset, default_value) OVER (PARTITION BY partition_column ORDER BY order_column)
with temp AS (
    SELECT id , num,
    lag(num,1,0)over(order by id) AS p_num,
    lag(num,2,0)over(order by id) AS sp_num
    FROM Logs
)
select distinct num AS ConsecutiveNums from temp
where num=p_num AND p_num=sp_num

# Write your MySQL query statement below    ## second attemp
SELECT distinct l1.num AS  ConsecutiveNums
FROM Logs l1
join Logs l2 ON l1.id=l2.id -1
join Logs l3 ON l1.id=l3.id -2
where l1.num=l2.num AND l1.num=l3.num
