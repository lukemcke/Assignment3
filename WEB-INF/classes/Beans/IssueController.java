package Beans;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.Serializable;
import java.util.*;
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = { "/Issue" })
public class IssueController extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		try{
		DataAccess DA = new DataAccess();
		RequestDispatcher dispatchIssues = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Issues/viewIssues.jsp");
		
		HttpSession userSession = request.getSession();
		
		//requires user to login before reporting/viewing issues
		if(userSession.getAttribute("userLogin") == null){
				RequestDispatcher Login = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Login.jsp");
				Login.forward(request, response);
		}
		
		User user = (User) userSession.getAttribute("userLogin");
		
		//adds issue when report is clicked
		if(request.getParameter("report") != null){
			addIssue(DA, user, request, response);
			if(user.getIsadmin()){
				request.setAttribute("issues", DA.getAllIssues());
			}
			else {
				request.setAttribute("userissues", DA.getUserIssues(user.getUserid()));
			}
			dispatchIssues.forward(request, response);
		}
		//uses the keyword to return list of issues relating to the key word
		if(request.getParameter("keySearch") != null){
				request.setAttribute("issues", DA.searchIssues(user.getIsadmin(), user.getUserid(), request.getParameter("search")));
				request.setAttribute("userissues", DA.searchIssues(user.getIsadmin(), user.getUserid(), request.getParameter("search")));
				dispatchIssues.forward(request, response);
			}
		//sort articles decending via Status
		if(request.getParameter("sortStatus") != null){
			String Status = request.getParameter("status");
			request.setAttribute("issues", DA.sortByStatus(user.getIsadmin(), user.getUserid(), Status));
			request.setAttribute("userissues", DA.sortByStatus(user.getIsadmin(), user.getUserid(), Status));
			dispatchIssues.forward(request, response);
		}
		//sort articles decending via Category
		if(request.getParameter("sortCat") != null){
			String category = request.getParameter("category");
			request.setAttribute("issues", DA.sortByCategory(user.getIsadmin(), user.getUserid(), category));
			request.setAttribute("userissues", DA.sortByCategory(user.getIsadmin(), user.getUserid(), category));
			dispatchIssues.forward(request, response);
		}
		//sort articles decending via Date
		if(request.getParameter("sortDate") != null){
			String date = request.getParameter("date");
			request.setAttribute("issues", DA.sortByDate(user.getIsadmin(), user.getUserid(), date));
			request.setAttribute("userissues", DA.sortByDate(user.getIsadmin(), user.getUserid(), date));
			dispatchIssues.forward(request, response);
		}

		//when navbar link is clicked send to report issue page.
		request.setAttribute("categories", DA.getCategories());
		RequestDispatcher dispather = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Issues/addIssue.jsp");
		dispather.forward(request, response);
		}
		catch(Exception ex){
			System.err.println(ex.getMessage());
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
	//Adds issue to database with the userID as the user currently logged in 
	private void addIssue(DataAccess DA, User user, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			String Title = request.getParameter("issueTitle");
			String Description = request.getParameter("issueDescription");
			String Category = request.getParameter("category");
			String SubCategory = request.getParameter("inputSubCategory");
			
			Issue issue = new Issue();
			issue.setTitle(Title);
			issue.setDescription(Description);
			issue.setCategory(Category);
			issue.setSubcategory(SubCategory);
			issue.setUserid(user.getUserid());
			
			//adds issue with the argument as as the issue
			DA.reportIssue(issue, user.getUserid());
		}
		catch(Exception ex){
			System.err.println(ex.getMessage());
			}
		}
}