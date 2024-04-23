/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.cartController;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Cart;
import model.Item;
import model.Product;
import model.bdetail;

/**
 *
 * @author vip2021
 */
public class CartServlet extends HttpServlet {

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
    // Get product ID from request parameter
    String id = request.getParameter("pid");

    // Retrieve existing cookies and construct the updated cookie value
    Cookie[] arr = request.getCookies();
    String txt = "";
    if (arr != null) {
        for (Cookie o : arr) {
            if (o.getName().equals("id")) {
                txt += o.getValue(); // concatenate values directly
                o.setMaxAge(0); // remove cookie
                response.addCookie(o);
            }
        }
    }
    if (txt.isEmpty()) {
        txt = id;
    } else {
        txt = txt + "#" + id;
    }

    // Create a new cookie with the updated value and set its max age
    Cookie c = new Cookie("id", txt);
    c.setMaxAge(60 * 60 * 24); // 24 hours
    response.addCookie(c);

    // Retrieve products based on cookie values
    List<Product> list = new ArrayList<>();
    ProductDao dao = new ProductDao();
    String[] txtArr = txt.split("#"); // Corrected variable name
    Map<String, Integer> productCounts = new HashMap<>(); // Map to keep track of product counts
    for (String s : txtArr) {
        if (!s.isEmpty()) { // Ensure s is not empty
            // Update product counts
            productCounts.put(s, productCounts.getOrDefault(s, 0) + 1);
        }
    }
    // Retrieve products and update quantity
    for (Map.Entry<String, Integer> entry : productCounts.entrySet()) {
        String productId = entry.getKey();
        int count = entry.getValue();
        Product product = dao.getProductByID(productId);
        if (product != null) { // Ensure product exists
            product.setAmount(count);
            list.add(product);
        }
    }

    // Calculate total quantity and total price
    int amount = 0;
    double total = 0;
    for (Product product : list) {
        amount += product.getAmount(); // Calculate total amount
        total += product.getAmount() * product.getPrice(); // Calculate total price
    }

    // Set session attribute for total quantity
    HttpSession session = request.getSession();
    session.setAttribute("adata", amount);

    // Set request attributes
    request.setAttribute("list", list);
    request.setAttribute("amount", amount);
    request.setAttribute("total", total);
    request.setAttribute("sum", total); // Ensure "sum" attribute is used in cart.jsp

    // Forward the request to cart.jsp for rendering
    request.getRequestDispatcher("cart.jsp").forward(request, response);
}


// Method to retrieve products based on cookie values
    // Method to retrieve products based on cookie values and update quantity
//    private List<Product> getProductsFromCookies(String cookieValue) {
//        List<Product> list = new ArrayList<>();
//        ProductDao dao = new ProductDao();
//        String[] txtArr = cookieValue.split("#");
//        Map<String, Integer> productCounts = new HashMap<>(); // Map to keep track of product counts
//        for (String s : txtArr) {
//            if (!s.isEmpty()) { // Ensure s is not empty
//                // Update product counts
//                productCounts.put(s, productCounts.getOrDefault(s, 0) + 1);
//            }
//        }
//        // Retrieve products and update quantity
//        for (Map.Entry<String, Integer> entry : productCounts.entrySet()) {
//            String productId = entry.getKey();
//            int count = entry.getValue();
//            Product product = dao.getProductByID(productId);
//            if (product != null) { // Ensure product exists
//                product.setAmount(count);
//                list.add(product);
//            }
//        }
//        return list;
//    }

// Method to calculate total quantity
// Method to calculate total price
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
        processRequest(request, response);
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
