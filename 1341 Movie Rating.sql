# Table: Movies
# +---------------+---------+
# | Column Name   | Type    |
# +---------------+---------+
# | movie_id      | int     |
# | title         | varchar |
# +---------------+---------+
# movie_id is the primary key (column with unique values) for this table.# title is the name of the movie.
 # Table: Users
# +---------------+---------+
# | Column Name   | Type    |
# +---------------+---------+
# | user_id       | int     |
# | name          | varchar |
# +---------------+---------+
# user_id is the primary key (column with unique values) for this table.
# Table: MovieRating
# +---------------+---------+
# | Column Name   | Type    |
# +---------------+---------+
# | movie_id      | int     |
# | user_id       | int     |
# | rating        | int     |
# | created_at    | date    |
# +---------------+---------+
# (movie_id, user_id) is the primary key (column with unique values) for this table.# This table contains the rating of a movie by a user in their review.# created_at is the user's review date. 
 # Write a solution to:
# Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
# Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
# Write your MySQL query statement below   ### if the name and the title is the same you cant use union you have to use union all

(SELECT name AS results  
FROM MovieRating r
join Users u ON u.user_id =r.user_id
group by name
order by count(movie_id) DESC , name ASC
limit 1)
UNION ALL
(
    SELECT  title AS results 
FROM MovieRating r
join Movies m ON m.movie_id =r.movie_id
where created_at like '2020-02-%'
group by title
order by AVG(rating) desc , title ASC
limit 1)
