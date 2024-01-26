package com.fhir.fhir_out.util;

import com.fhir.fhir_out.Encounter;
import com.fhir.fhir_out.Immunization;
import com.fhir.fhir_out.Practioner;
import com.fhir.fhir_out.patient;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class JSONBuilder extends resourceIdentifier{

    public static JSONArray generateDrugVsIntakeCount()
    {
        HashMap<String,Integer> DrugVsVaccineCount = new HashMap<>();
        Iterator iterator = patientVsId.values().iterator();
        while(iterator.hasNext())
        {
            patient patientObj = (patient) iterator.next();
            Iterator iterator1 = patientObj.immunization.listIterator();
            while(iterator1.hasNext())
            {
                String drugCode = ((Immunization)iterator1.next()).getVaccine_code();
                if(DrugVsVaccineCount.containsKey(drugCode))
                {
                    int count = DrugVsVaccineCount.get(drugCode);
                    count++;
                    DrugVsVaccineCount.replace(drugCode,count);
                }
                else {
                    DrugVsVaccineCount.put(drugCode,1);
                }
            }
        }

        JSONObject resultObject = new JSONObject(DrugVsVaccineCount);
        Iterator iterator2 = resultObject.keys();
        JSONArray jsonArray = new JSONArray();
        while (iterator2.hasNext())
        {
            String drugCode = (String) iterator2.next();
            JSONObject jsonObject1 = new JSONObject();
            jsonObject1.put("XAxisValue",drugCode);
            jsonObject1.put("YAxisValue",resultObject.get(drugCode));
            jsonArray.put(jsonObject1);
        }
        return jsonArray;
    }

    public static JSONArray fetchGenderProfile()
    {
        Integer maleCount =0, femaleCount =0;
        Iterator iterator = patientVsId.values().iterator();
        while(iterator.hasNext())
        {
            patient patient = (com.fhir.fhir_out.patient) iterator.next();
            if(patient.getGender().equals("male"))
            {
                maleCount++;
            }
            else
            {
                femaleCount++;
            }
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("male_count",maleCount);
        jsonObject.put("female_count",femaleCount);
        JSONArray jsonArray = new JSONArray();
        jsonArray.put(jsonObject);

        return jsonArray;
    }

    public static JSONArray fetchDoctorVsCountDetails()
    {
        HashMap<String,Integer> doctorVsCount = new HashMap<>();
        Iterator iterator = patientVsId.values().iterator();
        while(iterator.hasNext())
        {
            List<Practioner> practionerList = ((patient)iterator.next()).practioners;
            for(Practioner practioner : practionerList)
            {
                if(doctorVsCount.containsKey(practioner.getGiven_name()))
                {
                    int count = doctorVsCount.get(practioner.getGiven_name());
                    count++;
                    doctorVsCount.replace(practioner.getGiven_name(), count);
                }
                else
                {
                    doctorVsCount.put(practioner.getGiven_name(),1);
                }
            }

            if(doctorVsCount.size() == 40)
            {
                break;
            }
        }
        JSONArray jsonArray = new JSONArray();
        jsonArray.put(doctorVsCount);
        return jsonArray;
    }

    public static JSONArray generateYearVsEncounterCount()
    {
        Iterator iterator = encounterList.iterator();
        HashMap<String,Integer> yearVsEncounter = new HashMap<>();
        while ((iterator.hasNext()))
        {
            Encounter encounter = (Encounter) iterator.next();
            if(yearVsEncounter.containsKey(encounter.getEncounter_year()))
            {
                int count = yearVsEncounter.get(encounter.getEncounter_year());
                count++;
                yearVsEncounter.replace(encounter.getEncounter_year(),count);
            }
            else
            {
                yearVsEncounter.put(encounter.getEncounter_year(),1);
            }

        }
        JSONObject resultObject = new JSONObject(yearVsEncounter);
        Iterator iterator2 = resultObject.keys();
        JSONArray jsonArray = new JSONArray();
        while (iterator2.hasNext())
        {
            String year = (String) iterator2.next();
            JSONObject jsonObject1 = new JSONObject();
            jsonObject1.put("XAxisValue",year);
            jsonObject1.put("YAxisValue",resultObject.get(year));
            jsonArray.put(jsonObject1);
        }
        return jsonArray;
    }
}
