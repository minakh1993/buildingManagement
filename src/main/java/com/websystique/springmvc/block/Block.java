package com.websystique.springmvc.block;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;

/**
 * @author mina khoshnevisan
 * 12/10/2018
 */

@Entity
@Table(name = "Block")
public class Block {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id" )
    private Long id;

    @Column(name = "block_number")
    private Integer blockNumber;

    @Column(name = "area")
    private Long area;

    @Column(name = "household_number")
    private Integer householdNumber;

    @Column(name = "family_name")
    private String familyName;

    @Column(name = "phone_number")
    private String phoneNumber;

    public Block() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getBlockNumber() {
        return blockNumber;
    }

    public void setBlockNumber(Integer blockNumber) {
        this.blockNumber = blockNumber;
    }

    public Long getArea() {
        return area;
    }

    public void setArea(Long area) {
        this.area = area;
    }

    public Integer getHouseholdNumber() {
        return householdNumber;
    }

    public void setHouseholdNumber(Integer householdNumber) {
        this.householdNumber = householdNumber;
    }

    public String getFamilyName() {
        return familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
