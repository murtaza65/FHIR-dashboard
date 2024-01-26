<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FHIR Patient Analytics Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- D3.js -->
    <script src="https://d3js.org/d3.v5.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <!-- Bootstrap JS (include it after jQuery) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script src="script.js"></script>

    <style>
        body {
            background-color: #f1f0f6; /* Pale violet background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container-fluid {
            padding: 20px;
        }

        h1 {
            text-align: center;
            text-transform: uppercase;
            background-color: #5e5873; /* Dark purple background for header */
            color: #fff; /* White text color */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card {
            margin-top: 20px;
            border: 2px solid #5e5873; /* Dark purple border for widgets */
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .card:hover {
            transform: scale(1.02);
        }

        .card-header {
            background-color: #5e5873; /* Dark purple background for widget headers */
            color: #fff;
            font-weight: bold;
            padding: 15px;
            border-bottom: 2px solid #495057; /* Dark gray border */
            border-radius: 15px 15px 0 0;
        }

        .card-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color: #5e5873;
        }

        input.form-control {
            border: 1px solid #ced4da; /* Light gray border for inputs */
            border-radius: 5px;
        }

        button {
            transition: background-color 0.3s ease-in-out;
            background-color: #5e5873; /* Dark purple background for buttons */
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #495057; /* Dark gray background on hover */
        }

        /* Added styles for better spacing of axis labels */
        .axis-labels {
            margin-top: 15px;
        }

        /* Modal styles */
        .modal-content {
            border-radius: 15px;
        }

        .modal-header {
            background-color: #5e5873;
            color: #fff;
            border-bottom: 2px solid #495057;
            border-radius: 15px 15px 0 0;
        }

        .modal-body {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <h1>FHIR Patient Analytics Dashboard</h1>

    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    Bar Chart
                </div>
                <div class="card-body">
                    <form id="chartForm">
                        <div class="form-group">
                            <label for="chartType" class="row justify-content-center">Chart Type</label>
                            <select class="form-control" id="chartType">
                                <option value="bar_chart">Bar Chart</option>
                                <option value="pie_chart">Pie Chart</option>
                                <option value="dough_chart">Doughnut Chart</option>
                                <option value="scatter_chart">Scatter Plot Chart</option>
                            </select>
                        </div>
                        <button type="button" class="btn btn-primary row justify-content-center" onclick="generateChart()">Generate Chart</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for displaying the chart -->
    <div class="modal" id="chartModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style="width: 100%; height: 100%">
                <div class="modal-header" style="width: 100%; height: 100%">
                    <h5 class="modal-title">Generated Chart</h5>
                </div>
                <div class="modal-body" id="generatedChart"></div>
            </div>
        </div>
    </div>

</div>


</body>
</html>
