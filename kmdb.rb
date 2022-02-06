# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model

#rails generate model Movie
#rails generate model Person
#rails generate model Role

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

Christopher_Nolan = Person.new
Christopher_Nolan.name = "Christopher Nolan"
Christopher_Nolan.save

Christian_Bale = Person.new
Christian_Bale.name = "Christian Bale"
Christian_Bale.save 

Michael_Caine = Person.new
Michael_Caine.name = "Michael Caine"
Michael_Caine.save 

Liam_Neeson = Person.new
Liam_Neeson.name = "Liam Neeson"
Liam_Neeson.save 

Katie_Holmes = Person.new
Katie_Holmes.name = "Katie Holmes"
Katie_Holmes.save 

Gary_Oldman = Person.new
Gary_Oldman.name = "Gary Oldman"
Gary_Oldman.save 

Health_Ledger = Person.new
Health_Ledger.name = "Heath Ledger"
Health_Ledger.save 

Aaron_Eckhart = Person.new
Aaron_Eckhart.name = "Aaron Eckhart"
Aaron_Eckhart.save 

Maggie_Gyllenhaal = Person.new
Maggie_Gyllenhaal.name = "Maggie Gyllenhaal"
Maggie_Gyllenhaal.save 

Tom_Hardy = Person.new
Tom_Hardy.name = "Tom Hardy"
Tom_Hardy.save 

Joseph_Gordon = Person.new
Joseph_Gordon.name = "Joseph Gordon-Levitt"
Joseph_Gordon.save 

Anne_Hathaway = Person.new
Anne_Hathaway.name = "Anne Hathaway"
Anne_Hathaway.save 

batman1 = Movie.new
batman1.title = "Batman Begins"
batman1.year = 2005
batman1.rating = "PG-13"
batman1.person_id = Person.where(name: "Christopher Nolan").pluck(:id).first
batman1.save

batman2 = Movie.new
batman2.title = "The Dark Knight"
batman2.year = 2008
batman2.rating = "PG-13"
batman2.person_id = Person.where(name: "Christopher Nolan").pluck(:id).first
batman2.save

batman3 = Movie.new
batman3.title = "The Dark Knight Rises"
batman3.year = 2012
batman3.rating = "PG-13"
batman3.person_id = Person.where(name: "Christopher Nolan").pluck(:id).first
batman3.save

BW = Role.new
BW.movie_id = Movie.where(title: "Batman Begins").pluck(:id).first
BW.person_id = Person.where(name: "Christian Bale").pluck(:id).first
BW.character_name = "Bruce Wayne"
BW.save

BW2 = Role.new
BW2.movie_id = Movie.where(title: "The Dark Knight").pluck(:id).first
BW2.person_id = Person.where(name: "Christian Bale").pluck(:id).first
BW2.character_name = "Bruce Wayne"
BW2.save

BW3 = Role.new
BW3.movie_id = Movie.where(title: "The Dark Knight Rises").pluck(:id).first
BW3.person_id = Person.where(name: "Christian Bale").pluck(:id).first
BW3.character_name = "Bruce Wayne"
BW3.save

Alfred = Role.new
Alfred.movie_id = Movie.where(title: "Batman Begins").pluck(:id).first
Alfred.person_id = Person.where(name: "Michael Caine").pluck(:id).first
Alfred.character_name = "Alfred"
Alfred.save

Alfred2 = Role.new
Alfred2.movie_id = Movie.where(title: "The Dark Knight").pluck(:id).first
Alfred2.person_id = Person.where(name: "Michael Caine").pluck(:id).first
Alfred2.character_name = "Alfred"
Alfred2.save

RAG = Role.new
RAG.movie_id = Movie.where(title: "Batman Begins").pluck(:id).first
RAG.person_id = Person.where(name: "Liam Neeson").pluck(:id).first
RAG.character_name = "Ra's Al Ghul"
RAG.save

Rachel = Role.new
Rachel.movie_id = Movie.where(title: "Batman Begins").pluck(:id).first
Rachel.person_id = Person.where(name: "Katie Holmes").pluck(:id).first
Rachel.character_name = "Rachel Dawes"
Rachel.save

Rachel2 = Role.new
Rachel2.movie_id = Movie.where(title: "The Dark Knight").pluck(:id).first
Rachel2.person_id = Person.where(name: "Maggie Gyllenhaal").pluck(:id).first
Rachel2.character_name = "Rachel Dawes"
Rachel2.save

Commish = Role.new
Commish.movie_id = Movie.where(title: "Batman Begins").pluck(:id).first
Commish.person_id = Person.where(name: "Gary Oldman").pluck(:id).first
Commish.character_name = "Commissioner Gordon"
Commish.save

Commish2 = Role.new
Commish2.movie_id = Movie.where(title: "The Dark Knight Rises").pluck(:id).first
Commish2.person_id = Person.where(name: "Gary Oldman").pluck(:id).first
Commish2.character_name = "Commissioner Gordon"
Commish2.save

Joker = Role.new
Joker.movie_id = Movie.where(title: "The Dark Knight").pluck(:id).first
Joker.person_id = Person.where(name: "Heath Ledger").pluck(:id).first
Joker.character_name = "Joker"
Joker.save

Harvey = Role.new
Harvey.movie_id = Movie.where(title: "The Dark Knight").pluck(:id).first
Harvey.person_id = Person.where(name: "Aaron Eckhart").pluck(:id).first
Harvey.character_name = "Harvey Dent"
Harvey.save

Bane = Role.new
Bane.movie_id = Movie.where(title: "The Dark Knight Rises").pluck(:id).first
Bane.person_id = Person.where(name: "Tom Hardy").pluck(:id).first
Bane.character_name = "Bane"
Bane.save

Robin = Role.new
Robin.movie_id = Movie.where(title: "The Dark Knight Rises").pluck(:id).first
Robin.person_id = Person.where(name: "Joseph Gordon-Levitt").pluck(:id).first
Robin.character_name = "John Blake"
Robin.save

Catwoman = Role.new
Catwoman.movie_id = Movie.where(title: "The Dark Knight Rises").pluck(:id).first
Catwoman.person_id = Person.where(name: "Anne Hathaway").pluck(:id).first
Catwoman.character_name = "Selina Kyle"
Catwoman.save

# Prints a header for the movies output

puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

movies = Movie.all
for film in movies
    puts "#{film.title} #{film.year} #{film.rating} #{Person.where(id: film.person_id).pluck(:name).first}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!

cast = Role.all
for character in cast
    puts "#{Movie.where(id: character.movie_id).pluck(:title).first} #{Person.where(id: character.person_id).pluck(:name).first} #{character.character_name}"
end