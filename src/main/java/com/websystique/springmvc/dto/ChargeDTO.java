package com.websystique.springmvc.dto;

/**
 * @author mina khoshnevisan
 * 30/10/2018
 */
public class ChargeDTO {

    private String date;
    private String description;
    private String type;
    private String amount;
    private Integer blockNumber;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public Integer getBlockNumber() {
        return blockNumber;
    }

    public void setBlockNumber(Integer blockNumber) {
        this.blockNumber = blockNumber;
    }

    @Override
    public String toString() {
        return "ChargeDTO{" +
                "date='" + date + '\'' +
                ", description='" + description + '\'' +
                ", type='" + type + '\'' +
                ", amount='" + amount + '\'' +
                ", blockNumber=" + blockNumber +
                '}';
    }
}
