var data;
var chart;
var API = "http://localhost:3000";

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(pageCasePickingThing);

function pageCasePickingThing() {
  switch (window.location.pathname) {
    case "/gross_analytics":
        mostPopularProducts();
        break;
    case "/store_search":
        initialStoreAnalyticsFunction()
        break;
    default:
        console.log("default")
    };
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
  }).then(products => drawChart(products))
};

function drawChart(products) {
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
  $.ajax({
     url: API + '/api/v1/stores/' + storeId + '/top_selling_products',
     method: 'GET',
   }).done(function(data) {
     drawChartStore1(data)
    //  $('#latest-posts').append('<p class="post">' + data.description + '</p>');
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
    title: 'Top Selling Products'
  };

  var chart = new google.visualization.PieChart(document.getElementById('top_selling_products'));

  chart.draw(data, options);
}

function preventDefaultForm() {
  $('form').on('submit', function(event){
   event.preventDefault();
 });
};
