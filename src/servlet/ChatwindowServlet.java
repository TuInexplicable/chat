package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChatwindowServlet
 */
@WebServlet("/chatwindowServlet")
public class ChatwindowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatwindowServlet() {
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
		response.setContentType("text/html;charset=UTF8");
		HttpSession session = request.getSession();
		String account = request.getParameter("account");
		ServletContext context = this.getServletContext();
		String message = ""+context.getAttribute(account);//session.getId()
		
		if(!(message.equals("null"))) {
			String person = context.getAttribute(request.getParameter("mininame"))+"  "+context.getAttribute("time");
			response.getWriter().write(person+"\n"+"message:"+message );
			context.removeAttribute(account);
		}else {
			response.getWriter().write("null");
		};
		
		
	}

}
