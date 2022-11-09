/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.ShopDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartDetail;
import model.User;

/**
 *
 * @author Acers
 */
public class UserController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            String user = request.getParameter("command");
            if (user == null) {
                request.getRequestDispatcher("home-02.jsp?command=Login").forward(request, response);
            }

            switch (user) {
                case "Login":
                    login(request, response);
                    break;
                case "Register":
                    register(request, response);
                    break;
                case "Logout":
                    logout(request, response);
                    break;
                default:

            }

        } catch (Exception ex) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print("<h3>" + ex + "</h3>");

            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
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
        try {
            String user = request.getParameter("command");
            if (user == null) {
                request.getRequestDispatcher("home-02.jsp?command=Login").forward(request, response);
            }
            switch (user) {
                case "Login":
                    login(request, response);
                    break;
                case "Register":
                    register(request, response);
                    break;
                default:

            }

        } catch (Exception ex) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print("<h3>" + ex + "</h3>");

            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
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

    private void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            String user = request.getParameter("UserName");
            String pass = request.getParameter("Password");
            boolean isUserNameOk = user != null && user.trim().length() > 0;
            boolean isPassWordOk = pass != null && pass.trim().length() > 0;
            if (isUserNameOk && isPassWordOk) {
                UserDAO ud = new UserDAO();
                User u = new User(user, pass);
                if (ud.login(u)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("i", u);
                    if (user.equals("admin")) {
                        response.sendRedirect("ManageProductController");
                    } else {
                        response.sendRedirect("home-02.jsp");

                    }
                } else {
                    response.setContentType("text/html;charset=UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print("<h3>" + user + pass + "</h3>");
                    request.setAttribute("Message", "Wrong user or password");
                    request.getRequestDispatcher("login.jsp").forward(request, response);

                }
            } else {
                request.setAttribute("Message", "Please enter your user name and password");
                request.getRequestDispatcher("login.jsp").forward(request, response);

            }
        } catch (Exception ex) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print("<h3>" + ex + "</h3>");

            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            PrintWriter out = response.getWriter();
            String user = request.getParameter("UserName");
            String email = request.getParameter("Email");
            String password = request.getParameter("Password");
            String conpass = request.getParameter("ConPassword");

            if (password.equals(conpass)) {
                try {
                    UserDAO us = new UserDAO();
                    User u = new User(user, email, password);
                    us.register(u);

                    response.sendRedirect("login.jsp");
                } catch (IOException e) {
                    out.print(e);
                }
            } else {
                request.setAttribute("MESSAGE", "Password and Confirm must be the same");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print("<h3>" + ex + "</h3>");

            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("home-02.jsp");
        } catch (Exception ex) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print("<h3>" + ex + "</h3>");

            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
    }
}
