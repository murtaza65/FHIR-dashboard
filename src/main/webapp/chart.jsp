<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bar Chart - VaccineCode vs Vaccine Intake Count</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <!-- D3.js -->
  <script src="https://d3js.org/d3.v4.js"></script>
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
      margin: 0 auto; /* Center the chart */
      border: 1px solid #ccc; /* Light gray border around the chart */
    }

    h1 {
      text-align: center;
      color: #5e5873; /* Dark purple color for title */
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Bar Chart - VaccineCode vs Vaccine Intake Count</h1>
  <div class="alert alert-primary" role="alert">
    The below bar chart represents the most number of vaccines taken by the people. The x-axis denotes the vaccine code
    and the y-axis denotes the total count. With the below chart, one can analyse which type of vaccine is most used by the people.
  </div>
  <div id="my_dataviz"></div>
</div>

<script>
  var jsonDataString = decodeURIComponent(window.location.search.substring(1).split("=")[1]);

  // set the dimensions and margins of the graph
  var margin = {top: 30, right: 30, bottom: 70, left: 60},
          width = 800 - margin.left - margin.right,
          height = 600 - margin.top - margin.bottom;

  var svg = d3.select("#my_dataviz")
          .append("svg")
          .attr("width", width + margin.left + margin.right)
          .attr("height", height + margin.top + margin.bottom)
          .append("g")
          .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  var jsonData = JSON.parse(jsonDataString);

  var x = d3.scaleBand()
          .range([0, width])
          .domain(jsonData.map(function(d) { return d.XAxisValue; }))
          .padding(0.2);
  svg.append("g")
          .attr("transform", "translate(0," + height + ")")
          .call(d3.axisBottom(x))
          .selectAll("text")
          .attr("transform", "translate(-10,0)rotate(-45)")
          .style("text-anchor", "end");

  var y = d3.scaleLinear()
          .domain([0, d3.max(jsonData, function(d) { return +d.YAxisValue; })])
          .range([height, 0]);
  svg.append("g")
          .call(d3.axisLeft(y));

  svg.selectAll("mybar")
          .data(jsonData)
          .enter()
          .append("rect")
          .attr("x", function(d) { return x(d.XAxisValue); })
          .attr("y", function(d) { return y(d.YAxisValue); })
          .attr("width", x.bandwidth())
          .attr("height", function(d) { return height - y(d.YAxisValue); })
          .attr("fill", "#69b3a2")
          .attr("stroke", "#5e5873"); /* Dark purple stroke around bars */
</script>

</body>
</html>
