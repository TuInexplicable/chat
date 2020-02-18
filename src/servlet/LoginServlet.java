package servlet;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Myoracle;
import dao.UpdateOperate;
import domain.OnlineBean;
import domain.UserBean;
import service.AddOnlineUser;
import service.Checkuser;
import service.Equipment;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		// TODO Auto-generated method stub
		
	
		response.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		session.removeAttribute("Lerroy");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String erroy =  "";
		//���ݿ��������
		try {
			ResultSet res = Checkuser.checkuser(account,password);
			
			if(res.next()) {
				OnlineBean onlineuser = new OnlineBean();
				onlineuser.setUsername(""+res.getObject("username"));
				onlineuser.setMininame(""+res.getObject("mininame"));
				onlineuser.setDate(""+res.getObject("dat"));
				onlineuser.setAccount(""+res.getObject("account"));
				onlineuser.setSex(""+res.getObject("sex"));
				onlineuser.setEmail(""+res.getObject("email"));
				
				try {
					AddOnlineUser.addOlineUser(onlineuser);//�����û��������ݿ⣬��ʾ��������Ϣ��Ҫ�������
					String userAgent = request.getHeader("user-agent");
					
					session.setAttribute("agent",Equipment.equipment(userAgent));
					//��sssionid�������ݿ⣬��������
					session.setAttribute("mininame",res.getObject(4));
					response.sendRedirect("/ChattingHouse/ChatWindow.jsp?account="+account);
				}catch(Exception e) {
					erroy = "error dwon";
					response.sendRedirect("/ChattingHouse/");
				}
				

			}else {
				erroy = "not redgist";
				response.sendRedirect("/ChattingHouse/");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			erroy = "class";
			response.sendRedirect("/ChattingHouse/");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			erroy = "sql";
			response.sendRedirect("/ChattingHouse/");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			erroy = "file";
			response.sendRedirect("/ChattingHouse/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			erroy = "io";
			response.sendRedirect("/ChattingHouse/");
		}finally {
			
			if(erroy!="")
				session.setAttribute("Lerroy",erroy);
			
		}
		
	} 

}
