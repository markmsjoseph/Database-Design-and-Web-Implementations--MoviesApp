<?php


//connect to db
$cxn = new mysqli("127.0.0.1", 
		"markJoseph", 
		"1234", 
		"markJoseph_database");

# sort clause is empty and will be appended to the select phrase requardless of if there is data iin the query or not
# sort clause being initially empty will ensure no error if there is no data in the query

$sortClause = "";
# if there is data in the link that will be in the query string in the url append it and store it in a variable
if (!empty($_GET['sort'])) {
	$sortClause = "ORDER BY " . $_GET['sort'] . " DESC";
}

# this query will only work if both conditions are met and it sorts by actors who acted in movies present in the database
# ie. if there are actors in the actors table that do not have a corresponding movie in the movies table they will not show up
if (!empty($_GET['sortTable1'])) {
	$order1 = $_GET['sortTable1'];
	if (!empty($_GET['sortTable2'])) {
		$order2 = $_GET['sortTable2'];
		$query = "SELECT * FROM movies, actors WHERE {$order1} = {$order2}";
		$result = $cxn->query($query);
	}
}


//run a query, if sort clause is empty everything will be displayed 
$query = "SELECT * FROM movies {$sortClause}";
$result = $cxn->query($query);

?> 







<!doctype html>
<html>
	<head>
		<title>Filter Movies</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="movieCss.css" />
	</head>
	<body>


	<center><a href="movieMenu.php">All Movies</a></center>

				<h1>Filter Movies</h1>


<!-- links used for sorting based on query string values, the sort variable will store a value and sortTable1 and sortTable2 will hold other values 
		so when the link is clicked these variables are filled -->
			<nav>
				sort by: 
				<a href="sortMovies.php?sort=rating">rating</a>,
				<a href="sortMovies.php?sortTable1=actors.actor_name&sortTable2=movies.actor">actor</a> 
			</nav>

<!-- display everything on the page or if filtered display whatever the query to the database returns -->
 <?php while ($row=$result->fetch_assoc()) : ?>
		<div class ="movie">
					<img src="<?php print($row['image_path']); ?>" />
					<br>
						<?php print($row['name']); ?> 
						<?php print($row['actor']); ?> 
						<?php print($row['year']); ?> 
						<?php print($row['duration']); ?> 
						<?php print($row['stars']); ?> 
						<?php print($row['price']); ?> 
						<?php print($row['genre']); ?> 
						<?php print($row['number_of_views']); ?> 
						<?php print($row['number_of_reads']); ?> 
		</div>
<?php endwhile; ?>  

			

	
	</body>
</html>