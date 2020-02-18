package servlet;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.UserBean;
import service.AddUsers;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String erroy = "";
		HttpSession session = request.getSession();
		session.removeAttribute("Rerroy");
		UserBean user = new UserBean();
		user.setAccount(request.getParameter("account"));
		user.setUsername(request.getParameter("username"));
		user.setMininame(request.getParameter("mininame"));
		user.setSex(request.getParameter("sex"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yy-MM-dd EE a HH:mm:ss");
		user.setDate(format.format(date));
		try {
			AddUsers.addUsers(user);
			response.sendRedirect("/ChattingHouse/login.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			erroy = "class";
			response.sendRedirect("/ChattingHouse/register.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			erroy = "sql";
			response.sendRedirect("/ChattingHouse/register.jsp");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			erroy = "file";
			response.sendRedirect("/ChattingHouse/register.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			erroy = "io";
			response.sendRedirect("/ChattingHouse/register.jsp");
		}finally {
			
			if(erroy!="")
				session.setAttribute("Rerroy",erroy);
			
		}
	}
}
