package com.fhir.fhir_out;

public class Encounter {

    String id;
    String encounter_type;
    String patient_name;
    String doctor_name;
    String encounter_year;
    String encounter_month;

    public Encounter(String id, String encounter_type, String patient_name, String encounter_year, String encounter_month) {
        this.id = id;
        this.encounter_type = encounter_type;
        this.patient_name = patient_name;
        this.encounter_year = encounter_year;
        this.encounter_month = encounter_month;
    }

    public Encounter() {

    }

    public String getId() {
        return id;
    }

    public String getEncounter_type() {
        return encounter_type;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public String getEncounter_year() {
        return encounter_year;
    }

    public String getEncounter_month() {
        return encounter_month;
    }
}
