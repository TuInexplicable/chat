package service;

import java.io.FileNotFoundException;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dao.Myoracle;
import dao.SelectOperate;
import dao.UpdateOperate;
import domain.OnlineBean;
import domain.UserBean;

public class Users {
	static public ArrayList<UserBean> findUsers(String sql,ArrayList<UserBean> userlist,Object[] obj) throws SQLException, FileNotFoundException, ClassNotFoundException {
		Connection conn = Myoracle.getConnect();
		
		UserBean user = null;
		ResultSet res = SelectOperate.operate(sql, obj, conn);
		while(res.next()) {
			user = new UserBean();
			user.setAccount((String) res.getObject("account"));
			user.setUsername((String) res.getObject("username"));
			user.setMininame((String) res.getObject("mininame"));
			user.setEmail((String) res.getObject("email"));
			user.setSex((String) res.getObject("sex"));
			user.setDate((String) res.getObject("dat"));
			userlist.add(user);
		}
		return userlist;
	}
	static public ArrayList<OnlineBean> findOnlineUsers(String sql,ArrayList<OnlineBean> onlinelist,Object[] obj) throws SQLException, FileNotFoundException, ClassNotFoundException {
		Connection conn = Myoracle.getConnect();
		
		OnlineBean onlineuser = null;
		ResultSet res = SelectOperate.operate(sql, obj, conn);
		while(res.next()) {
			onlineuser = new OnlineBean();
			onlineuser.setAccount((String) res.getObject("account"));
			onlineuser.setUsername((String) res.getObject("username"));
			onlineuser.setMininame((String) res.getObject("mininame"));
			onlineuser.setEmail((String) res.getObject("email"));
			onlineuser.setSex((String) res.getObject("sex"));
			onlineuser.setDate((String) res.getObject("dat"));
			
			onlinelist.add(onlineuser);
		}
		return onlinelist;
	}
}
