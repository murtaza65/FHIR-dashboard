<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pie Chart - Doctor Popularity Distribution</title>
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
  <h1>Doughnut Chart - Doctor Popularity Distribution</h1>
  <div class="alert alert-primary" role="alert">
    The doughnut chart displays the details of most popular doctors from the given dataset.
    The pie area represents the total count of patients who have visited the doctor. The annotations of
    each part is the doctor name.
  </div>
  <div id="my_dataviz"></div>
</div>

<script>

  var jsonDataString = decodeURIComponent(window.location.search.substring(1).split("=")[1]);
  // set the dimensions and margins of the graph
  var width = 1000
  height = 700
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
          .range(d3.schemeDark2);

  // Compute the position of each group on the pie
  var pie = d3.pie()
          .sort(null) // Do not sort group by size
          .value(function (d) { return d.value; })
  var data_ready = pie(d3.entries(data))

  // The arc generator
  var arc = d3.arc()
          .innerRadius(radius * 0.5)         // This is the size of the donut hole
          .outerRadius(radius * 0.8)

  // Another arc that won't be drawn. Just for labels positioning
  var outerArc = d3.arc()
          .innerRadius(radius * 0.9)
          .outerRadius(radius * 0.9)

  // Build the pie chart
  svg
          .selectAll('allSlices')
          .data(data_ready)
          .enter()
          .append('path')
          .attr('d', arc)
          .attr('fill', function (d) { return (color(d.data.key)) })
          .attr("stroke", "white")
          .style("stroke-width", "2px")
          .style("opacity", 0.7)

  // Add the polylines between chart and labels:
  svg
          .selectAll('allPolylines')
          .data(data_ready)
          .enter()
          .append('polyline')
          .attr("stroke", "black")
          .style("fill", "none")
          .attr("stroke-width", 1)
          .attr('points', function (d) {
            var posA = arc.centroid(d) // line insertion in the slice
            var posB = outerArc.centroid(d) // line break: we use the other arc generator that has been built only for that
            var posC = outerArc.centroid(d); // Label position = almost the same as posB
            var midangle = d.startAngle + (d.endAngle - d.startAngle) / 2 // we need the angle to see if the X position will be at the extreme right or extreme left
            posC[0] = radius * 0.95 * (midangle < Math.PI ? 1 : -1); // multiply by 1 or -1 to put it on the right or on the left
            return [posA, posB, posC]
          })

  // Add the polylines between chart and labels:
  svg
          .selectAll('allLabels')
          .data(data_ready)
          .enter()
          .append('text')
          .text(function (d) { console.log(d.data.key); return d.data.key })
          .attr('transform', function (d) {
            var pos = outerArc.centroid(d);
            var midangle = d.startAngle + (d.endAngle - d.startAngle) / 2
            pos[0] = radius * 0.99 * (midangle < Math.PI ? 1 : -1);
            return 'translate(' + pos + ')';
          })
          .style('text-anchor', function (d) {
            var midangle = d.startAngle + (d.endAngle - d.startAngle) / 2
            return (midangle < Math.PI ? 'start' : 'end')
          })
</script>

</body>

</html>
