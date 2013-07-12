var fluctuationChart = dc.barChart("#fluctuation-chart");

var jsonStr = ([
  {"date": "2011-11-14", "value": 0.1121},
  {"date": "2011-11-15", "value": 0.2221},
  {"date":"2011-11-16", "value": 0.3321},
  {"date":"2011-11-17", "value": 0.4221},
  {"date":"2011-11-18", "value": 0.5111},
  {"date":"2011-11-19", "value": 0.6141},
  {"date":"2011-11-20", "value": 0.7121},
  {"date":"2011-11-21", "value": 0.7131},
  {"date":"2011-11-22", "value": -0.6544},
  {"date":"2011-11-23", "value": -0.3131},
  {"date":"2011-11-24", "value": -0.2122},
  {"date":"2011-11-25", "value": -0.0231}
]);


// set up my date objects
var timeFormat = d3.time.format("%Y-%m-%d");
jsonStr.forEach(function (e) {
    e.date = timeFormat.parse(e.date);
    e.dd = new Date(e.date);
    e.month = d3.time.month(e.dd);
});

// feed it through crossfilter
var ndx = crossfilter(jsonStr);
var all = ndx.groupAll();

//setup dimmensions
var dateDimension = ndx.dimension(function (d) {
    return d.dd;
});

//fluctuation chart
var fluctuation = ndx.dimension(function (d) {
    return d.value;
});

var fluctuationGroup = fluctuation.group(function(d){
  return Math.round(d*10)/10;
});

fluctuationChart.width(420)
    .height(180)
    .margins({
    top: 10,
    right: 50,
    bottom: 30,
    left: 40
})
    .dimension(fluctuation)
    .group(fluctuationGroup)
    .elasticY(true)
    .centerBar(true)
    .x(d3.scale.linear().domain([-2, 2]))
    .xUnits(dc.units.float.precision(0.01))
    .renderHorizontalGridLines(true)
    .xAxis();

dc.dataTable(".dc-data-table")
    .dimension(dateDimension)
    .group(function (d) {
    var format = d3.format("02d");
    return d.dd.getFullYear() + "/" + format((d.dd.getMonth() + 1));
})
    .size(10)
    .columns([

function (d) {
    return d.date;
},

function (d) {
    return d.value;
}])
    .sortBy(function (d) {
    return d.value;
})
    .order(d3.ascending)
    .renderlet(function (table) {
    table.selectAll(".dc-table-group").classed("info", true);
});

dc.dataCount(".dc-data-count")
    .dimension(ndx)
    .group(all);

dc.renderAll();