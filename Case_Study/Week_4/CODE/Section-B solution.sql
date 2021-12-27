--STEP1:Chek the name of actor with act_id=124
select act_fname,act_lname,act_gender
from actor
where act_id =124;

--Step 2: update the name of actor with act_id =124 with fname = ‘George’ , lname=’Farady’, gender= ‘M’
update actor 
set act_fname='George',act_lname='Faraday',act_gender='M'
where act_id=124;

select act_fname,act_lname,act_gender
from actor
where act_id=124

--Step 3: create the stored procedure

go
create proc spUpdateCast
@act_id integer,
@mov_id integer,
@role char(30),
as
begin
SET NOCOUNT ON
    declare @count integer=(select(*) from movie_cast where act_id=@act_id and mov_id=@mov_id)
    if @count>=1
       print('Already cast assigned, Same Actors can't caste more than once in a movie.')
    else
        insert into movie_cast values(@act_id,@mov_id,@role)
end;