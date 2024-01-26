package com.fhir.fhir_out.util;

public class Practioner {
    String id;
    String given_name;

    public Practioner(String id, String given_name) {
        this.id = id;
        this.given_name = given_name;
    }

    public String getId() {
        return id;
    }

    public String getGiven_name() {
        return given_name;
    }
}
