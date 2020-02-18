package service;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.Myoracle;
import dao.SelectOperate;
import dao.UpdateOperate;

public class SendMessage {
	static public ResultSet sendMessage() throws FileNotFoundException, ClassNotFoundException, SQLException {
		String sql = "select * from onlineusers";
		Connection conn = Myoracle.getConnect();
		Object[] obj = new Object[0];
		ResultSet res = SelectOperate.operate(sql, obj, conn);
		return res;
	}
}
