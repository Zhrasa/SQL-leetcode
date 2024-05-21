# Table: RequestAccepted
# +----------------+---------+
# | Column Name    | Type    |
# +----------------+---------+
# | requester_id   | int     |
# | accepter_id    | int     |
# | accept_date    | date    |
# +----------------+---------+
# (requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
# This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 # Write a solution to find the people who have the most friends and the most friends number.
# The test cases are generated so that only one person has the most friends.

# Write your MySQL query statement below
with temp AS
(
    (select requester_id AS id, count(accepter_id )AS num  from RequestAccepted 
group by requester_id )
union all
(select accepter_id AS id  ,count(requester_id)  AS num from RequestAccepted 
group by accepter_id  ))
select id , sum(num) AS num
from temp
group by id
order by num desc
limit 1




#or the same with 
# Write your MySQL query statement below
with temp as(select requester_id id from RequestAccepted
union all
select accepter_id id from RequestAccepted)
select id, count(*) num  from temp group by 1 order by 2 desc limit 1
