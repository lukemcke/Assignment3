package Beans;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.Serializable;
import java.util.*;
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = { "/assignment3" })
public class Servlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		RequestDispatcher dispather = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Index.jsp");
		DataAccess DA = new DataAccess();
		
		HttpSession userSession = request.getSession();
		dispather.forward(request, response);
		User user = (User) userSession.getAttribute("userLogin");
		if(userSession.getAttribute("userLogin") != null){
			if(user.getIsadmin()){
				request.setAttribute("masterPage","Admin");
			}
			else {
				request.setAttribute("masterPage","User");
			}
		}
		else{
			request.setAttribute("masterPage","User");
		}
		
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
	
}