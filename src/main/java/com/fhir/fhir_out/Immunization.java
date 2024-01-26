package com.webapp.fhir2;

public class Immunization {
    String immunization_id;
    String vaccine_code;
    String vaccine_name;

    public Immunization(String immunization_id,String vaccine_code, String vaccine_name)
    {
        this.immunization_id = immunization_id;
        this.vaccine_code = vaccine_code;
        this.vaccine_name = vaccine_name;

    }
}
