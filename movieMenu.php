
 <?php
 //connect to database, in this case we use localhost(must use ip address of localhost)
$cxn = new mysqli("127.0.0.1", 
		"markJoseph", 
		"1234", 
		"markJoseph_database");

print($cxn->connect_error);

# sort clause is empty and will be appended to the select phrase requardless of if there is data iin the query or not
# sort clause being initially empty will ensure no error if there is no data in the query
$sortClause = "";
# if there is data in the link that will be in the query string in the url append it and store it in a variable
if (!empty($_GET['sortYear'])) {
	$sortClause = "WHERE year<" . $_GET['sortYear'] . "ORDER BY DESC";
}


# get all of the movies and if there is something in the sort clause then append it to this query 
$queryMovies = "SELECT * from movies {$sortClause}";
print($queryMovies);
$allMovies = $cxn->query($queryMovies);

print($cxn->error);
 
?>



<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="movieCss.css" />
	<title>Movie Site</title>
</head>
<body>






			<center><h1>Movie Website</h1></center>
<br>
<br>
	<h2>This website mimics a movie website where a person can add movies to a shopping cart and filter through movies by various different sorting filters</h2>


			<center><a href="sortMovies.php">Click to filter movies</a></center>	

<!-- 			this is the form, it is a post method so when submit is clicked, we will go to the upload_movie page and all of the values 
			from this form can be attained by using $_POST[name of value] -->
			<p>Add a movie to this site:</p>
			<form   action="upload_movie.php" method="POST">
						<input type="text" name="movieName" placeholder="Name of Movie" />
					<br />
						<input type="text" name="actorName" placeholder="Actor Name" />

					<br>
						Select Year:
						<select name="year">
						<?php for ($i=1980; $i<=2017; $i++) : ?>
											<option value="<?php print($i); ?>"><?php print($i); ?></option>
						<?php endfor; ?>

						</select>
					<br>

						<input type="number" name="duration" placeholder="Duration Of Movie" />

					<br>	
						Select Number Of Stars:
						<select name="rating">
						<?php for ($i=1; $i<=4; $i++) : ?>
											<option value="<?php print($i); ?>"><?php print($i); ?></option>
						<?php endfor; ?>

						</select>
					<br />
						<input type="number" name="price" placeholder="Price Of Movie" />
					<br>
						<input type="text" name="genre" placeholder="Genre of Movie" />

					<br>



						Link to Movie Photo<br>
						<input type="url" name="image_path" />


					<br >
					<br>
					<div class = "sbutton">
						<input type="submit" value="Add Movie!" />	
					</div>	
			</form>

			<br>
			<br>







			<center>
			<form   action="movieMenu.php" method="POST">
			Sort by movies before the year:
			<select name="sortYear">
			<?php for ($i=1980; $i<=2017; $i++) : ?>
								<option value="<?php print($i); ?>"><?php print($i); ?></option>
			<?php endfor; ?>
			<div class = "sbutton">
						<input type="submit" value="Sort " />	
					</div>	
			</select>
			</form>
			</center>






			
			<center>
			<?php while ($row = $allMovies->fetch_assoc()) : ?>
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
			</center>

			
		
</body>
</html>






