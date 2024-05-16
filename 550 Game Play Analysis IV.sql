
# Table: Activity

# +--------------+---------+
# | Column Name  | Type    |
# +--------------+---------+
# | player_id    | int     |
# | device_id    | int     |
# | event_date   | date    |
# | games_played | int     |
# +--------------+---------+
# (player_id, event_date) is the primary key (combination of columns with unique values) of this table.
# This table shows the activity of players of some games.
# Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

# Write a solution to report the fraction of players that logged in again on the day after the day they first logged in,
rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, 
then divide that number by the total number of players.


# Write your MySQL query statement below

with temp AS (
    select player_id, min(event_date) AS min_date
    FROM Activity
    GROUP BY player_id   
)
SELECT 
round(
sum(
    case when a.event_date=date_add(min_date , INTERVAL 1 DAY ) then 1 else 0 end
)/count(distinct temp.player_id )
,2)
 AS fraction
FROM Activity a
join temp ON temp.player_id=a.player_id 
