package service;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.SQLException;

import dao.Myoracle;
import dao.UpdateOperate;

public class DelOnlineuser {
	static public void delonlineuser(String account) throws FileNotFoundException, ClassNotFoundException, SQLException {
		Connection conn = Myoracle.getConnect();
		Object[] obj = new Object[1];
		obj[0] =account;
		String sql = "delete from onlineusers where account = ?";
		UpdateOperate.operateOracel(sql, obj, conn);
		
	}

}
