package Beans;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.Serializable;
import java.util.*;
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = { "/Login" })
public class LoginController extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		DataAccess DA = new DataAccess();
		HttpSession session = request.getSession();
		RequestDispatcher dispatchIndex = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Index.jsp");
		RequestDispatcher dispatchLogin = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Login.jsp");
	
		try {
			
		if(request.getParameter("login") != null) {
			
				if(DA.verifyLogin(request.getParameter("email"), request.getParameter("password")) == 1)
				{
					session.setAttribute("userLogin", DA.getUser(request.getParameter("email"), request.getParameter("password")));
					dispatchIndex.forward(request, response);
				}
					
		}
		}
		catch (Exception ex){
			
		}
		dispatchLogin.forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
	
}