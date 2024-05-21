/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

//import dal.billDAO;
//import Entity.BillDetail;
import dal.ProductDao;
import dal.UsersDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;
import model.Bill;
import model.Users;

/**
 *
 * @author Khuong Hung
 */
public class UsersServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
//        String currentURL = request.getRequestURI();

        String action = request.getParameter("action");
        if (action.equals("login")) {   
             HttpSession session = request.getSession();
                Users user = (Users) session.getAttribute("user");
                if(user==null){
            request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                else{
                    response.sendRedirect("Ticket");
                }
        }
        if (action.equals("checkLogin")) {
            String user_email = request.getParameter("user_email");
            String user_pass = request.getParameter("user_pass");
//            String remember = request.getParameter("remember");
            UsersDao dao = new UsersDao();
            Users user = dao.checkUser(user_email, user_pass);
            if (user == null) {
                request.setAttribute("error", "Tài khoản không tồn tại !");
                request.getRequestDispatcher("users?action=login").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                Cookie email = new Cookie("email", user_email);
                Cookie pass = new Cookie("pass", user_pass);
//                Cookie rem = new Cookie("remember", remember);
//                if (remember != null) {
//                    email.setMaxAge(60 * 60 * 24 * 30);
//                    pass.setMaxAge(60 * 60 * 24 * 3);
//                    rem.setMaxAge(60 * 60 * 24 * 30);
//                } else {
//                    email.setMaxAge(0);
//                    pass.setMaxAge(0);
//                    rem.setMaxAge(0);
//                }
                response.addCookie(email);
                response.addCookie(pass);
//                response.addCookie(rem);
                response.sendRedirect("Ticket");
            }
        }

        if (action.equals("logout")) {
            HttpSession session = request.getSession();
            session.removeAttribute("user");
            response.sendRedirect("Home");
        }

        if (action.equals("profile")) {
            try {
                HttpSession session = request.getSession();
                Users user = (Users) session.getAttribute("user");
                ProductDao dao = new ProductDao();
                List<Bill> li = dao.searchProductByID(user.getUser_id());
                if (user != null) {
                    request.setAttribute("user", user);
                    request.setAttribute("bill", li);
                    request.getRequestDispatcher("my_account.jsp").forward(request, response);
                } else {
                    response.sendRedirect("users?action=login");
               }
            } 
            catch (Exception e) {
                    response.sendRedirect("users?action=login");
               
            }
        }
       

//        if (action.equals("updateinfo")) {
//            try {
//                HttpSession session = request.getSession();
//                Users user = (Users) session.getAttribute("user");
//                if (user != null) {
//                    String user_name = request.getParameter("user_name");
//                    String user_pass = request.getParameter("user_pass");
//                    int user_id = user.getUser_id();
//                    UsersDao dao = new UsersDao();
//                    dao.updateUser(user_id, user_name, user_pass);
//                    Users user1 = new Users(user_id,u)
//                    session.setAttribute("user", user1);
//                    response.sendRedirect("user?action=myaccount");
//                } else {
//                    response.sendRedirect("user?action=login");
//                }
//            } catch (Exception e) {
//                response.sendRedirect("user?action=login");
//            }
//        }
        if(action.equals("register")){
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        if (action.equals("signup")) {
             String user_name = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String user_pass = request.getParameter("user_pass");
            String re_pass = request.getParameter("re_pass");
            if (!user_pass.equals(re_pass)) {
                request.setAttribute("error_pass", "Mật khẩu không trùng khớp. Hãy nhập lại...");
                request.getRequestDispatcher("users?action=register").forward(request, response);
            } else {
                UsersDao dao = new UsersDao();
                Users a = dao.checkAcc(user_email);
                if (a == null) {
                    dao.signup(user_name,user_email, user_pass);
                    request.setAttribute("done", "Đăng ký thành công");
                    request.getRequestDispatcher("users?action=login").forward(request, response);
                } else {
                    request.setAttribute("emailavailable", "Email đã tồn tại!");
                    request.getRequestDispatcher("users?action=register").forward(request, response);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**l
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
//            Users user = (Users) request.getSession().getAttribute("user");
            processRequest(request,response);
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
