package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectOperate {
	static PreparedStatement prep = null;
	public static ResultSet operate(String sql,Object[] obj,Connection conn) throws SQLException{
		prep = conn.prepareStatement(sql);
			for(int i = 0;i<obj.length;i++)
				prep.setObject(i+1, obj[i]); 
			
			return prep.executeQuery();
	}
}
