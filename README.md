# README

# Bike Redux (aka: Between the Spreadsheets)

## Goals:
  * Use DataGrip to import a large database (68 tables/5 schemas), and, using views/large queries, break it down to a 13 table/1 schema database
  * Use DataGrip to clean the tables before exporting to CSV's
  * Work with large schemas/complex relationships in rails
  * Use pure postgresql queries to pull business analytics from the subset, and build the API endpoints
  * Guard against SQL injection, in the store queries, where a dropdown is used to gather the id
  * Consume the endpoints with AJAX and fetch calls, and, using google charts, present them in an attractive manner
  
### Database Used

 * https://github.com/lorint/AdventureWorks-for-Postgres

### Prerequisites to Run Locally

  * [Rails version 5.1.4](http://installrails.com/)

  * [Ruby version 2.4.1](https://www.ruby-lang.org/en/documentation/installation/)

### Running Locally

  * Clone this repo.
  * cd into it
  * ```bundle install```
  then *just* in case:
  * ```bundle```
  * ```rake db:{create,migrate}```
  * ```rake db:seed```
  (the seeding will take a while)
  
  To start your server:
  * ```rails s```
  
# Endpoints (for pure JSON)
  
There are a few API endpoints available. To access any of them, enter http://localhost:3000 if you're running it on a local server via rails s.
Follow the /3000/ with any of the following endpoints (if you want to see the pure JSON):

### Store:

* GET '/api/v1/stores/:id/salesytd_per_store'

* GET '/api/v1/stores/:id/top_selling_products'

* GET '/api/v1/stores/:id/territory_area'

* GET '/api/v1/stores/:id/number_of_orders'

* GET '/api/v1/stores/:id/orders_total_cost'

### Products:

* GET '/api/v1/products/most_popular'

* GET '/api/v1/products/worst_performing_categories'

### Sales:

* GET '/api/v1/sales/sales_per_region'

* GET '/api/v1/sales/top_business_salespeople'

* GET '/api/v1/sales/most_popular_salesreasons'

* GET '/api/v1/sales/difference_bt_this_year_last_year_sales'

## Extensions (not yet added)

* page for clients to submit csv's, their headers, and desired analytics (with desired chart style)

## Authors

* **Joan Harrington**  - [Github](https://github.com/sidewinder2020)

## Acknowledgments

* Our glorious leaders (Ian Douglas, Josh Mejia & Cory Westerfield), who light our way with their knowledge and grace
* Sal, the skeleton

### Built With

 * Rails
 * Ruby
 * Javascript
 * Jquery (AJAX calls & fetch calls implemented)
 * Google Charts
 * DataGrip (used to bring the initial 68 table/5 schema database down to a 13 table/1 schema database w/sql queries/views, also used to clean the tables before exporting to CSV's) 
 * Postgresql (better than ActiveRecord on ALL levels)

### Contributing

 * You can't. You aren't important enough, nor do I acknowledge your authority.



