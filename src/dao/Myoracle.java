package dao;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.Scanner;
	
public class Myoracle { 
	public static Connection getConnect() throws FileNotFoundException, ClassNotFoundException, SQLException {
		ResourceBundle res = ResourceBundle.getBundle("Oracle_link");
	
		String driver = res.getString("driver");
		String url = res.getString("url");
		String user =res.getString("user");
		String password = res.getString("password");
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,user,password);
		return conn;
	}
}
