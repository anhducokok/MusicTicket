/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.CategoryDao;
import dal.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Product;
import model.Ticket;
import model.Users;

/**
 *
 * @author vip2021
 */
public class AddProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (user.getIsSeller() == 0) {
                if (user.getIsAdmin() == 1) {
                    response.sendRedirect("Admin_page.jsp");
                } else {
                    response.sendRedirect("Ticket");
                }
            } else {
                CategoryDao da = new CategoryDao();
                List<Category> listC = da.getAll();
                List<Ticket> listT = da.getTicketAll();
                request.setAttribute("listCC", listC);
//        request.setAttribute("detail", p);
                request.setAttribute("listP", listT);
                
                request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
            }
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("id");
        String pname = request.getParameter("name");
        String pimage = request.getParameter("image");
        String pprice = request.getParameter("price");
        String ticket = request.getParameter("ticket_type");
        String pdescription = request.getParameter("description");
        String pcategory = request.getParameter("category");
//        HttpSession session = request.getSession();
//        Account a = (Account) session.getAttribute("acc");
//        int sid = a.getUid();

        ProductDao dao = new ProductDao();
        dao.insertProduct(pid, pname, pimage, pprice, ticket, pdescription, pcategory);
        response.sendRedirect("manage");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
