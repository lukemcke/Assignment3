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
		HttpSession userSession = request.getSession();
		User user = (User) userSession.getAttribute("userLogin");
		
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
				request.setAttribute("articles", DA.getAllArticles());
				dispatchView.forward(request, response);
			}
			else if(request.getParameter("keySearch") != null){
				request.setAttribute("articles", DA.searchArticles(request.getParameter("search")));
				dispatchView.forward(request, response);	
			}
			else if(request.getParameter("sortCat") != null) {
				request.setAttribute("articles", DA.sortArticles(request.getParameter("category")));
				dispatchView.forward(request, response);
			}
			else if(request.getParameter("addComment") != null && request.getParameter("commTitle") != "" && request.getParameter("commField") != ""){
				System.out.println(request.getParameter("articleID"));
				System.out.println(request.getParameter("commTitle") + request.getParameter("commField"));
				addComment(DA, Integer.parseInt(request.getParameter("articleID")), request.getParameter("commTitle"), request.getParameter("commField"), request, response);
				request.setAttribute("articles", DA.getAllArticles());
				dispatchView.forward(request, response);
			}
			else {
				dispatch.forward(request, response);
			}
		}
		catch(Exception ex){
			System.err.println(ex.getMessage());
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
	public void addComment(DataAccess DA, int ArticleID, String Title, String Field, HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		try {
		
		ArticleComment Comment = new ArticleComment();
		
		Comment.setTitle(Title);
		Comment.setField(Field);
		Comment.setArticleid(ArticleID);
		
		DA.addArticleComment(Comment);
		}
		catch(Exception ex){
			System.err.println(ex.getMessage());
		} 
	}
}