var graph = {"nodes": [
    {"name": "Betty",  "size": 12, "company": "X", "location": "ChicagoIL"},
    {"name": "Frank",  "size": 12, "company": "Y", "location": "NewYorkNY"},
    {"name": "Jim",    "size": 12, "company": "Y", "location": "LosAngelesCA"},
    {"name": "Sally",  "size": 12, "company": "Z", "location": "TorontoON"},
    {"name": "Tom",    "size": 12, "company": "X", "location": "ChicagoIL"},
    {"name": "GroupA", "size": 18, "company": "T", "location": "x"},
    {"name": "GroupB", "size": 18, "company": "T", "location": "x"}],
  "links": [
    {"source": 2, "target": 5,  "bond": 1},
    {"source": 3, "target": 5,  "bond": 2},
    {"source": 4, "target": 5,  "bond": 1},
    {"source": 0, "target": 6,  "bond": 1},
    {"source": 1, "target": 6,  "bond": 2},
    {"source": 4, "target": 6,  "bond": 1}],
  "locs": [
    {"lat": 40.7142, "long":  -74.0064, "location": "NewYorkNY"},
    {"lat": 34.0522, "long": -118.2428, "location": "LosAngelesCA"},
    {"lat": 43.6481, "long":  -79.4042, "location": "TorontoON"},
    {"lat": 41.8500, "long":  -87.6500, "location": "ChicagoIL"}]};

  var width = 250;
  var height = 250;
  var padding = 20;

  var color = d3.scale.category20();

  var radius = d3.scale.sqrt()
    .range([0, 7]);

  var scale = d3.scale.linear();

  var svg = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height);

  var svg2 = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height);

  var force = d3.layout.force()
    .size([width, height])
    .charge(-400)
    .linkStrength(3)
    .linkDistance(function(d) {
      return radius(d.source.size) + radius(d.target.size) + (30 / (2*d.bond-1))
      ; });

    // network diagram stuff

    force
      .nodes(graph.nodes)
      .links(graph.links)
      .on("tick", tick)
      .start();

    var link = svg.selectAll(".link")
      .data(graph.links)
      .enter().append("g")
      .attr("class", "link");

    link.append("line")
      .style("stroke-width", function(d) { return (d.bond * 2 - 1) * 3 + "px"; });

    link.filter(function(d) { return d.bond > 1; }).append("line")
      .attr("class", "separator");

    var node = svg.selectAll(".node")
      .data(graph.nodes)
      .enter().append("g")
      .attr("class", function(d) { return "node " + d.name + " " + d.location; })
      .call(force.drag)
      .on("mouseover", function(d) { 
        // I would like to insert an if statement to do all of these things to the connected nodes
        // if(isConnected(d, o)) {
          d3.select(this).select("circle").style("stroke-width", 6); 
          d3.select(this).select("circle").style("stroke", "orange"); 
          d3.select(this).select("text").style("font", "20px sans-serif");
          d3.selectAll("rect." + d.location).style("stroke-width", 6);
          d3.selectAll("rect." + d.location).style("stroke", "orange");
          d3.selectAll("text." + d.location).style("font", "20px sans-serif");
          d3.selectAll("tr." + d.name).style("background-color", "orange");
          //}
        })
      .on("mouseout",  function(d) { 
        // if(isConnected(d, o)) {
          d3.select(this).select("circle").style("stroke-width", 1.5); 
          d3.select(this).select("circle").style("stroke", "gray"); 
          d3.select(this).select("text").style("font", "12px sans-serif");
          d3.selectAll("rect." + d.location).style("stroke-width", 1.5);
          d3.selectAll("rect." + d.location).style("stroke", "gray");
          d3.selectAll("text." + d.location).style("font", "12px sans-serif");
          d3.selectAll("tr." + d.name).style("background-color", "white");
          //}
        });

    node.append("circle")
      .attr("r", function(d) { return radius(d.size); })
      .style("fill", function(d) { return color(d.name); });

    node.append("text")
      .attr("dy", ".35em")
      .attr("text-anchor", "middle")
      .text(function(d) { return d.name; });

    var linkedByIndex = {};
      graph.links.forEach(function(d) {
        linkedByIndex[d.source.index + "," + d.target.index] = 1;
        });

    function isConnected(a, b) {
      return linkedByIndex[a.index + "," + b.index] || linkedByIndex[b.index + "," + a.index] || a.index == b.index;
      }

    function tick() {
      link.selectAll("line")
        .attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });
      node.attr("transform", function(d) { 
        return "translate(" + d.x + "," + d.y + ")"; });
      }


    // map stuff

    var xScale = d3.scale.linear()
      .domain([d3.min(graph.locs, function(d) { return d.long; }), d3.max(graph.locs, function(d) { return d.long; })])
      .range([padding, width-(4*padding)]);

    var yScale = d3.scale.linear()
      .domain([d3.min(graph.locs, function(d) { return d.lat; }), d3.max(graph.locs, function(d) { return d.lat; })])
      .range([height-padding, padding]);

    var mapit = svg2.selectAll(".mapit")
      .data(graph.locs)
      .enter().append("g")
      .on("mouseover", function(d) { 
        d3.select(this).select("rect").style("stroke-width", 6); 
        d3.select(this).select("rect").style("stroke", "orange"); 
        d3.select(this).select("text").style("font", "20px sans-serif");
        d3.selectAll("g." + d.location + " circle").style("stroke-width", 6); 
        d3.selectAll("g." + d.location + " circle").style("stroke", "orange"); 
        d3.selectAll("g." + d.location + " text").style("font", "20px sans-serif");
        d3.selectAll("tr." + d.location).style("background-color", "orange");
        })
      .on("mouseout",  function(d) { 
        d3.select(this).select("rect").style("stroke-width", 1.5); 
        d3.select(this).select("rect").style("stroke", "gray"); 
        d3.select(this).select("text").style("font", "12px sans-serif");
        d3.selectAll("g." + d.location + " circle").style("stroke-width", 1.5); 
        d3.selectAll("g." + d.location + " circle").style("stroke", "gray"); 
        d3.selectAll("g." + d.location + " text").style("font", "12px sans-serif");
        d3.selectAll("tr." + d.location).style("background-color", "white");
        });

    mapit.append("rect")
      .attr("x", function(d) { return xScale(d.long); })
      .attr("y", function(d) { return yScale(d.lat); })
      .attr("height", 20)
      .attr("width", 20)
      .attr("fill", "gray")
      .attr("stroke-width", "1.5")
      .attr("stroke", "gray")
      .attr("class", function(d) { return d.location ;});

    mapit.append("text")
      .attr("x", function(d) { return xScale(d.long); })
      .attr("y", function(d) { return yScale(d.lat) -5; })
      .attr("font-family", "sans-serif")
      .attr("font-size", "12px")
      .attr("fill", "black")
      .text(function(d) { return d.location; })
            .attr("class", function(d) { return d.location ;});

    // table stuff

    function tabulate(tdata, columns) {
      var table = d3.select("body").append("table"),
        thead = table.append("thead"),
        tbody = table.append("tbody");
      thead.append("tr").selectAll("th")
        .data(columns)
        .enter().append("th")
        .text(function(column) { return column; });

      var rows = tbody.selectAll("tr")
        .data(tdata)
        .enter().append("tr")
        .attr("class", function(d) { return d.name + " " + d.location ;})
        .on("mouseover", function(d){
          d3.select(this).style("background-color", "orange");
          d3.selectAll("g." + d.name + " circle").style("stroke-width", 6);
          d3.selectAll("g." + d.name + " circle").style("stroke", "orange");
          d3.selectAll("g." + d.name + " text").style("font", "20px sans-serif");
          d3.selectAll("rect." + d.location).style("stroke-width", 6);
          d3.selectAll("rect." + d.location).style("stroke", "orange");
          d3.selectAll("text." + d.location).style("font", "20px sans-serif");
          })
        .on("mouseout", function(d){
          d3.select(this).style("background-color", "white");
          d3.selectAll("g." + d.name + " circle").style("stroke-width", 1);
          d3.selectAll("g." + d.name + " circle").style("stroke", "gray");
          d3.selectAll("g." + d.name + " text").style("font", "12px sans-serif");
          d3.selectAll("rect." + d.location).style("stroke-width", 1.5);
          d3.selectAll("rect." + d.location).style("stroke", "gray");
          d3.selectAll("text." + d.location).style("font", "12px sans-serif");
          });
      
      var cells = rows.selectAll("td")
        .data(function(row) {
          return columns.map(function(column) {
            return {column: column, value: row[column]};
            });
          })
        .enter().append("td")
        .text(function(d) { return d.value; });
      return table;
      }

    var subdata = graph.nodes.filter(function(d) { return d.location!="x"; });

    var myTable = tabulate(subdata, ["name", "company", "location"]);

    myTable.selectAll("thead th")
      .text(function(column) {
        return column.charAt(0).toUpperCase() + column.substr(1);
      });
      
    myTable.selectAll("tbody tr")
      .sort(function(a, b) {
        return d3.ascending(a.name, b.name);
      });