package com.websystique.springmvc.CashRegister;

import com.websystique.springmvc.Cost.Cost;
import com.websystique.springmvc.charge.Charge;
import com.websystique.springmvc.enums.CashRegisterType;

import javax.persistence.*;
import java.util.Date;

/**
 * @author mina khoshnevisan
 * 12/10/2018
 */

@Entity
@Table(name = "CashRegister")
public class CashRegister {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "date")
    private Date date;

    @Column(name = "cash_register_type")
    private CashRegisterType cashRegisterType;

    @OneToOne
    private Charge charge;

    @OneToOne
    private Cost cost;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public CashRegister() {
    }

    public Charge getCharge() {
        return charge;
    }

    public void setCharge(Charge charge) {
        this.charge = charge;
    }

    public Cost getCost() {
        return cost;
    }

    public void setCost(Cost cost) {
        this.cost = cost;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public CashRegisterType getCashRegisterType() {
        return cashRegisterType;
    }

    public void setCashRegisterType(CashRegisterType cashRegisterType) {
        this.cashRegisterType = cashRegisterType;
    }
}
