am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_material);
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.XYChart);

var data = [];
var amplitiude = <%= @measurement.data.to_json.html_safe %>;
var signal_length = amplitiude.length;
var dt = <%= @measurement.dt.to_json.html_safe %>;
for(var i = 0; i < signal_length; i++){
  data.push({x:dt * i, y: amplitiude[i]});
}

chart.data = data;

var xvalueAxis = chart.xAxes.push(new am4charts.ValueAxis());
xvalueAxis.renderer.maxGridDistance = 1;
xvalueAxis.title.text = 'Time (s)'

var yvalueAxis = chart.yAxes.push(new am4charts.ValueAxis());
yvalueAxis.title.text = 'Amplitiude (µV)'
yvalueAxis.numberFormatter = new am4core.NumberFormatter();
yvalueAxis.numberFormatter.numberFormat = "#,###";
// Create series
var series = chart.series.push(new am4charts.LineSeries());
series.dataFields.valueY = "y";
series.dataFields.valueX = "x";
series.tooltipText = "{x}"

series.tooltip.pointerOrientation = "vertical";

chart.cursor = new am4charts.XYCursor();
chart.cursor.snapToSeries = series;
chart.cursor.xAxis = xvalueAxis;

//chart.scrollbarY = new am4core.Scrollbar();
chart.scrollbarX = new am4core.Scrollbar();

}); // end am4core.ready()