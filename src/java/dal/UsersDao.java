/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Users;

/**
 *
 * @author vip2021
 */
public class UsersDao extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Users> list;

    public List<Users> getAll() {
        list = new ArrayList<>();
        try {
            String strSelect = "select * from Users";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Users em = new Users(rs.getInt("user_id"), rs.getString("user_name"), rs.getString("user_email"), rs.getString("user_pass"),
                        rs.getInt("isSeller"), rs.getInt("isAdmin"), rs.getString("Address"), rs.getInt("phone"), rs.getString("avatar"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Users> getLogin() {
        list = new ArrayList<>();
        try {
            String strSelect = "select * from Users";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Users em = new Users(rs.getInt("user_id"), rs.getString("user_name"), rs.getString("user_email"), rs.getString("user_pass"),
                        rs.getInt("isSeller"), rs.getInt("isAdmin"), rs.getString("Address"), rs.getInt("phone"), rs.getString("avatar"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Users checkUser(String user_email, String user_pass) {
        try {
            String query = "select * from Users where user_email = ? and user_pass = ?";
            stm = connection.prepareStatement(query);
            stm.setString(1, user_email);
            stm.setString(2, user_pass);

            rs = stm.executeQuery();
            while (rs.next()) {
                Users em = new Users(rs.getInt("user_id"), rs.getString("user_name"), rs.getString("user_email"), rs.getString("user_pass"),
                        rs.getInt("isSeller"), rs.getInt("isAdmin"), rs.getString("Address"), rs.getInt("phone"), rs.getString("avatar"));
                return em;
            }
        } catch (Exception e) {
//            System.out.println(e);
        }
        return null;
    }

    public void updateUser(int user_id, String user_name, String email, String user_pass, String isSeller, String isAdmin) {
        String sql = "update Users set user_name = ? ,user_email = ?, user_pass = ?, isSeller= ?, isAdmin= ? where user_id = ?";
        try {

            stm = connection.prepareStatement(sql);
            stm.setString(1, user_name);
            stm.setString(2, user_pass);
            stm.setString(3, email);
            stm.setInt(4, Integer.parseInt(isSeller));
            stm.setInt(5, Integer.parseInt(isAdmin));
            stm.setInt(6, user_id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteAccount(String uid) {
        String query = "delete from Users\n" + "where user_id = ?";
        try {

            stm = connection.prepareStatement(query);
            stm.setString(1, uid);
            stm.executeUpdate();

        } catch (Exception e) {
        }
    }

    public Users checkAcc(String user_email) {
        try {
            String query = "select * from Users where user_email = ?";

            stm = connection.prepareStatement(query);
            stm.setString(1, user_email);
            rs = stm.executeQuery();
            while (rs.next()) {
                Users em = new Users(rs.getInt("user_id"), rs.getString("user_name"), rs.getString("user_email"), rs.getString("user_pass"),
                        rs.getInt("isSeller"), rs.getInt("isAdmin"), rs.getString("Address"), rs.getInt("phone"), rs.getString("avatar"));
                return em;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void signup(String user_name, String user_email, String user_pass) {
        try {
            String query = "insert into Users (user_name,user_email,user_pass,isSeller,isAdmin) values(?,?,?,?,?)";

            stm = connection.prepareStatement(query);

            stm.setString(1, user_name);
            stm.setString(2, user_email);
            stm.setString(3, user_pass);
            stm.setInt(4, 0);
            stm.setInt(5, 0);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        };
    }

    public void CreateAccount(String user_name, String user_email, String user_pass, int isSeller, int isAdmin) {
        try {
            String query = "insert into Users (user_name,user_email,user_pass,isSeller,isAdmin) values(?,?,?,?,?)";

            stm = connection.prepareStatement(query);

            stm.setString(1, user_name);
            stm.setString(2, user_email);
            stm.setString(3, user_pass);
            stm.setInt(4, isSeller);
            stm.setInt(5, isAdmin);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Users getUser(String user_id) {
//        List<Users> list = new ArrayList<>();
        String sql = "select * from Users Where user_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(user_id));
            rs = stm.executeQuery();
            while (rs.next()) {
                Users em = new Users(rs.getInt("user_id"), rs.getString("user_name"), rs.getString("user_email"), rs.getString("user_pass"),
                        rs.getInt("isSeller"), rs.getInt("isAdmin"), rs.getString("Address"), rs.getInt("phone"), rs.getString("avatar"));
                return em;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        UsersDao users = new UsersDao();
        Users em = users.getUser("1");
        System.out.println(em.getUser_name());
    }
}
