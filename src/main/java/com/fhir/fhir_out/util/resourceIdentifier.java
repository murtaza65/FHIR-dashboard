package com.fhir.fhir_out.util;


import com.fhir.fhir_out.Encounter;
import com.fhir.fhir_out.patient;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class resourceIdentifier {
    public static Map<String, patient> patientVsId = new HashMap<>();
    public static List<Encounter> encounterList = new ArrayList<>();
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
           else if (((HashMap)(HashMap)((HashMap) entryArrayList.get(i)).get("request")).get("url").equals("Practitioner"))
           {
               patientVsId.get(patient_Id).addPractioner(((HashMap)(HashMap)((HashMap) entryArrayList.get(i)).get("resource")));
           }
           else if (((HashMap)(HashMap)((HashMap) entryArrayList.get(i)).get("request")).get("url").equals("Encounter"))
           {
               encounterList.add(new Encounter(((HashMap)((HashMap) entryArrayList.get(i)).get("resource")).get("id").toString(),((HashMap)((ArrayList)((HashMap)((HashMap) entryArrayList.get(i)).get("resource")).get("type")).get(0)).get("text").toString(),((HashMap)((HashMap)((HashMap) entryArrayList.get(i)).get("resource")).get("subject")).get("display").toString(), ((HashMap)((HashMap)((HashMap) entryArrayList.get(i)).get("resource")).get("period")).get("start").toString().substring(0,4),((HashMap)((HashMap)((HashMap) entryArrayList.get(i)).get("resource")).get("period")).get("start").toString().substring(5,7)));
           }
        }
    }



}
