package service;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.SQLException;

import dao.Myoracle;
import dao.UpdateOperate;
import domain.UserBean;

public class AddUsers {
	static public void addUsers(UserBean user) throws SQLException, FileNotFoundException, ClassNotFoundException {
		
		Connection conn = Myoracle.getConnect();
		Object[] obj = new Object[7];
		obj[0] = user.getAccount();
		obj[1] = user.getUsername();
		obj[2] = user.getPassword();
		obj[3] = user.getMininame();
		obj[4] = user.getEmail();
		obj[5] = user.getSex();
		obj[6] = user.getDate();
		String sql = "insert into users values(?,?,?,?,?,?,?)";
		UpdateOperate.operateOracel(sql, obj, conn);
	}

}
