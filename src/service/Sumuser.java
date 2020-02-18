package service;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.Myoracle;
import dao.SelectOperate;

public class Sumuser {
	static public int Sum() throws FileNotFoundException, ClassNotFoundException, SQLException {
		String sql = "select count(*) from onlineusers";
		Connection conn = Myoracle.getConnect();
		Object[] obj = new Object[0];
		ResultSet res = SelectOperate.operate(sql, obj, conn);
		res.next();
		return res.getInt(1);
	}

}
