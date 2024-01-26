package com.webapp.fhir2;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class patient {
    String patient_id;
    String first_name;
    String sur_name;
    String country;
    String state;
    String gender;
    private List<Immunization> immunization = new ArrayList<>();

    public patient(String patient_id, String first_name, String sur_name, String country, String state, String gender) {
        this.patient_id = patient_id;
        this.first_name = first_name;
        this.sur_name = sur_name;
        this.country = country;
        this.state = state;
        this.gender = gender;
    }
    public patient(){}

    public patient(Object patientDetails)
    {
        this.patient_id = ((JSONObject) patientDetails).get("id").toString();
        this.first_name = ((JSONArray)((JSONObject)((JSONArray)((JSONObject) patientDetails).get("name")).get(0)).get("given")).get(0).toString();
        this.sur_name = ((JSONObject) ((JSONArray)((JSONObject) patientDetails).get("name")).get(0)).get("family").toString();
        this.country = ((JSONObject) ((JSONArray)((JSONObject) patientDetails).get("address")).get(0)).get("country").toString();
        this.state = ((JSONObject) ((JSONArray)((JSONObject) patientDetails).get("address")).get(0)).get("state").toString();
        this.gender = ((JSONObject) patientDetails).get("gender").toString();
    }

    public void constructPatient(Object patientDetails,Map patientVsID)
    {
        patient temp = new patient(patientDetails);
        patientVsID.put(temp.patient_id,temp);
    }

    public String getPatient_id() {
        return patient_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getSur_name() {
        return sur_name;
    }

    public String getCountry() {
        return country;
    }

    public String getState() {
        return state;
    }

    public String getGender() {
        return gender;
    }

    public void constructImmunizationDetail(HashMap immunzationDetail)
    {
       immunization.add(new Immunization(immunzationDetail.get("id").toString(),((HashMap)((ArrayList)((HashMap)immunzationDetail.get("vaccineCode")).get("coding")).get(0)).get("code").toString(),((HashMap)immunzationDetail.get("vaccineCode")).get("text").toString()));
    }


}
