package com.webapp.fhir2.util;

import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class JsonFileReader {

    public static void main(String[] args) {
        String directoryPath = "/home/vishva-18161/FHIR/fhir"; // Replace with the actual path to your directory
        int numberOfFilesToProcess = 20;

        processJsonFiles(directoryPath, numberOfFilesToProcess);
    }

    public static void processJsonFiles(String directoryPath, int numberOfFilesToProcess) {
        File directory = new File(directoryPath);

        // Validate if the provided path is a directory
        if (!directory.isDirectory()) {
            System.out.println("Invalid directory path: " + directoryPath);
            return;
        }

        File[] files = directory.listFiles((dir, name) -> name.toLowerCase().endsWith(".json"));

        if (files != null) {
            int count = 0;
            for (File file : files) {
                if (count < numberOfFilesToProcess) {
                    processSingleJsonFile(file);
                    count++;
                } else {
                    break; // Stop processing files after the specified number
                }
            }
        }
    }

    private static void processSingleJsonFile(File jsonFile) {
        try {
            // Read the JSON file
            JSONTokener tokener = new JSONTokener(new FileReader(jsonFile));
            JSONObject jsonObject = new JSONObject(tokener);

            // Perform actions with the JSONObject
            // Example: Print the JSON content
            resourceIdentifier.processResourceIdentifier(jsonObject.getJSONArray("entry"));
            System.out.println("Processing file: " + jsonFile.getName());
            // System.out.println(jsonObject.toString(4)); // Use indentation of 4 spaces

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
