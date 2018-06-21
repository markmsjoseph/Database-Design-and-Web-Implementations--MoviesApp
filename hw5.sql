

CREATE TABLE movies (
	 movie_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	 name VARCHAR(50) NOT NULL,
	 actor VARCHAR(50) NOT NULL,
	 year INT(11) UNSIGNED NOT NULL,
	 duration INT(11) UNSIGNED NOT NULL,
	 stars INT(11) UNSIGNED NOT NULL,
	 price DECIMAL(11,2) UNSIGNED NOT NULL,
	 genre VARCHAR(50) NOT NULL,
	 number_of_views INT(11) UNSIGNED DEFAULT 0,
	 number_of_reads INT(11) UNSIGNED DEFAULT 0,
	 image_path VARCHAR(200) NOT NULL,
	 PRIMARY KEY (movie_id)
);

LOAD DATA LOCAL INFILE 'movies.csv' 
INTO TABLE movies
FIELDS TERMINATED BY ',' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(name, actor, year, duration, stars, price, genre, number_of_views, number_of_reads, image_path);

#the path of the image eg mission impossible.jpg is in the current directory 

INSERT INTO movies (
	name,
	actor,
	year,
	duration,
	stars,
	price,
	genre,
	number_of_views,
	number_of_reads,
	image_path
	
)
VALUES (
	"Mission Impossible: Rogue Nation",
	"Tom Cruise",
	2015,
	225,
	4,
	59.99,
	"Action",
	0,
	0,
	"http://screenrant.com/wp-content/uploads/Mission-Impossible-Rogue-Nation-IMAX-Poster.jpeg"
	
);

INSERT INTO movies (
	name,
	actor,
	year,
	duration,
	stars,
	price,
	genre,
	number_of_views,
	number_of_reads,
	image_path
	
)
VALUES (
	"Edge Of Tomorrow",
	"Tom Cruise",
	2013,
	125,
	4,
	49.99,
	"Action",
	0,
	0 ,
	"http://www.heyuguys.com/images/2014/02/Edge-of-Tomorrow-Poster.jpg" 
	
);
INSERT INTO movies (
	name,
	actor,
	year,
	duration,
	stars,
	price,
	genre,
	number_of_views,
	number_of_reads,
	image_path
	
)
VALUES (
	"Malificent",
	"Angelina Jolie",
	2013,
	225,
	2,
	59.99,
	"Adventure",
	0,
	0,
	"http://marieclaire.media.ipcdigital.co.uk/11116/00007d951/b2bd_orh100000w440/maleficent-poster.jpg"
	
);

INSERT INTO movies (
	name,
	actor,
	year,
	duration,
	stars,
	price,
	genre,
	number_of_views,
	number_of_reads,
	image_path
	
)
VALUES (
	"Spirited Away",
	"MJin Low",
	2003,
	125,
	4,
	10.99,
	"Fantasy",
	0,
	0 ,
	"http://ia.media-imdb.com/images/M/MV5BMjYxMDcyMzIzNl5BMl5BanBnXkFtZTYwNDg2MDU3._V1_SX640_SY720_.jpg" 
	
);






CREATE TABLE users (
	 user_id INT(11) UNSIGNED NOT NULL,
	 first_name VARCHAR(50) NOT NULL,
	 las_name VARCHAR(50) NOT NULL,
	 date_of_birth DATE NOT NULL,
	 credit_card INT(30) UNSIGNED DEFAULT NULL,
	 membership_duration INT(11) UNSIGNED NOT NULL,
	 movies_viewed INT(11) UNSIGNED NOT NULL,
	 favourite_genre VARCHAR(50) NOT NULL,
	 PRIMARY KEY (user_id)
);

LOAD DATA LOCAL INFILE 'movies.csv' 
INTO TABLE users
FIELDS TERMINATED BY ',' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(user_id, first_name, las_name, date_of_birth, credit_card, membership_duration, movies_viewed, favourite_genre);

INSERT INTO movies (
	user_id,
	first_name,
	las_name,
	date_of_birth,
	stars,
	credit_card,
	membership_duration,
	movies_viewed,
	favourite_genre
	
)
VALUES (
	user_id,
	first_name,
	las_name,
	date_of_birth,
	stars,
	credit_card,
	membership_duration,
	movies_viewed,
	favourite_genre
);





CREATE TABLE actors (
	 actor_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	 actor_name VARCHAR(50) NOT NULL,
	 actor_age INT(11) UNSIGNED NOT NULL,
	 actor_rating INT(11) UNSIGNED DEFAULT 0,
	 movie_acted_in VARCHAR(50) NOT NULL,
	 PRIMARY KEY (actor_id)
);

LOAD DATA LOCAL INFILE 'movies.csv' 
INTO TABLE actors
FIELDS TERMINATED BY ',' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(actor_name, actor_age, actor_rating, movie_acted_in);

INSERT INTO actors (
	actor_name,
	actor_age,
	actor_rating,
	movie_acted_in

)
VALUES (
	"Tom Cruise",
	34,
	5,
	"Edge of Tomorrow"
);

INSERT INTO actors (
	actor_name,
	actor_age,
	actor_rating,
	movie_acted_in

)
VALUES (
	"Angelina Jolie",
	30,
	4,
	"Malificent"
);





CREATE TABLE genres (
	 genre_name VARCHAR(50) NOT NULL,
	 parental_rating VARCHAR(50) NOT NULL,
	 PRIMARY KEY (genre_name)
);

LOAD DATA LOCAL INFILE 'movies.csv' 
INTO TABLE genres
FIELDS TERMINATED BY ',' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(genre_name, parental_rating);


INSERT INTO genres (
	genre_name,
	parental_rating

)
VALUES (
	genre_name,
	parental_rating
);





CREATE TABLE movie_shopping_cart (
	 movie_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	 name VARCHAR(50) NOT NULL,
	 actor VARCHAR(50) NOT NULL,
	 year INT(11) UNSIGNED NOT NULL,
	 duration INT(11) UNSIGNED NOT NULL,
	 stars INT(11) UNSIGNED NOT NULL,
	 price DECIMAL(11,2) UNSIGNED NOT NULL,
	 genre VARCHAR(50) NOT NULL,
	 number_of_views INT(11) UNSIGNED NOT NULL,
	 number_of_reads INT(11) UNSIGNED NOT NULL,
	 PRIMARY KEY (movie_id)
);

LOAD DATA LOCAL INFILE 'movies.csv' 
INTO TABLE movie_shopping_cart
FIELDS TERMINATED BY ',' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(name, actor, year, duration, stars, price, genre, number_of_views, number_of_reads);


INSERT INTO movie_shopping_cart (
	name,
	actor,
	year,
	duration,
	stars,
	price,
	genre,
	number_of_views,
	number_of_reads
	
)
VALUES (
	name,
	actor,
	year,
	duration,
	stars,
	price,
	genre,
	number_of_views,
	number_of_reads  
	
);

