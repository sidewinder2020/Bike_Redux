var data;
var chart;
var API = "http://localhost:3000";

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(pageCasePickingThing);

function pageCasePickingThing() {
  switch (window.location.pathname) {
    case "/gross_analytics":
        initialGrossAnalyticsFunction();
        break;
    case "/store_search":
        initialStoreAnalyticsFunction()
        break;
    default:
        console.log("default")
    };
};

function initialGrossAnalyticsFunction() {
  mostPopularProducts();
  mostSalesPerRegion();
  topBusinessSalespeople();
  worstPerformingCategories();
  mostPopularSalesReasons();
  yearToYearGrowth();
};

function mostPopularProducts() {
  fetch("../api/v1/products/most_popular", {
    method: 'get'
  }).then(response => response.json())
  .then(parsed => {
    var products = []
    parsed.forEach(function(value, key) {
      products.push([value["name"],value["order_count"]])
    });
    return products
  }).then(products => drawPopularProductChart(products))
};

function mostSalesPerRegion() {
  $.ajax({
   url: '../api/v1/sales/sales_per_region',
   method: 'GET',
 }).done(function(data) {
   drawSalesPerRegionChart(data)
 }).fail(function() {
   handleEror();
 })
};

function topBusinessSalespeople() {
  $.ajax({
   url: API + '/api/v1/sales/top_business_salespeople',
   method: 'GET',
 }).done(function(data) {
   drawTopBusinessSalespeopleChart(data)
 }).fail(function() {
   handleEror();
 })
};

function worstPerformingCategories() {
  $.ajax({
   url: API + '/api/v1/products/worst_performing_categories',
   method: 'GET',
 }).done(function(data) {
   drawWorstPerformingCategoriesChart(data)
 }).fail(function() {
   handleEror();
 })
};

function mostPopularSalesReasons() {
  $.ajax({
   url: API + '/api/v1/sales/most_popular_salesreasons',
   method: 'GET',
 }).done(function(data) {
   drawMostPopularSalesReasonsChart(data)
 }).fail(function() {
   handleEror();
 })
};

function yearToYearGrowth() {
  $.ajax({
   url: API + '/api/v1/sales/difference_bt_this_year_last_year_sales',
   method: 'GET',
 }).done(function(data) {
   drawYearToYearGrowthChart(data)
 }).fail(function() {
   handleEror();
 })
};

function drawPopularProductChart(products) {
  data = new google.visualization.DataTable();
  data.addColumn('string', 'Product');
  data.addColumn('number', 'Orders');
  console.log(products)
  data.addRows(products);

  var options = {'title':'Top 10 Most Popular Products by Order Count',
                 'width':1000,
                 'height':300};

  chart = new google.visualization.BarChart(document.getElementById('chart_div'));
  google.visualization.events.addListener(chart, 'select', selectHandler);
  chart.draw(data, options);
}

function drawSalesPerRegionChart(sales) {
  data = new google.visualization.DataTable();
  data.addColumn('string', 'Region');
  data.addColumn('number', 'Sales');
  var region_sales = []
  sales.forEach(function(value, key) {
    region_sales.push([value["name"],Number(value["salesytd"])])
  });
  data.addRows(region_sales);

  var options = {'title':'Sales By Region',
                 'width':1000,
                 'height':300};

  chart = new google.visualization.ColumnChart(document.getElementById('region_sales_div'));
  google.visualization.events.addListener(chart, 'select', selectHandler);
  chart.draw(data, options);
}

function drawTopBusinessSalespeopleChart(people) {
  data = new google.visualization.DataTable();
  data.addColumn('string', 'Salesperson Id');
  data.addColumn('number', 'Sales');
  var people_sales = []
  people.forEach(function(value, key) {
    people_sales.push([String(value["id"]),Number(value["salesytd"])])
  });
  console.log("people data")
  console.log(people)
  data.addRows(people_sales);

  var options = {'title':'Top Salespeople by Id and Sales',
                 'width':1200,
                 'height':500};

  chart = new google.visualization.Histogram(document.getElementById('top_salespeople_div'));
  google.visualization.events.addListener(chart, 'select', selectHandler);
  chart.draw(data, options);
}

function drawYearToYearGrowthChart(growth) {
  data = new google.visualization.DataTable();
  data.addColumn('string', 'Salesperson Id');
  data.addColumn('number', 'Year to Year Growth');
  var growth_sales = []
  growth.forEach(function(value, key) {
    growth_sales.push([String(value["id"]),Number(value["difference"])])
  });
  console.log("growth data")
  console.log(growth)
  data.addRows(growth_sales);

  var options = {'title':'Salespeople by Id and Year to Year Growth',
                 'width':1200,
                 'height':500};

  chart = new google.visualization.BarChart(document.getElementById('year_to_year_div'));
  google.visualization.events.addListener(chart, 'select', selectHandler);
  chart.draw(data, options);
}

function drawWorstPerformingCategoriesChart(cats) {
  data = new google.visualization.DataTable();
  data.addColumn('string', 'Category');
  data.addColumn('number', 'Orders');
  var cats_orders = []
  cats.forEach(function(value, key) {
    cats_orders.push([value["name"],value["category_count"]])
  });
  console.log("cat data")
  console.log(cats)
  data.addRows(cats_orders);

  var options = {'title':'Categories and Number of Orders arranged from Worst to Best',
                 'width':1200,
                 'height':500};

  chart = new google.visualization.BarChart(document.getElementById('worst_categories_div'));
  google.visualization.events.addListener(chart, 'select', selectHandler);
  chart.draw(data, options);
}

function drawMostPopularSalesReasonsChart(reasons) {
  data = new google.visualization.DataTable();
  data.addColumn('string', 'Reason');
  data.addColumn('number', 'Sale Count');
  var sales_reasons = []
  reasons.forEach(function(value, key) {
    sales_reasons.push([value["reasontype"],value["reason_count"]])
  });
  data.addRows(sales_reasons);
  console.log(reasons)

  var options = {'title':'Most Popular Reasons for Sales',
                 'width':1000,
                 'height':700};

  chart = new google.visualization.PieChart(document.getElementById('popular_salesreasons_div'));
  google.visualization.events.addListener(chart, 'select', selectHandler);
  chart.draw(data, options);
}

function selectHandler() {
  var selectedItem = chart.getSelection()[0];
  var value = data.getValue(selectedItem.row, 0);
  alert('The user selected ' + value);
}

function initialStoreAnalyticsFunction() {
  preventDefaultForm();
   $(".storeform input[type='submit']").on('click', createStoreCharts);

};

function createStoreCharts() {
  var storeId = $("#stores").val();
  $("#submit_button").attr('disabled', false);
  createTopSellingProducts(storeId);
  createSalesYtd(storeId);
  createTerritoryArea(storeId);
  createNumberOfOrders(storeId);
  createOrdersTotalCost(storeId);
};

function createTopSellingProducts(storeId) {
  $.ajax({
   url: API + '/api/v1/stores/' + storeId + '/top_selling_products',
   method: 'GET',
 }).done(function(data) {
   drawChartStore1(data)
 }).fail(function() {
   handleEror();
 })
};

function createSalesYtd(storeId) {
  $.ajax({
   url: API + '/api/v1/stores/' + storeId + '/salesytd_per_store',
   method: 'GET',
 }).done(function(data) {
  console.log(data)
  $('#bonkers_amnt_of_info').append('<p>Sales Year to Date Amount: $' + data[0].salesytd + '</p>');
 }).fail(function() {
   handleEror();
 })
};

function createTerritoryArea(storeId) {
  $.ajax({
   url: API + '/api/v1/stores/' + storeId + '/territory_area',
   method: 'GET',
 }).done(function(data) {
  console.log(data)
  $('#bonkers_amnt_of_info').append('<p>Territory Area: ' + data[0].name + '</p>');
 }).fail(function() {
   handleEror();
 })
};

function createNumberOfOrders(storeId) {
  $.ajax({
   url: API + '/api/v1/stores/' + storeId + '/number_of_orders',
   method: 'GET',
 }).done(function(data) {
  console.log(data)
  $('#bonkers_amnt_of_info').append('<p>Amount of Orders: ' + data[0].order_count + '</p>');
 }).fail(function() {
   handleEror();
 })
};

function createOrdersTotalCost(storeId) {
  $.ajax({
   url: API + '/api/v1/stores/' + storeId + '/orders_total_cost',
   method: 'GET',
 }).done(function(data) {
  console.log(data)
  $('#bonkers_amnt_of_info').append('<p>Total Cost of Orders: $' + data[0].order_total + '</p>');
 }).fail(function() {
   handleEror();
 })
};

function drawChartStore1(raw_data) {
  var products = [["name", "sold"]]
  raw_data.forEach(function(value, key) {
    products.push([value["name"],value["order_count"]])
  });
  console.log(products)
  var data = google.visualization.arrayToDataTable(
    products
  );

  var options = {
    title: 'Top Selling Products',
    'width':1300,
    'height':850
  };

  var chart = new google.visualization.PieChart(document.getElementById('top_selling_products'));

  chart.draw(data, options);
}

function preventDefaultForm() {
  $('form').on('submit', function(event){
   event.preventDefault();
 });
};

var handleEror = function() {
  $('#meh').append('<p class="post">Something went wrong. Try again later</p>');
}
