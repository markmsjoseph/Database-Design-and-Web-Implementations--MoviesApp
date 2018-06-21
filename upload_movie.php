<?php

# get the data that was inputted into the form

$movie_name = $_POST['movieName'];
$actor = $_POST['actorName'];
$year = $_POST['year'];
$duration = $_POST['duration'];
$rating = $_POST['rating'];
$price = $_POST['price'];
$genre = $_POST['genre'];
$image = $_POST['image_path'];

# connec to the database
$cxn = new mysqli("127.0.0.1", 
		"markJoseph", 
		"1234", 
		"markJoseph_database");

//debug
print($cxn->connect_error);

 # insert the values from the form into the movies table

$result = $cxn->query("INSERT INTO movies (
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
	'{$movie_name}',
	'{$actor}',
	'{$year}',
	'{$duration}',
	'{$rating}',
	'{$price}',
	'{$genre}',
	0,
	0,
	'{$image}'
	
)");


//redirect to same page with list of all the movies
header("Location: movieMenu.php");


?>