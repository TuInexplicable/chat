package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.SendMessage;

/**
 * Servlet implementation class ChatServlet
 */
@WebServlet("/chatServlet")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatServlet() {
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
		//��ѯ���ݿ�sessionid,���Դ�Ϊkey,��messageΪ���ݴ���context��
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF8");
		String message = request.getParameter("message");
		String mininame = request.getParameter("mininame");
		//this.getServletContext().setAttribute("id",message);
		ServletContext context = this.getServletContext();
		DateFormat format = new SimpleDateFormat("yy-MM-dd EE a HH:mm:ss");
		if(message!="") {
			
			try {
				ResultSet res = SendMessage.sendMessage();
				while(res.next()) {
					context.setAttribute(""+res.getObject(1),message);
					context.setAttribute(""+res.getObject(3),mininame);
					context.setAttribute("time",format.format(new Date()));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				response.getWriter().write("sql");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				response.getWriter().write("class");
			}
		}
		
	}

}
