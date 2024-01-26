package com.fhir.fhir_out;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;


import static com.fhir.fhir_out.util.JSONBuilder.*;
import static com.fhir.fhir_out.util.JsonFileReader.processJsonFiles;

@WebServlet(name = "helloServlet", value = "/get_chart_data")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        String directoryPath = "/workspaces/FHIR-dashboard/FHIR_Data/fhir"; // Replace with the actual path to your directory
        int numberOfFilesToProcess = 50;

        processJsonFiles(directoryPath, numberOfFilesToProcess);
        message = "Hello World!";
        //System.out.println(resourceIdentifier.patientVsId);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");

        JSONArray outputString = new JSONArray();
        switch (request.getParameter("ChartType"))
        {
            case "bar_chart":  outputString = generateDrugVsIntakeCount();
                                break;
            case "pie_chart": outputString = fetchGenderProfile();
                                break;
            case "dough_chart": outputString = fetchDoctorVsCountDetails();
                                break;
            case "scatter_chart": outputString = generateYearVsEncounterCount();
                                break;
        }

        PrintWriter out = response.getWriter();
        ((JSONArray) outputString).write(out);
        out.close();
    }

    public void destroy() {
    }
}