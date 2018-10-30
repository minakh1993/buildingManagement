package com.websystique.springmvc.charge;

import com.websystique.springmvc.block.Block;

import javax.persistence.*;
import java.util.Date;

/**
 * @author mina khoshnevisan
 * 12/10/2018
 */

@Entity
@Table(name = "Charge")
public class Charge {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "id")
    private Long id;

    @Column(name = "deposit_time")
    private Date depositTime;

    @OneToOne
    private Block block;

    @Column(name = "tracking_number")
    private String trackingNumber;

    @Column(name = "description")
    private String description;

    @Column(name = "amount")
    private Double amount;

    public Charge() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDepositTime() {
        return depositTime;
    }

    public void setDepositTime(Date depositTime) {
        this.depositTime = depositTime;
    }

    public Block getBlock() {
        return block;
    }

    public void setBlock(Block block) {
        this.block = block;
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

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }
}
