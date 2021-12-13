--3.Write a query in SQL to list the Horror movies?
select mov_title,gen_title
from movie m
join movie_genres   mg
ON m.mov_id=mg.mov_id
JOIN genres  gn
ON mg.gen_id=gn.gen_id
where gn.gen_title='Horror';

--4.Write a query in SQL to find the name of all reviewers who have rated 8 or more stars?
select rev_name
from reviewer
join rating
on reviewer.rev_id=rating.rev_id
where rating.rev_stars>=8;

--5.Write a query in SQL to list all the information of the actors who played a role in the movie ‘Deliverance’
select actor.*  from actor
join movie_cast
on actor.act_id=movie_cast.act_id
JOIN movie
on movie.mov_id=movie_cast.mov_id
where movie.mov_title='Deliverance';

--6.Write a query in SQL to find the name of the director (first and last names) who directed a movie that casted a role for ‘Eyes Wide Shut’. (using subquery)
select dir_fname || ' ' || dir_lname as "FullName"
from director
join movie_direction
on movie_direction.dir_id = director.dir_id
join movie
on movie_direction.mov_id = movie.mov_id
join movie_cast
on movie.mov_id=movie_cast.mov_id
where mov_title ='Eyes Wide Shut';

 
--7.Write a query in SQL to find the movie title, year, date of release, director and actor for those movies which reviewer is ‘Neal Wruck’

select mov_title,mov_year,mov_dt_rel, dir_fname || ' ' || dir_lname as "Director",act_fname || ' ' || act_lname as "Actor",rev_name
from movie
join movie_direction
on movie.mov_id=movie_direction.mov_id
join director
on director.dir_id=movie_direction.dir_id
join movie_cast
on movie.mov_id=movie_cast.mov_id
JOIN actor 
on actor.act_id=movie_cast.act_id
join rating
on rating.mov_id=movie.mov_id
join reviewer
on rating.rev_id=rating.rev_id
where rev_name='Neal Wruck'
 
--8.Write a query in SQL to find all the years which produced at least one movie and that received a rating of more than 4 stars.
select mov_year,count(movie.mov_title) as "No_of_movie_produced"
from movie
join rating 
on movie.mov_id=rating.mov_id
where rating.rev_stars>4 
group by mov_year 
having count(movie.mov_title)>1 

--9.Write a query in SQL to find the name of all movies who have rated their ratings with a NULL value
select movie.mov_title,rating.num_o_ratings
from movie
join rating
on movie.mov_id=rating.mov_id
where rating.num_o_ratings is null

--10.	Write a query in SQL to find the name of movies who were directed by ‘David’
select mov_title,director.dir_fname
from movie
join movie_direction 
on movie.mov_id=movie_direction .mov_id
join director
on director.dir_id=movie_direction .dir_id
where director.dir_fname='David'

--11.Write a query in SQL to list the first and last names of all the actors who were cast in the movie ‘Boogie Nights’and the roles they played in that production.

select act_fname || ' ' || act_lname as "Actor",movie_cast.role,mov_title
from actor
join movie_cast
on movie_cast.act_id=actor.act_id
join movie
on movie.mov_id=movie_cast.mov_id
where mov_title='Boogie Nights' 

--12.	Find the name of the actor who have worked in more than one movie.
 select concat(act_fname,act_lname) as " Actor",COUNT(mov_id) as "No_Of_movie"
from movie_cast
join actor
on actor.act_id=movie_cast.act_id
group by concat(act_fname,act_lname)
having COUNT(mov_id)>1;
 




