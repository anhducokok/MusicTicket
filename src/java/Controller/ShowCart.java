/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author vip2021
 */
public class ShowCart extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       response.setContentType("text/html;charset=UTF-8");
        Cookie arr[] = request.getCookies();
        PrintWriter out = response.getWriter();
        List<Product> list = new ArrayList<>();
        ProductDao dao = new ProductDao();
        for (Cookie o : arr) {
            if (o.getName().equals("id")) {
                String txt[] = o.getValue().split("#");
                for (String s : txt) {
                    list.add( dao.getProductByID(s));
                }
            }
        }
        for (int i = 0; i < list.size(); i++) {
            int count = 1;
            for (int j = i+1; j < list.size(); j++) {
                if(list.get(i).getProduct_id() == list.get(j).getProduct_id()){
                    count++;
                    list.remove(j);
                    j--;
                    list.get(i).setQuantity(count);
                }
            }
        }
        double total = 0;
        int amout = 0;
        for (Product o : list) {
            total = total + o.getQuantity()* o.getPrice();
            amout = amout + o.getQuantity();
        }
        HttpSession session = request.getSession();
        session.setAttribute("a", amout);
       
        request.setAttribute("list", list);
        request.setAttribute("amout", amout);
        request.setAttribute("total", total);
      
        request.setAttribute("vat", 0.1 * total);
        request.setAttribute("sum", total);
       
       
       
        
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
