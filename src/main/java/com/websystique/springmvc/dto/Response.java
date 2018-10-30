package com.websystique.springmvc.dto;

/**
 * @author mina khoshnevisan
 * 30/10/2018
 */
public class Response {

    private Long id;
    private String trackingNumber;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTrackingNumber() {
        return trackingNumber;
    }

    public void setTrackingNumber(String trackingNumber) {
        this.trackingNumber = trackingNumber;
    }
}
