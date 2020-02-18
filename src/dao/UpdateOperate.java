package dao;
import java.sql.*;
public class UpdateOperate {
	static PreparedStatement prep = null;
	public static void operateOracel(String sql,Object[] obj,Connection conn) throws SQLException{
		prep = conn.prepareStatement(sql);
		for(int i = 0;i<obj.length;i++)
			prep.setObject(i+1, obj[i]); 
		prep.executeUpdate();
	}
}
