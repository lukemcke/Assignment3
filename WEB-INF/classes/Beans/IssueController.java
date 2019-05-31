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
		User user = (User) userSession.getAttribute("userLogin");
		
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
		
		if(request.getParameter("keySearch") != null){
				request.setAttribute("issues", DA.searchIssues(request.getParameter("search")));
				dispatchIssues.forward(request, response);
			}
		if(request.getParameter("Status") != null){
			DA.changeStatus(request.getParameter("changeStatus"),  Integer.parseInt(request.getParameter("issueID")));
			request.setAttribute("issues", DA.getAllIssues());
			dispatchIssues.forward(request, response);
		}
		
		if(request.getParameter("sortCat") != null){
			String category = request.getParameter("category");
			request.setAttribute("issues", DA.sortByCategory(user.getIsadmin(), user.getUserid(), category));
			request.setAttribute("userissues", DA.sortByCategory(user.getIsadmin(), user.getUserid(), category));
			dispatchIssues.forward(request, response);
		}
		if(request.getParameter("sortDate") != null){
			String date = request.getParameter("date");
			request.setAttribute("issues", DA.sortByCategory(user.getIsadmin(), user.getUserid(), date));
			request.setAttribute("userissues", DA.sortByCategory(user.getIsadmin(), user.getUserid(), date));
		}
			
		if(request.getParameter("ID") != null){
			request.setAttribute("status", getStatusChanges());
			
			request.setAttribute("issue", DA.getIssue(Integer.parseInt(request.getParameter("ID"))));
			RequestDispatcher dispatchIssue = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Issues/viewIssue.jsp");
			dispatchIssue.forward(request, response);
		}
		
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
			
			DA.reportIssue(issue, user.getUserid());
		}
		catch(Exception ex){
			System.err.println(ex.getMessage());
			}
		}
	private List<String> getStatusChanges(){
		List<String> status = new LinkedList<>();
		status.add("In Progress");
		status.add("Waiting on third party");
		status.add("Waiting on reporter");
		status.add("Completed");
		
		return status;
	}
}