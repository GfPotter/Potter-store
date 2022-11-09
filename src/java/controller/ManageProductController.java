/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ShopDAO;
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
import model.Product;

/**
 *
 * @author Acers
 */
public class ManageProductController extends HttpServlet {

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
            out.println("<title>Servlet ManageProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageProductController at " + request.getContextPath() + "</h1>");
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
                case "Delete":
                    deleteProduct(request, response);
                    break;
                case "Update":
                    updateProduct(request, response);
                    break;
                case "Add":
                    addProduct(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            ShopDAO sd = new ShopDAO();
            List<Product> product = sd.getAllProduct();

            request.setAttribute("product", product);
            request.getRequestDispatcher("admin-page.jsp").forward(request, response);
        } catch (Exception ex) {

            out.println("<h3>" + ex + "</h3>");

            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            ShopDAO sd = new ShopDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            sd.deleteProduct(id);
            listProduct(request, response);
        } catch (Exception ex) {

            out.println("<h3>" + ex + "</h3>");

            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            ShopDAO sd = new ShopDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            String img1 = request.getParameter("Img1");
            String img2 = request.getParameter("Img2");
            String img3 = request.getParameter("Img3");
            String name = request.getParameter("Name");
            String des = request.getParameter("Describe");
            String detail = request.getParameter("Detail");
            int price = Integer.parseInt(request.getParameter("Price"));
            String moreinf = request.getParameter("MoreInf");
            String gender = request.getParameter("Gender");
            Product p = new Product(id, img1, name, des, detail, moreinf, price, gender, img2, img3);
            sd.updateProduct(p);
            listProduct(request, response);
        } catch (Exception ex) {

            out.println("<h3>" + ex + "</h3>");

            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
    }
    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            ShopDAO sd = new ShopDAO();
          
            String img1 = request.getParameter("Img1");
            String img2 = request.getParameter("Img2");
            String img3 = request.getParameter("Img3");
            String name = request.getParameter("Name");
            String des = request.getParameter("Describe");
            String detail = request.getParameter("Detail");
            int price = Integer.parseInt(request.getParameter("Price"));
            String moreinf = request.getParameter("MoreInf");
            String gender = request.getParameter("Gender");
            Product p = new Product(img1, name, des, detail, moreinf, price, gender, img2, img3);
            sd.addProduct(p);
            listProduct(request, response);
        } catch (Exception ex) {

            out.println("<h3>" + ex + "</h3>");

            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null,
                    ex);
        }
    }
}
