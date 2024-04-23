/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vip2021
 */
public class Ticket {
    private int ticket_type;
    private String ticket_name;
    private float ticket_price;

    public Ticket(int ticket_type, String ticket_name, float ticket_price) {
        this.ticket_type = ticket_type;
        this.ticket_name = ticket_name;
        this.ticket_price = ticket_price;
    }

    public int getTicket_type() {
        return ticket_type;
    }

    public void setTicket_type(int ticket_type) {
        this.ticket_type = ticket_type;
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

    public void setTicket_price(float ticket_price) {
        this.ticket_price = ticket_price;
    }
    
}
