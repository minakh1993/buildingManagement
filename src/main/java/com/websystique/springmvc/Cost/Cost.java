package com.websystique.springmvc.Cost;

import javax.persistence.*;
import java.util.Date;

/**
 * @author mina khoshnevisan
 * 12/10/2018
 */

@Entity
@Table(name = "Cost")
public class Cost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "date")
    private Date date;

    @Column(name = "amount")
    private Double amount;

    @Column(name = "tracking_number")
    private String trackingNumber;

    @Column(name = "description")
    private String description;

    public Cost() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getTrackingNumber() {
        return trackingNumber;
    }

    public void setTrackingNumber(String trackingNumber) {
        this.trackingNumber = trackingNumber;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
