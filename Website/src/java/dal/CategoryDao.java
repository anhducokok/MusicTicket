/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;
import model.Ticket;

/**
 *
 * @author vip2021
 */
public class CategoryDao extends DBContext {

    public List<Category> getAll() {
        PreparedStatement stm;
        ResultSet rs;
        List<Category> list = new ArrayList<>();
        try {
            String strSelect = "select * from Category";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Category cate = new Category(rs.getInt("category_id"), rs.getString("name"));
                list.add(cate);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    } 
    public List<Ticket> getTicketAll() {
        PreparedStatement stm;
        ResultSet rs;
        List<Ticket> list = new ArrayList<>();
        try {
            String strSelect = "select * from Ticket";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Ticket cate = new Ticket(rs.getInt("ticket_type"), rs.getString("ticket_name"),rs.getFloat("ticket_price"));
                list.add(cate);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    

    public List<Product> getProductByID(String id) {
        PreparedStatement stm;
        ResultSet rs;
        List<Product> list = new ArrayList<>();
        try {
            String strSelect = "Select Product.product_id,Product.category_id,Product.product_name,Product.img,Product.ticket_type,Product.discription from Category \n" +
            "inner join Product on Product.category_id =  Category.category_id\n" +
            "where Product.category_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, Integer.parseInt(id));
            rs = stm.executeQuery();
            while (rs.next()) {
                Product em = new Product(rs.getString("product_id"),
                        rs.getInt("category_id"), rs.getString("product_name"),
                        rs.getString("img"), rs.getInt("ticket_type"),rs.getString("discription"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        CategoryDao dao = new CategoryDao();
        List<Ticket> li = dao.getTicketAll();
        for (Ticket l : li) {
            System.out.println(l.getTicket_name());
        }
    }
}
