/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.CheckOut;
import model.Product;
import model.User;

/**
 *
 * @author Acers
 */
public class CartDAO extends DBContext implements Serializable {

    public List<Product> getAllProduct() {
        ArrayList<Product> product = new ArrayList<>();
        String sql = "select * from product_detail";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String img = rs.getString(2);
                String name = rs.getString(3);
                String des = rs.getString(4);
                String detail = rs.getString(5);
                String moreinf = rs.getString(6);
                int price = rs.getInt(7);
                String gender = rs.getString(8);
                String img2 = rs.getString(9);
                String img3 = rs.getString(10);
                product.add(new Product(id, img, name, des, detail, moreinf, price, gender, img2, img3));

            }
        } catch (SQLException e) {
        }
        return product;
    }

    public int getTotalRows() throws Exception {
        int rows = 0;
        String sql = "select count(*) from product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                rows = rs.getInt(1);
            }
        } catch (Exception ex) {
            throw ex;
        }
        return rows;
    }

    public List<CheckOut> checkOut(List<CheckOut> co) throws SQLException {
        String sql = "insert into checkout(user_id,product_id,size,quantity,city,address,phone) values(?,?,?,?,?,?,?)";
        for (CheckOut checkOut : co) {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, checkOut.getUser_id());
            st.setInt(2, checkOut.getProduct_id());
            st.setString(3, checkOut.getSize());
            st.setInt(4, checkOut.getQuantity());
            st.setString(5, checkOut.getCity());
            st.setString(6, checkOut.getAddress());
            st.setString(7, checkOut.getPhone());
            st.executeUpdate();
        }

        return co;
    }
}
