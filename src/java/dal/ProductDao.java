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
import model.Bill;
import model.Product;

/**
 *
 * @author vip2021
 */
public class ProductDao extends DBContext {

    public List<Product> getAll() {
        PreparedStatement stm;
        ResultSet rs;
        List<Product> list = new ArrayList<>();
        try {
            String strSelect = "select * from Product";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product em = new Product(rs.getString("product_id"),
                        rs.getInt("category_id"), rs.getString("product_name"),
                        rs.getString("img"), rs.getInt("ticket_type"), rs.getString("discription"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getRandom() {
        PreparedStatement stm;
        ResultSet rs;
        List<Product> list = new ArrayList<>();
        try {
            String strSelect = "select Top 3 *  from Product Order By Newid()";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product em = new Product(rs.getString("product_id"),
                        rs.getInt("category_id"), rs.getString("product_name"),
                        rs.getString("img"), rs.getInt("ticket_type"), rs.getString("discription"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getLastest() {
        PreparedStatement stm;
        ResultSet rs;
        List<Product> list = new ArrayList<>();
        try {
            String strSelect = "select top 1 * from Product " + "order by product_id desc";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product em = new Product(rs.getString("product_id"),
                        rs.getInt("category_id"), rs.getString("product_name"),
                        rs.getString("img"), rs.getInt("ticket_type"), rs.getString("discription"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductAll() {
        PreparedStatement stm;
        ResultSet rs;
        List<Product> li = new ArrayList<>();
        try {
            String strSelect = "SELECT     p.product_id, p.product_name,p.img, ptd.price\n"
                    + "FROM  Product p\n"
                    + "LEFT JOIN Product_ticketDetail ptd ON p.product_id = ptd.product_id\n"
                    + "GROUP BY   p.product_id,p.product_name,p.img,ptd.price";
            stm = connection.prepareStatement(strSelect);

            rs = stm.executeQuery();
            while (rs.next()) {
                Product em = new Product(rs.getString("product_id"), rs.getString("product_name"),
                        rs.getString("img"), rs.getInt("price"));
                li.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return li;
    }

    public Product getProductByID(String id) {
        PreparedStatement stm;
        ResultSet rs;

        try {
            String strSelect = "Select p.product_id,p.category_id,p.product_name,\n"
                    + " p.img,p.discription,pd.detail_discription,ptd.price,ptd.ticket_type,ptd.quantity,t.ticket_name,t.ticket_price*ptd.price  as ticket_price\n"
                    + " from Product p\n"
                    + " inner join Product_detail pd on p.product_id = pd.product_id\n"
                    + " inner join Product_ticketDetail ptd on p.product_id = ptd.product_id\n"
                    + "	inner join Ticket t on t.ticket_type = ptd.ticket_type\n"
                    + "  where p.product_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product em = new Product(rs.getString("product_id"),
                        rs.getInt("category_id"), rs.getString("product_name"),
                        rs.getString("img"), rs.getString("discription"), rs.getString("detail_discription"), rs.getInt("price"), rs.getInt("ticket_type"), rs.getInt("quantity"), rs.getString("ticket_name"), rs.getFloat("ticket_price"));
                return em;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertProduct(String pid,String name, String image, String price,String ticket,String description, String cate) {
        PreparedStatement stm;
        ResultSet rs;
        String query = "INSERT [dbo].[Product]\n"
                + "(product_id,[category_id],product_name, [img], [discription]) \n"
                + "VALUES(?,?,?,?,?)";
        String secondQuery = "insert Product_ticketDetail\n"+"(product_id,price,ticket_type)\n"+"Values(?,?,?)";
        try {

            stm = connection.prepareStatement(query);
            stm.setString(1, pid);
            stm.setString(2, cate);
            stm.setString(3, name);
            stm.setString(4, image);
            stm.setString(5, description);
            

            stm.executeUpdate();
            
            stm = connection.prepareStatement(query);
            stm.setString(1, pid);
            stm.setInt(2, Integer.parseInt(price));
            
            stm.setInt(3, Integer.parseInt(ticket));

            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> getProduct(String id) {
        PreparedStatement stm;
        ResultSet rs;
        List<Product> list = new ArrayList<>();
        try {
            String strSelect = "Select p.product_id,p.category_id,p.product_name,\n"
                    + " p.img,p.discription,pd.detail_discription,ptd.price,ptd.ticket_type,ptd.quantity,t.ticket_name,t.ticket_price*ptd.price  as ticket_price\n"
                    + " from Product p\n"
                    + " inner join Product_detail pd on p.product_id = pd.product_id\n"
                    + " inner join Product_ticketDetail ptd on p.product_id = ptd.product_id\n"
                    + "	inner join Ticket t on t.ticket_type = ptd.ticket_type\n"
                    + "  where p.product_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product em = new Product(rs.getString("product_id"),
                        rs.getInt("category_id"), rs.getString("product_name"),
                        rs.getString("img"), rs.getString("discription"), rs.getString("detail_discription"), rs.getInt("price"), rs.getInt("ticket_type"), rs.getInt("quantity"), rs.getString("ticket_name"), rs.getFloat("ticket_price"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        PreparedStatement stm;
        ResultSet rs;
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\n "
                + "where [product_name] like ?";
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, "%" + txtSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                Product em = new Product(rs.getString("product_id"),
                        rs.getInt("category_id"), rs.getString("product_name"),
                        rs.getString("img"), rs.getInt("ticket_type"), rs.getString("discription"));
                list.add(em);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void editProduct(String name, String image, String price, String ticket_type, String detail_discription, String description, String category,
            String pid) {
        PreparedStatement stm;

        String query = "update Product\n"
                + "set product_name = ?,\n"
                + "img = ?,\n"
                + "discription = ?,\n"
                + " category_id = ?\n"
                + "where product_id = ?";
        String secondQuery = "update Product_detail\n" + "set detail_discription = ?\n"
                + "where product_id = ?";
        String thirdQuery = "update Product_ticketDetail\n" + "set ticket_type = ?, price =?\n"
                + "where product_id = ?";
        try {

            stm = connection.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, image);
            stm.setString(3, description);
            stm.setInt(4, Integer.parseInt(category));
            stm.setString(5, pid);
            stm.executeUpdate();

            stm = connection.prepareStatement(secondQuery);
            stm.setString(1, detail_discription);
            stm.setString(2, pid);
            stm.executeUpdate();
            stm = connection.prepareStatement(thirdQuery);
            stm.setInt(1, Integer.parseInt(ticket_type));
            stm.setInt(2, Integer.parseInt(price));
            stm.setString(3, pid);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Bill> searchProductByID(int id) {
        PreparedStatement stm;
        ResultSet rs;
        List<Bill> list = new ArrayList<>();
        String query = "Select * from Bill \n"
                + "where user_id= ?";
        try {
            stm = connection.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Bill em = new Bill(rs.getInt("bill_id"), rs.getInt("user_id"),rs.getFloat("price_total"));
                list.add(em);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public void saveOrder(String uid, double price_total){
        PreparedStatement stm;
        ResultSet rs;
        String query = "INSERT [dbo].[Bill]\n"
                + "(user_id, [price_total]) \n"
                + "VALUES(?,?)";
        try {

            stm = connection.prepareStatement(query);
            stm.setString(1,uid);
            stm.setDouble(2, price_total);
            stm.executeUpdate();
            } catch (Exception e) {
        }
        
    }
    public void deleteProduct(String pid) {
        PreparedStatement stm;
        ResultSet rs;
        List<Bill> list = new ArrayList<>();
        String query = "delete from Product\n" + "where product_id = ?";
        try {

            stm = connection.prepareStatement(query);
            stm.setString(1, pid);
            stm.executeUpdate();

        } catch (Exception e) {
        }
    }

//    public Product getProductDetail(String id){
//        
//    }
    public static String id = "N";

    public static void main(String[] args) {
        ProductDao pr = new ProductDao();
        pr.editProduct("Rooftop Con", "img/indieshow.jpg", "1000000", "4", "hello", "Hello", "1", "CON003");
        Product p = pr.getProductByID("CON003");
        System.out.println(p.getDiscription());

    }
}
