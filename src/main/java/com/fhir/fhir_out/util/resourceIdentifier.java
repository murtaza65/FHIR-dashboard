package com.fhir.fhir_out.util;

import com.webapp.fhir2.patient;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class resourceIdentifier {
    public static Map<String, patient> patientVsId = new HashMap<>();
    public static void processResourceIdentifier(JSONArray entryArray)
    {

        JSONObject resourceObject = (JSONObject) entryArray.get(0);
        new patient().constructPatient(resourceObject.get("resource"),patientVsId);

        ArrayList entryArrayList = (ArrayList) entryArray.toList();
        for(int i=1;i<entryArrayList.size();i++)
        {
            String patient_Id = ((JSONObject)resourceObject.get("resource")).get("id").toString();
           if (((HashMap)(HashMap)((HashMap) entryArrayList.get(i)).get("request")).get("url").equals("Immunization"))
           {
               patientVsId.get(patient_Id).constructImmunizationDetail(((HashMap)(HashMap)((HashMap) entryArrayList.get(i)).get("resource")));
           }
        }
    }



}
