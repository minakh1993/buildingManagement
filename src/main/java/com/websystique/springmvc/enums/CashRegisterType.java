package com.websystique.springmvc.enums;

/**
 * @author mina khoshnevisan
 * 12/10/2018
 */
public enum CashRegisterType {

    WITHDRAW("out"),
    DEPOSIT("in");

    private final String cashRegisterType;
    CashRegisterType(final String type) {
        this.cashRegisterType = type;
    }

    @Override
    public String toString() {
        return cashRegisterType;
    }
}
