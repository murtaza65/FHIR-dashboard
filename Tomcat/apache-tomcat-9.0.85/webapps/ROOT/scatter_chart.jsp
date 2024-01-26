<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scatter Plot - Year Vs Patient Encounter</title>
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
    <h1>Scatter Plot - Year Vs Patient Encounter</h1>
    <div class="alert alert-primary" role="alert">
       The below graph describes the total count of the patient who have visited the hospital in a year.
        The Y-axis shows the count ranging from 0-100 and x-axis denotes the year.
        With the help of below scatter plot, one can analyse in which year the number patient visited the hospital is more.
    </div>
    <div id="my_dataviz"></div>
</div>

<script>
    var jsonDataString = decodeURIComponent(window.location.search.substring(1).split("=")[1]);

    // set the dimensions and margins of the graph
    var margin = { top: 10, right: 30, bottom: 30, left: 60 },
        width = 1500 - margin.left - margin.right,
        height = 700 - margin.top - margin.bottom;

    // append the svg object to the div called 'my_dataviz'
    var svg = d3.select("#my_dataviz")
        .append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform",
            "translate(" + margin.left + "," + margin.top + ")");



    var data = JSON.parse(jsonDataString)
        // Add X axis
        var x = d3.scaleLinear()
            .domain([1900, 2022])
            .range([0, 1000]);
        svg.append("g")
            .attr("transform", "translate(0," + height + ")")
            .call(d3.axisBottom(x));

        // Add Y axis
        var y = d3.scaleLinear()
            .domain([0, 100])
            .range([height, 0]);
        svg.append("g")
            .call(d3.axisLeft(y));

        // Add dots
        svg.append('g')
            .selectAll("dot")
            .data(data)
            .enter()
            .append("circle")
            .attr("cx", function (d) { return x(d.XAxisValue); })
            .attr("cy", function (d) { return y(d.YAxisValue); })
            .attr("r", 3)
            .style("fill", "#9e69b3")



</script>

</body>

</html>
