/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vip2021
 */
public class Category {
    private int category_id;
    private String name;

    public Category(int category_id, String name) {
        this.category_id = category_id;
        this.name = name;
    }
 public Category(String name) {
        this.name = name;
    }
    
    public Category(int category_id) {
       this.category_id = category_id;
    }
    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
