<!-- Code from d3-graph-gallery.com -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pie Chart - Gender Distribution</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <!-- D3.js -->
  <script src="https://d3js.org/d3.v4.js"></script>
  <!-- Color scale -->
  <script src="https://d3js.org/d3-scale-chromatic.v1.min.js"></script>
  <style>
    body {
      background-color: #f1f0f6; /* Light gray background */
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 20px; /* Margin for a box effect */
    }

    .container {
      border: 2px solid #5e5873; /* Dark purple border */
      border-radius: 15px;
      padding: 20px;
      background-color: #fff; /* White background */
    }

    #my_dataviz {
      display: flex;
      justify-content: center;
      align-items: center;
      border: 1px solid #ccc; /* Light gray border around the chart */
      margin-top: 20px; /* Adjusted margin for spacing */
    }

    h1 {
      text-align: center;
      color: #5e5873; /* Dark purple color for title */
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Pie Chart - Gender Distribution</h1>
  <div class="alert alert-primary" role="alert">
    The below pie chart gives the analysis of gender diversity in the given dataset. With the help of below chart, one can analyse their dataset on how many woman / men are present.
  </div>
  <div id="my_dataviz"></div>
</div>

<script>

  var jsonDataString = decodeURIComponent(window.location.search.substring(1).split("=")[1]);
  // set the dimensions and margins of the graph
  var width = 450
  height = 450
  margin = 40

  // The radius of the pie plot is half the width or half the height (smallest one). I subtract a bit of margin.
  var radius = Math.min(width, height) / 2 - margin

  // append the svg object to the div called 'my_dataviz'
  var svg = d3.select("#my_dataviz")
          .append("svg")
          .attr("width", width)
          .attr("height", height)
          .append("g")
          .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");


  var data1 = JSON.parse(jsonDataString)
  var data = data1[0]

  // set the color scale
  var color = d3.scaleOrdinal()
          .domain(data)
          .range(d3.schemeSet2);

  // Compute the position of each group on the pie
  var pie = d3.pie()
          .value(function(d) {return d.value; })
  var data_ready = pie(d3.entries(data))

  // shape helper to build arcs
  var arcGenerator = d3.arc()
          .innerRadius(0)
          .outerRadius(radius)

  // Build the pie chart
  svg
          .selectAll('mySlices')
          .data(data_ready)
          .enter()
          .append('path')
          .attr('d', arcGenerator)
          .attr('fill', function(d){ return(color(d.data.key)) })
          .attr("stroke", "black")
          .style("stroke-width", "2px")
          .style("opacity", 0.7)

  // Add annotation
  svg
          .selectAll('mySlices')
          .data(data_ready)
          .enter()
          .append('text')
          .text(function(d){ return d.data.key + "[COUNT: "+d.data.value+"]"})
          .attr("transform", function(d) { return "translate(" + arcGenerator.centroid(d) + ")";  })
          .style("text-anchor", "middle")
          .style("font-size", 17)
</script>

</body>
</html>
