var data;
var chart;

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(pageCasePickingThing);

function pageCasePickingThing() {
  switch (window.location.pathname) {
    case "/gross_analytics":
        mostPopularProducts();
        break;
    case "/store_search":
        console.log("store_search")
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
