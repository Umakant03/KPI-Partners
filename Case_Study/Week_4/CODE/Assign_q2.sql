--DATA INSERTION INTO DATABASE

--Actor Table
insert into actor values(101,'James','Stewart', 'M');
insert into actor values(102, 'Deborah', 'Kerr', 'F');
insert into actor values(103,'Peter','OToole', 'M');
insert into actor values(104, 'Robert', 'De Niro', 'M');
insert into actor values(105, 'F.  Murray', 'Abraham','M');
insert into actor values(106, 'Harrison', 'Ford', 'M');
insert into actor values(107, 'Nicole', 'Kidman', 'F');
insert into actor values(108, 'Stephen', 'Baldwin', 'M');
insert into actor values(109, 'Jack', 'Nicholson', 'M');
insert into actor values(110, 'Mark', 'Wahlberg', 'M');
insert into actor values(111, 'Woody', 'Allen', 'M');
insert into actor values(112, 'Claire', 'Danes', 'F');
insert into actor values(113, 'Tim', 'Robbins', 'M');
insert into actor values(114, 'Kevin', 'Spacey', 'M');
insert into actor values(115, 'Kate', 'Winslet', 'F');
insert into actor values(116, 'Robin', 'Williams', 'M');
insert into actor values(117, 'Jon', 'Voight', 'M');
insert into actor values(118, 'Ewan', 'McGregor', 'M');
insert into actor values(119, 'Christian' , 'Bale' ,'M');
insert into actor values(120, 'Maggie', 'Gyllenhaal', 'F');
insert into actor values(121, 'Dev', 'Patel', 'M');
insert into actor values(122, 'Sigourney' ,'Weaver' ,'F');
insert into actor values(123, 'David', 'Aston', 'M');
insert into actor values(124, 'Ali', 'Astin' ,'F');

--Director Table

insert into director values(201, 'Alfred', 'Hitchcock');
insert into director values(202, 'Jack', 'Clayton');
insert into director values(203, 'David', 'Lean');
insert into director values(204, 'Michael', 'Cimino');
insert into director values(205, 'Milos', 'Forman');
insert into director values(206, 'Ridley', 'Scott');
insert into director values(207, 'Stanley', 'Kubrick');
insert into director values(208, 'Bryan', 'Singer');
insert into director values(209, 'Roman', 'Polanski');
insert into director values(210, 'Paul', 'Thomas Anderson');
insert into director values(211, 'Woody', 'Allen');
insert into director values(212, 'Hayao', 'Miyazaki');
insert into director values(213, 'Frank', 'Darabont');
insert into director values(214, 'Sam', 'Mendes');
insert into director values(215, 'James', 'Cameron');
insert into director values(216, 'Gus', 'Van Sant');
insert into director values(217, 'John', 'Boorman');
insert into director values(218, 'Danny', 'Boyle');
insert into director values(219, 'Chirstopher', 'Nolan');
insert into director values(220, 'Richard', 'Kelly');
insert into director values(221, 'Kevin', 'Spacey');
insert into director values(222, 'Andrei', 'Tarkovsky');
insert into director values(223, 'Peter', 'Jackson');


--genre
insert into genres values(1001 ,'Action');
insert into genres values(1002 ,'Adventure');
insert into genres values(1003 ,'Animation');
insert into genres values(1004 ,'Biography');
insert into genres values(1005 ,'Comedy');
insert into genres values(1006 ,'Crime');
insert into genres values(1007 ,'Drama');
insert into genres values(1008 , 'Horror');
insert into genres values(1009 , 'Music');
insert into genres values(1010 , 'Mystery');
insert into genres values(1011 , 'Romance');
insert into genres values(1012 , 'Thriller');
insert into genres values(1013 , 'War');

select * from genres;

insert into movie_cast values(101, 901, 'John Scottie Ferguson');
insert into movie_cast values(102, 902, 'Miss Giddens');
insert into movie_cast values(103, 903, 'T. E. Lawrence');
insert into movie_cast values(104, 904, 'Michael');
insert into movie_cast values(105, 905, 'Antonio Salieri');
insert into movie_cast values(106, 906, 'Rick Deckard');
insert into movie_cast values(107, 907, 'Alice Harford');
insert into movie_cast values(108, 908, 'McManus');
insert into movie_cast values(109, 909, 'J. J. Gittes');
insert into movie_cast values(110, 910, 'Eddie Adams');
insert into movie_cast values(111, 911, 'Alvy Singer');
insert into movie_cast values(112, 912, 'San');
insert into movie_cast values(113, 913, 'Adny Dufresne');
insert into movie_cast values(114, 914, 'Lester Burnham');
insert into movie_cast values(115, 915, 'Rose DeWitt Bukater');
insert into movie_cast values(116, 916, 'Sean Maguire');
insert into movie_cast values(117, 917, 'Ed');
insert into movie_cast values(118, 918, 'Renton');
insert into movie_cast values(119, 919, 'Alfred Borden');
insert into movie_cast values(120, 920, 'Elizabeth Darko');
insert into movie_cast values(121, 921, 'Older Jamal');
insert into movie_cast values(122, 922, 'Ripley');
insert into movie_cast values(123, 923, 'Bobby Darin');

update movie_cast set act_id=114 where role='Bobby Darin';

desc movie_cast

select * from movie_cast;

insert into movie values(901, 'Vertigo', 1958, 128, 'English',to_date('1958-08-24', 'RRRR-MM-DD'), 'UK');
insert into movie values(902, 'The Innocents', 1961, 100, 'English', to_date('1962-02-19', 'RRRR-MM-DD'), 'SW');
insert into movie values(903, 'Lawrence of Arabia', 1962, 216, 'English', to_date('1962-12-11`', 'RRRR-MM-DD'), 'UK');
insert into movie values(903, 'Lawrence of Arabia', 1962, 216, 'English', to_date('1962-12-11', 'RRRR-MM-DD'), 'UK');
insert into movie values(904, 'The Deer Hunter', 1978, 183, 'English', to_date('1979-03-08', 'RRRR-MM-DD'), 'UK');
insert into movie values(905, 'Amadeus', 1984, 160, 'English', to_date('1985-01-07', 'RRRR-MM-DD'), 'UK');
insert into movie values(906, 'Blader Runner', 1982, 117, 'English', to_date('1982-09-09', 'RRRR-MM-DD'), 'UK');
insert into movie values(907, 'Eyes Wide Shut', 1999, 159, 'English', NULL, 'UK');
insert into movie values(908, 'The Usual Suspects', 1995, 106, 'English', to_date('1995-08-25', 'RRRR-MM-DD'), 'UK');
insert into movie values(909, 'Chinatown', 1974, 130, 'English', to_date('1974-08-09', 'RRRR-MM-DD'), 'UK');
insert into movie values(910, 'Boogie Nights', 1997, 155, 'English', to_date('1998-02-16', 'RRRR-MM-DD'), 'UK');
insert into movie values(911, 'Annie Hall', 1977, 93, 'English', to_date('1977-04-20', 'RRRR-MM-DD'), 'USA');
insert into movie values(912, 'Princess Mononoke', 1997, 134,'Japanese', to_date('2001-10-19', 'RRRR-MM-DD'), 'UK');
insert into movie values(913, 'The Shawshank Redemption', 1994, 142, 'English', to_date('1995-02-17', 'RRRR-MM-DD'), 'UK');
insert into movie values(914, 'American Beauty', 1999, 122, 'English', NULL, 'UK');
insert into movie values(915, 'Titanic', 1997, 194, 'English',to_date('1998-01-23', 'RRRR-MM-DD'), 'UK');
insert into movie values(916, 'Good Will Hunting', 1997, 126,'English', to_date('1998-06-03', 'RRRR-MM-DD'), 'UK');
insert into movie values(917, 'Deliverance', 1972, 109, 'English', to_date('1982-10-05', 'RRRR-MM-DD'), 'UK');
insert into movie values(918, 'Trainspotting', 1996, 94, 'English', to_date('1996-02-23', 'RRRR-MM-DD'), 'UK');
insert into movie values(919, 'The Prestige', 2006, 130, 'English', to_date('2006-11-10', 'RRRR-MM-DD'), 'UK');
insert into movie values(920, 'Donnie Darko', 2001, 113, 'English', NULL, 'UK');
insert into movie values(921, 'Slumdog Millionaire', 2008, 120, 'English', to_date('2009-01-09', 'RRRR-MM-DD'), 'UK');
insert into movie values(922, 'Aliens', 1986, 137, 'English',to_date('1986-08-29', 'RRRR-MM-DD'), 'UK');
insert into movie values(923, 'Beyond the Sea', 2004, 118, 'English', to_date('2004-11-26', 'RRRR-MM-DD'), 'UK');
insert into movie values(924, 'Avatar', 2009, 162, 'English',to_date('2009-12-17', 'RRRR-MM-DD'), 'UK');
insert into movie values(925, 'Braveheart', 1995, 178, 'English', to_date('1995-09-08', 'RRRR-MM-DD'), 'UK');
insert into movie values(926, 'Seven Samurai', 1954, 207, 'Japanese', to_date('1954-04-26', 'RRRR-MM-DD'), 'JP');
insert into movie values(927, 'Sprinted Away', 2001, 125, 'Japanese', to_date('2003-09-12', 'RRRR-MM-DD'), 'UK');
insert into movie values(928, 'Back to the Future', 1985, 116, 'English', to_date('1985-12-04', 'RRRR-MM-DD'), 'UK');

select * from movie;

insert into movie_direction values(201, 901);
insert into movie_direction values(202, 902);
insert into movie_direction values(203, 903);
insert into movie_direction values(204, 904);
insert into movie_direction values(205, 905);
insert into movie_direction values(206, 906);
insert into movie_direction values(207, 907);
insert into movie_direction values(208, 908);
insert into movie_direction values(209, 909);
insert into movie_direction values(210, 910);
insert into movie_direction values(211, 911);
insert into movie_direction values(212, 912);
insert into movie_direction values(213, 913);
insert into movie_direction values(214, 914);
insert into movie_direction values(215, 915);
insert into movie_direction values(216, 916);
insert into movie_direction values(217, 917);
insert into movie_direction values(218, 918);
insert into movie_direction values(219, 919);
insert into movie_direction values(220, 920);
insert into movie_direction values(218, 921);
insert into movie_direction values(215, 922);
insert into movie_direction values(221, 923);

RENAME movie_direaction TO movie_direction ;
desc movie_direction;


insert into movie_genres values(922, 1001);
insert into movie_genres values(917, 1002);
insert into movie_genres values(903, 1002);
insert into movie_genres values(912, 1003);
insert into movie_genres values(911, 1005);
insert into movie_genres values(908, 1006);
insert into movie_genres values(913, 1006);
insert into movie_genres values(926, 1007);
insert into movie_genres values(928, 1007);
insert into movie_genres values(918, 1007);
insert into movie_genres values(921, 1007);
insert into movie_genres values(902, 1008);
insert into movie_genres values(923, 1009);
insert into movie_genres values(907, 1010);
insert into movie_genres values(927, 1010);
insert into movie_genres values(901, 1010);
insert into movie_genres values(914, 1011);
insert into movie_genres values(906, 1012);
insert into movie_genres values(904, 1013);

select * from movie_genres;

--INserting Data into reviewer Table

insert into reviewer values(9001,'Righty Sock');
insert into reviewer values(9002,'Jack Malvern');
insert into reviewer values(9003,'Flagrant Baronessa');
insert into reviewer values(9004,'Alec Shaw');
insert into reviewer values(9005,NULL);
insert into reviewer values(9006,'Victor Woeltjen');
insert into reviewer values(9007,'Simon Wright');
insert into reviewer values(9008,'Neal Wruck');
insert into reviewer values(9009,'Paul Monks');
insert into reviewer values(9010,'Mike Salvati');
insert into reviewer values(9011,NULL );
insert into reviewer values(9012,'Wesley S. Walker');
insert into reviewer values(9013,'Sasha Goldshtein');
insert into reviewer values(9014,'Josh Cates');
insert into reviewer values(9015,'Krug Stillo');
insert into reviewer values(9016,'Scott LeBrun');
insert into reviewer values(9017,'Hannah Steele');
insert into reviewer values(9018,'Vincent Cadena');
insert into reviewer values(9019,'Brandt Sponseller' );
insert into reviewer values(9020,'Richard Adams' );

select * from reviewer;

--rating
insert into rating values(901, 9001, 8.4, 263575);
insert into rating values(902, 9002, 7.9, 20207);
insert into rating values(903, 9003, 8.3, 202778);
insert into rating values(906, 9005, 8.2, 484746);
insert into rating values(924, 9006, 7.3, NULL);
insert into rating values(908, 9007, 8.6, 779489);
insert into rating values(909, 9008, 8.6, 779489);
insert into rating values(910, 9009, 3, 195961);
insert into rating values(911, 9010, 8.1,203875);
insert into rating values(912, 9011, 8.4,NULL);
insert into rating values(914, 9013, 7, 862618);
insert into rating values(915, 9001,7.7,830095);
insert into rating values(916, 9014, 4, 642132);
insert into rating values(925, 9015,7.7, 81328);
insert into rating values(918, 9016,NULL,580301);
insert into rating values(920, 9017,8.1, 609451);
insert into rating values(921, 9018, 8, 667758);
insert into rating values(922, 9019, 8.4,511613);
insert into rating values(923, 9020,6.7,13091);