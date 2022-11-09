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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.CartDetail;
import model.Product;
import model.User;

/**
 *
 * @author Acers
 */
public class ProductController extends HttpServlet {

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
            out.println("<title>Servlet ProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductController at " + request.getContextPath() + "</h1>");
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
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                listProduct(request, response);
            }
            switch (theCommand) {
                case "Detail":
                    detailProduct(request, response);
                    break;
                case "Add":
                    addProduct(request, response);
                    break;
                case "ListCart":

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

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            ShopDAO sd = new ShopDAO();

            int page = 1, pageSize = 8;
            int totalPage = sd.getTotalRows(); // get number of content in 
            if (request.getParameter("page") != null) { // check param page
                page = Integer.parseInt(request.getParameter("page"));
            }

            if (totalPage % pageSize == 0) {
                totalPage = totalPage / pageSize;
            } else {
                totalPage = totalPage / pageSize + 1;
            }

            if (page > totalPage) {
                request.setAttribute("noContent", "No article here!");
            } else {
                request.setAttribute("content", sd.getProductsFromTo(page, pageSize));

            }
            response.setContentType("text/html;charset=UTF-8");

            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } catch (Exception ex) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print("<h3>" + ex + "</h3>");

            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
    }

    private void detailProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            ShopDAO sd = new ShopDAO();
            String img = request.getParameter("img");
            Product p = sd.getProductImg(img);
            request.setAttribute("detail", p);
            request.getRequestDispatcher("product-detail.jsp").forward(request, response);
        } catch (Exception ex) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print("<h3>" + ex + "</h3>");

            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String img = request.getParameter("img");
            String size = request.getParameter("size");
            int num = Integer.parseInt(request.getParameter("num"));
            String user_id = request.getParameter("id");

            if (user_id.equals("") || user_id.equals(null)) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                ShopDAO s = new ShopDAO();
                List<Product> list = s.getAllProduct();
                Cookie[] arr = request.getCookies();
                String txt = "";
                if (arr != null) {
                    for (Cookie cookie : arr) {
                        if (cookie.getName().equals(user_id)) {
                            txt += cookie.getValue();
                            out.print(cookie.getValue());
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                        }
                    }
                }
                if (txt.isEmpty()) {
                    txt = img + ":" + size + ":" + num;

                } else {

                    ShopDAO shop = new ShopDAO();
                    List<CartDetail> cd = new ArrayList<>();
                    String[] s1 = txt.split("'");
                    for (String i : s1) {
                        String[] n = i.split(":");
                        String img1 = n[0];
                        String size1 = n[1];
                        int quantity = Integer.parseInt(n[2]);
                        if (img1.equals(img) && size1.equals(size)) {
                            int sum = quantity + num;

                            txt = txt.replace(img1 + ":" + size1 + ":" + quantity, img + ":" + size + ":" + sum);

                        } else {
                            txt = txt + "'" + img + ":" + size + ":" + num;
                        }

                    }

                }
                Cookie c = new Cookie(user_id, txt);
                c.setMaxAge(60 * 60 * 24 * 365);
                response.addCookie(c);
                detailProduct(request, response);

            }
        } catch (Exception ex) {
            out.print("<h3>" + ex + "</h3>");
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
    }

}
