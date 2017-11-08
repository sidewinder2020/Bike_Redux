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
   url: API + '/api/v1/sales/sales_per_region',
   method: 'GET',
 }).done(function(data) {
   console.log(data)
   drawSalesPerRegionChart(data)
 }).fail(function() {
   handleEror();
 })
};

function topBusinessSalespeople() {
  console.log("topBusinessSalespeople")
};

function worstPerformingCategories() {
  console.log("worstPerformingCategories")
};

function mostPopularSalesReasons() {
  console.log("mostPopularSalesReasons")
};

function yearToYearGrowth() {
  console.log("yearToYearGrowth")
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
  console.log("sales data")
  console.log(sales)
  data.addRows(region_sales);

  var options = {'title':'Sales By Region',
                 'width':1000,
                 'height':300};

  chart = new google.visualization.BarChart(document.getElementById('region_sales_div'));
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
