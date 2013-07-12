var json = {
    "name": "flare",
    "children": [
        { "name": "test1", "size": 20, "color": "#ff0000" , "id": 1},
        { "name": "test2", "size": 40, "color": "#ffff00", "id": 2},
        { "name": "test3", "size": 60, "color": "#ff0000", "id": 3},
        { "name": "test4", "size": 80, "color": "#ff00ff", "id": 4 },
        { "name": "test5", "size": 100, "color": "#0000ff", "id": 5}
    ]
};

var r = 960,
    format = d3.format(",d"),
    fill = d3.scale.category20c();

var bubble = d3.layout.pack()
    .sort(null)
    .size([r, r])

    .padding(1.5);

var vis = d3.select("#chart").append("svg")
    .attr("width", r)
    .attr("height", r)

    .attr("class", "bubble");


var node = vis.selectAll("g.node")
    .data(bubble.nodes(classes(json))
    .filter(function (d) { return !d.children; }))
    .enter().append("g")
    .attr("class", "node")
    .attr("transform", function (d) { return "translate(" + d.x + "," + d.y + ")"; });

node.append("title")
    .text(function (d) { return d.className + ": " + format(d.value); });

node.append("circle")
    .attr("r", function (d) { return d.r; })   
    .style("fill", function (d) { return d.color; })
    .on("click", function (d) { alert("id: " + d.id); });

node.append("text")
    .attr("text-anchor", "middle")
    .attr("dy", ".3em")
    .text(function (d) { return d.className.substring(0, d.r / 3); });

function classes(root) {
    var classes = [];

    function recurse(name, node) {
        if (node.children) node.children.forEach(function (child) { recurse(node.name, child); });
        else classes.push({packageName: name, className: node.name, value: node.size, color: node.color, id: node.id});
    }

    recurse(null, root);
    return { children: classes };
}
