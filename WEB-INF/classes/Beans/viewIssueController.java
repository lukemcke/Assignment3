package Beans;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.Serializable;
import java.util.*;
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = { "/viewIssue" })
public class viewIssueController extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		try{
		DataAccess DA = new DataAccess();
		RequestDispatcher dispatchIssues = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Issues/viewIssues.jsp");
		RequestDispatcher dispatchIssue = getServletContext().getRequestDispatcher("/WEB-INF/Jsps/Issues/viewIssue.jsp");
		//refreshes page after submitting
		
		HttpSession userSession = request.getSession();
		User user = (User) userSession.getAttribute("userLogin");
		
		//Add comment then returns back to view issues
		if(request.getParameter("addComment") != null){
				addComment(DA, request, response);
				setArrtibutes(DA, request, response);
			}
			
		if(request.getParameter("Status") != null){
			DA.changeStatus(request.getParameter("changeStatus"),  Integer.parseInt(request.getParameter("issueID")));
			DA.addResolveDetails(Integer.parseInt(request.getParameter("issueID")), request.getParameter("resolvedetails"));
			request.setAttribute("issues", DA.getAllIssues());
			dispatchIssues.forward(request, response);
		}
			
		if(request.getParameter("ID") != null){
			setArrtibutes(DA, request, response);
			//When admin clicks on view Issue changes status from new to In progress
			if(user.getIsadmin()){
				DA.changeStatus("In progress", Integer.parseInt(request.getParameter("ID")));
			}

			dispatchIssue.forward(request, response);
		}
		if(user.getIsadmin()){
				request.setAttribute("issues", DA.getAllIssues());
			}
			else {
				request.setAttribute("userissues", DA.getUserIssues(user.getUserid()));
			}
		dispatchIssues.forward(request, response);
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
		status.add("Waiting on third party");
		status.add("Waiting on reporter");
		status.add("Completed");
		
		return status;
	}
	private void addComment(DataAccess DA, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		try {
		String Field = request.getParameter("comment");
		String Title = request.getParameter("commTitle");
		int IssueID = Integer.parseInt(request.getParameter("issueID"));
		
		
		Comment comment = new Comment();
		comment.setTitle(Title);
		comment.setField(Field);
		comment.setIssueid(IssueID);
		
		DA.addComment(comment);
		}
		catch(Exception ex){
		}
	}
	private void setArrtibutes(DataAccess DA, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
		request.setAttribute("status", getStatusChanges());
		request.setAttribute("issue", DA.getIssue(Integer.parseInt(request.getParameter("ID"))));
		request.setAttribute("comments", DA.getComments(Integer.parseInt(request.getParameter("ID"))));
		}
		catch(Exception ex){
		}
	}
}