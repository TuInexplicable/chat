package service;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.SQLException;

import dao.Myoracle;
import dao.UpdateOperate;
import domain.OnlineBean;

public class AddOnlineUser {
	static public void addOlineUser(OnlineBean user ) throws SQLException, FileNotFoundException, ClassNotFoundException {
		Connection conn = Myoracle.getConnect();
		Object[] obj = new Object[6];
		obj[0] = user.getAccount();
		obj[1] = user.getUsername();
		obj[2] = user.getMininame();
		obj[3] = user.getEmail();
		obj[4] = user.getSex();
		obj[5] = user.getDate();
		
		String sql = "insert into onlineusers values(?,?,?,?,?,?)";
		UpdateOperate.operateOracel(sql, obj, conn);
	}
}
