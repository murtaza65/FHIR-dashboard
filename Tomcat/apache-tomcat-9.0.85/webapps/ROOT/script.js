function generateChart() {
    var chartType = $("#chartType").val();
    var xAxisValue = $("#xAxis").val();
    var yAxisValue = $("#yAxis").val();

    $.ajax({
    url: "http://localhost:8080/get_chart_data",
    method: "GET",
    data: {
        ChartType : chartType,
        XAxisValue : xAxisValue,
        YAxisValue : yAxisValue
    },
    success: function (data) {
        // Parse the JSON data received from the servlet
        var jsonDataString = JSON.stringify(data);

        // Encode the JSON string to make it URL-safe
        var encodedData = encodeURIComponent(jsonDataString);

        if($("#chartType").val() === "bar_chart")
        {
            window.location.href = "chart.jsp?jsonData=" + encodedData;
        }
        else if($("#chartType").val() === "pie_chart")
        {
            window.location.href = "pie_chart.jsp?jsonData=" + encodedData;
        }
        else if($("#chartType").val() === "dough_chart")
        {
            window.location.href = "dough_chart.jsp?jsonData=" + encodedData;
        }
        else if($("#chartType").val() === "scatter_chart")
        {
            window.location.href = "scatter_chart.jsp?jsonData=" + encodedData;
        }
        // Redirect to chart.jsp with the encoded data as a query parameter

        /*window.location.href = "chart.jsp";*/

},
    error: function (error) {
    console.error("Error fetching data:", error);
}
});
}

  /*  function renderChart(data, chartType) {
    // Example D3.js code for rendering the chart with the received data
    d3.select("#generatedChart").selectAll("*").remove(); // Clear existing chart
    console.log(d3);
    var modalBody = d3.select("#generatedChart");

    if (chartType === "bar_chart") {
    // set the dimensions and margins of the graph
    var margin = {top: 30, right: 30, bottom: 70, left: 60},
    width = 460 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

    // append the svg object to the body of the page
    var svg = d3.select("#generatedChart")
    .append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform",
    "translate(" + margin.left + "," + margin.top + ")");

    // Parse the Data
    d3.csv("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/7_OneCatOneNum_header.csv", function(data) {
    console.log("ENADHA NADAKUDHU INGA!")
    console.log("CSV Data:", data);

    var x = d3.scaleBand()
    .range([ 0, width ])
    .domain(data.valueOf(function(d) { return d.Country; }))
    .padding(0.2);
    svg.append("g")
    .attr("transform", "translate(0," + height + ")")
    .call(d3.axisBottom(x))
    .selectAll("text")
    .attr("transform", "translate(-10,0)rotate(-45)")
    .style("text-anchor", "end");

    console.log(svg)
    // Add Y axis
    var y = d3.scaleLinear()
    .domain([0, 13000])
    .range([ height, 0]);
    svg.append("g")
    .call(d3.axisLeft(y));

    // Bars
    svg.selectAll("mybar")
    .data(data)
    .enter()
    .append("rect")
    .attr("x", function(d) { return x(d.Country); })
    .attr("y", function(d) { return y(d.Value); })
    .attr("width", x.bandwidth())
    .attr("height", function(d) { return height - y(d.Value); })
    .attr("fill", "#69b3a2")
});
} else if (chartType === "pie_chart") {
    // Render pie chart
    var svg = modalBody.append("svg")
    .attr("width", 400)
    .attr("height", 400);

    var color = d3.scaleOrdinal(d3.schemeCategory10);

    var pie = d3.pie();

    var arc = d3.arc()
    .innerRadius(0)
    .outerRadius(200);

    svg.selectAll("path")
    .data(pie(data))
    .enter()
    .append("path")
    .attr("d", arc)
    .attr("fill", function (d, i) {
    return color(i);
});
}

    // Show the modal
    $("#chartModal").modal("show");
}*/