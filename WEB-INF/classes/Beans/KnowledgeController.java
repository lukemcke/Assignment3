package Beans;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.Serializable;
import java.util.*;
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = { "/Knowledge" })
public class KnowledgeController extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		DataAccess DA = new DataAccess();
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Knowledge/KnowledgeMenu.jsp");
		RequestDispatcher dispatchAdd = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Knowledge/addArticle.jsp");
		RequestDispatcher dispatchView = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Knowledge/viewArticles.jsp");
		try {
			
			if(request.getParameter("ID") != null){
				addArticle(DA, request, response);
				request.setAttribute("articles", DA.getAllArticles());
				dispatchView.forward(request, response);
			}
			//Home page
			else if(request.getParameter("addArticle") != null){
				request.setAttribute("issues", DA.listIssues());
				dispatchAdd.forward(request, response);
			}
			else if(request.getParameter("viewArticles") != null) {
				dispatchView.forward(request, response);
			}
			else {
				dispatch.forward(request, response);
			}
		}
		catch(Exception ex){
			
		}
		//End Home page
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
	public void addArticle(DataAccess DA, HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		try {
		Issue issue = DA.getIssue(Integer.parseInt(request.getParameter("ID")));
		
		DA.addArticle(issue);
		}
		catch(Exception ex){
		}
	}
	
}