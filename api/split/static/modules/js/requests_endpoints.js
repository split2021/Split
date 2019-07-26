google.charts.load('current', {
  'packages': ['corechart']
});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

  const data = google.visualization.arrayToDataTable(requests);

  const options = {
    title: 'Request endpoints'
  };

  const chart = new google.visualization.PieChart(document.getElementById('piechart'));

  chart.draw(data, options);
}
