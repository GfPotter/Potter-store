/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CheckOut;
import model.Product;

import model.User;

/**
 *
 * @author QUAN
 */
public class ShopDAO extends DBContext implements Serializable {

    public List<Product> getProductsFromTo(int page, int pageSize) throws
            Exception {
        int from = page * pageSize - (pageSize - 1);
        int to = page * pageSize;
        List<Product> product = new ArrayList<>();
        String sql = "select * from (" + "select *, ROW_NUMBER() over (order by product_id) as rownumber from product" + ") as product " + "where product.rownumber >= ? and product.rownumber <=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, from);
            st.setInt(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                String img = rs.getString(2);
                String name = rs.getString(3);
                int price = rs.getInt(7);
                product.add(new Product(img, name, price));
            }
        } catch (Exception ex) {
            throw ex;
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

    public List<Product> getAllProduct() {
        ArrayList<Product> product = new ArrayList<>();
        String sql = "select * from product";
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

    public Product getProductID(int id) {

        String sql = "select * from product where product_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setImg(rs.getString(2));
                p.setName(rs.getString(3));
                p.setDes(rs.getString(4));
                p.setDetail(rs.getString(5));
                p.setMoreinf(rs.getString(6));
                p.setPrice(rs.getInt(7));
                p.setGender(rs.getString(8));
                p.setImg2(rs.getString(9));
                p.setImg3(rs.getString(10));
                return p;

            }
        } catch (Exception e) {
        }
        return null;
    }

    public Product getProductImg(String img) {

        String sql = "select * from product where img=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, img);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setImg(rs.getString(2));
                p.setName(rs.getString(3));
                p.setDes(rs.getString(4));
                p.setDetail(rs.getString(5));
                p.setMoreinf(rs.getString(6));
                p.setPrice(rs.getInt(7));
                p.setGender(rs.getString(8));
                p.setImg2(rs.getString(9));
                p.setImg3(rs.getString(10));
                return p;

            }
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteProduct(int id) throws SQLException {
        String sql = "delete from product where  product_id=?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, id);
        st.execute();

    }

    public void updateProduct(Product p) throws SQLException {
        String sql = "update product set img=?,name=?,des=?,detail=?,moreinf=?,price=?,gender=?,img2=?,img3=? where product_id=?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, p.getImg());
        st.setString(2, p.getName());
        st.setString(3, p.getDes());
        st.setString(4, p.getDetail());
        st.setString(5, p.getMoreinf());
        st.setInt(6, p.getPrice());
        st.setString(7, p.getGender());
        st.setString(8, p.getImg2());
        st.setString(9, p.getImg3());
        st.setInt(10, p.getId());
        st.execute();
    }
    public void addProduct(Product p) throws SQLException {
        String sql = "insert into product(img,name,des,detail,moreinf,price,gender,img2,img3) values (?,?,?,?,?,?,?,?,?)";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, p.getImg());
        st.setString(2, p.getName());
        st.setString(3, p.getDes());
        st.setString(4, p.getDetail());
        st.setString(5, p.getMoreinf());
        st.setInt(6, p.getPrice());
        st.setString(7, p.getGender());
        st.setString(8, p.getImg2());
        st.setString(9, p.getImg3());     
        st.execute();
    }
}
