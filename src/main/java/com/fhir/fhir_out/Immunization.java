package com.fhir.fhir_out;

public class Immunization {
    String immunization_id;
    String vaccine_code;
    String vaccine_name;

    public String getImmunization_id() {
        return immunization_id;
    }

    public String getVaccine_code() {
        return vaccine_code;
    }

    public String getVaccine_name() {
        return vaccine_name;
    }

    public Immunization(String immunization_id, String vaccine_code, String vaccine_name)
    {
        this.immunization_id = immunization_id;
        this.vaccine_code = vaccine_code;
        this.vaccine_name = vaccine_name;

    }
}
