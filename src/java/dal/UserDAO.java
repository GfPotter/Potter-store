/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author Acers
 */
public class UserDAO extends DBContext implements Serializable {
    
    public User register(User u) {
        String sql = "insert into member(userName,email,password) values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
            st.setString(1, u.getUserName());
            st.setString(2, u.getEmail());
            st.setString(3, u.getPassword());
            st.executeUpdate();
        } catch (SQLException e) {
        }
        return u;
    }
    
    public boolean login(User u) {
        
        String sql = "select * from member";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (u.getUserName().equals(rs.getString("userName")) && u.getPassword().equals(rs.getString("password"))) {
                    return true;
                }
                
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public User getUserName(String userName) {
        
        String sql = "select * from member where userName=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt(1));
                u.setUserName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
                return u;
                
            }
        } catch (Exception e) {
        }
        return null;
    }
}
