package service;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.Myoracle;
import dao.SelectOperate;
import dao.UpdateOperate;

public class Checkuser {
	static public ResultSet checkuser(String account,String pword) throws FileNotFoundException, ClassNotFoundException, SQLException{
		Object[] obj = new Object[2];
		obj[0] = account;
		obj[1] = pword;
		String sql = "select * from users where account=? and password=?";
		Connection conn = Myoracle.getConnect();
		return SelectOperate.operate(sql, obj, conn);	
	}

}
