create table actor(
act_id NUMBER primary KEY,
act_fname VARCHAR(20),
act_lname VARCHAR(20),
act_gender CHAR(1)
);
 

create table director(
dir_id NUMBER primary KEY,
dir_fname VARCHAR(20),
dir_lname varchar(20)
);


create table movie(
mov_id NUMBER PRIMARY  KEY,
mov_title VARCHAR(50),
mov_year NUMBER,
mov_time NUMBER,
mov_language VARCHAR(50),
mov_dt_rel DATE,
mov_rel_country VARCHAR(5)
);

create TABLE movie_direaction(
 dir_id NUMBER REFERENCES director (dir_id),
mov_id NUMBER REFERENCES movie(mov_id)
);
create table movie_cast(
act_id NUMBER REFERENCES actor(act_id),
mov_id NUMBER REFERENCES movie(mov_id),
role varchar(30)
);

create table reviewer(
rev_id NUMBER PRIMARY KEY,
rev_name VARCHAR(30)
); 

create TABLE genres(
gen_id NUMBER PRIMARY KEY,
gen_title varchar(20)
);

create table movie_genres(
mov_id NUMBER REFERENCES movie(mov_id),
gen_id NUMBER REFERENCES genres(gen_id)
);


create table rating(
mov_id NUMBER REFERENCES movie(mov_id),
rev_id NUMBER REFERENCES reviewer(rev_id),
rev_stars NUMBER,
num_o_ratings INTEGER 
);