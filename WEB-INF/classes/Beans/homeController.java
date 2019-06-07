package Beans;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.Serializable;
import java.util.*;
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = { "/Index", "" })
public class homeController extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		RequestDispatcher dispather = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Index.jsp");
		DataAccess DA = new DataAccess();
		
		HttpSession userSession = request.getSession();
		User user = (User) userSession.getAttribute("userLogin");
		
		//when user accpets/declines notifications change status to Resolved/not accepted
		//add resolve details to the accepted issue
		try {
			if(request.getParameter("notify") != null && request.getParameter("resolvedetails") != ""){
				DA.changeStatus(request.getParameter("status"), Integer.parseInt(request.getParameter("ID")));
				DA.addResolveDetails(Integer.parseInt(request.getParameter("ID")), request.getParameter("resolvedetails"));
			}
			request.setAttribute("notifications", DA.getNotifications(user.getUserid(), user.getIsadmin()));
		}
		catch(Exception ex){
			System.err.println(ex.getMessage());
			System.err.println(ex.getStackTrace());
		}
		dispather.forward(request, response);
		
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
	
}