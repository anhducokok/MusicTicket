/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vip2021
 */
public class bdetail {
    private int bdetail_id;
    private float unitPrice;
    private int quantity;
    private int bill_id;
    private String product_id;

    public bdetail(int bdetail_id, int quantity, int bill_id, String product_id) {
        this.bdetail_id = bdetail_id;
        this.quantity = quantity;
        this.bill_id = bill_id;
        this.product_id = product_id;
    }

    public bdetail() {
    }

    public bdetail(int bdetail_id, float unitPrice,int quantity, int bill_id, String product_id) {
        this.bdetail_id = bdetail_id;
        this.unitPrice = unitPrice;
        this.bill_id = bill_id;
        this.product_id = product_id;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public int getBdetail_id() {
        return bdetail_id;
    }

    public void setBdetail_id(int bdetail_id) {
        this.bdetail_id = bdetail_id;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }
    
}
