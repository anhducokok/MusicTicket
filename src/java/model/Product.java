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
public class Product {

    private String product_id;
    private int category_id;
    private String product_name;
    private String img;
    private int ticket_type;
    private String discription;
    private String detail_discription;
    private int price;
    private String ticket_name;
    private float ticket_price;
    private int quantity;
    private int amount;

    public Product(String product_id, String product_name, String img, int price) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.img = img;
        this.price = price;
    }

    public Product(String product_id, int category_id, String product_name, String img, int ticket_type, String discription, String detail_discription, int price, String ticket_name, float ticket_price, int quantity, int amount) {
        this.product_id = product_id;
        this.category_id = category_id;
        this.product_name = product_name;
        this.img = img;
        this.ticket_type = ticket_type;
        this.discription = discription;
        this.detail_discription = detail_discription;
        this.price = price;
        this.ticket_name = ticket_name;
        this.ticket_price = ticket_price;
        this.quantity = quantity;
        this.amount = amount;
    }
    

    public Product(String product_id, int category_id, String product_name, String img, int ticket_type, String discription) {
        this.product_id = product_id;
        this.category_id = category_id;
        this.product_name = product_name;
        this.img = img;
        this.ticket_type = ticket_type;
        this.discription = discription;
    }

    public Product(String product_id, int category_id, String product_name, String img, String discription, String detail_discription, int price,int ticket_type,int quantity,String ticket_name,float ticket_price) {
        this.product_id = product_id;
        this.category_id = category_id;
        this.product_name = product_name;
        this.img = img;
        this.discription = discription;
        this.detail_discription = detail_discription;
        this.price = price;
        this.ticket_type = ticket_type;
        this.quantity = quantity;
        this.ticket_name = ticket_name;
        this.ticket_price = ticket_price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
       
        this.amount+=amount;
    }

    public String getTicket_name() {
        return ticket_name;
    }

    public void setTicket_name(String ticket_name) {
        this.ticket_name = ticket_name;
    }

    public float getTicket_price() {
        return ticket_price;
    }

    public void setTicket_price(float ticke_price) {
        this.ticket_price = ticke_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDetail_discription() {
        return detail_discription;
    }

    public void setDetail_discription(String detail_discription) {
        this.detail_discription = detail_discription;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getTicket_type() {
        return ticket_type;
    }

    public void setTicket_type(int ticket_type) {
        this.ticket_type = ticket_type;
    }

}
