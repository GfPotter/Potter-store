/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author QUAN
 */
public class DBContext {
     public Connection connection;

    public DBContext() {

        String dbURL = "jdbc:sqlserver://localhost;encrypt=true;trustServerCertificate=true;databaseName=Shopping;";
        String user = "sa";
        String pass = "1";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(dbURL, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);

        }

    }
}
