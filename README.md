## Plan it Public

When you try to find public transportation possibilities 
using route planner software, it is usually hard to
find connections for weekends as many busses only
operate form monday to friday.

This project should help you to get an overview what busses or
trains are available in your region for your weekend trips.

## Setup

* Download data for public transport of your region in gtfs format. 
* Setup a database into which you can load the data.
* Import the data into the database.

## Download

### Find a dataprovider 

* Austria: https://data.mobilitaetsverbuende.at/de/data-sets. 
  * Create an account
  * Download the dataset you are interested in gtfs format
  * E.g. For around vienna 2023: 'Fahrplandaten Verkehrsverbund Ost-Region (GTFS) 2023'

### Setup a local database

* Have docke and docker-compose installed in your computer
* Run docker compose on the 'docker-compose.yml' of this repository.
* Connect to the database using the following url 'jdbc:postgresql://localhost:5432/gtfsdb'. 
  Find username and password in the 'docker-compose.yml' file

### Import

* Checkout the software for importing gtfs from github
  * git clone https://github.com/OpenTransitTools/gtfsdb
* Follow the steps described in the 'Using with Docker' section. https://github.com/OpenTransitTools/gtfsdb
* Import the data by calling the './import.sh' script
