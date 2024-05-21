/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author vip2021
 */
public class Bill {
    private int bill_id;
    private int user_id;
    private Date buyDate;
    private float price_total;

    public Bill() {
    }

    public Bill(int bill_id, int user_id, float price_total) {
        this.bill_id = bill_id;
        this.user_id = user_id;
        this.price_total = price_total;
    }

    public Bill(int bill_id, int user_id, Date buyDate, float price_total) {
        this.bill_id = bill_id;
        this.user_id = user_id;
        this.buyDate = buyDate;
        this.price_total = price_total;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getBuyDate() {
        return buyDate;
    }

    public void setBuyDate(Date buyDate) {
        this.buyDate = buyDate;
    }

    public float getPrice_total() {
        return price_total;
    }

    public void setPrice_total(float price_total) {
        this.price_total = price_total;
    }
    
}