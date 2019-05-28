package Beans;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.io.Serializable;

public class Issue implements Serializable{
	String IssueID;
	String Title;
	String Description;
	String ResolveDetails;
	String DateReported;
	String DateResolved;
	String Status;
	
	public void setIssueID(String ID){
		this.IssueID = ID;
	}
	public String getIssueID(){
		return IssueID;
	}
	public void setTitle(String title){
		this.Title = title;
	}
	public String getTitle(){
		return Title;
	}
	public void setDescription(String description){
		this.Description = description;
	}
	public String getDescription(){
		return Description;
	}
	public void setResolveDetails(String details){
		this.ResolveDetails = details;
	}
	public String getResolveDetails(){
		return ResolveDetails;
	}
	public void setDateReported(String dateReported){
		this.DateReported = dateReported;
	}
	public String getDateReported(){
		return DateReported;
	}
	public void setDateResolved(String dateResolved){
		this.DateResolved = dateResolved;
	}
	public String getDateResolved(){
		return DateReported;
	}
	public void setStatus(String status){
		this.Status = status;
	}
	public String getStatus(){
		return Status;
	}
	
	
	public static List<Issue> getAllIssues() throws Exception{
		String query = "SELECT * FROM Issue";
		List<Issue> Issues = new LinkedList<>();
		try(Connection connection = Config.getConnection(); //step 1
		Statement statement = connection.createStatement(); //step 2
		ResultSet result = statement.executeQuery(query);){ //step 3 and 4
			while(result.next()){ //step 5
				Issue issue = new Issue();
				// you should be validating the following,
				// this is just an example to get you started
				issue.setIssueID(Integer.toString(result.getInt(1)));
				issue.setTitle(result.getString(2));
				issue.setDescription(result.getString(3));
				Issues.add(issue);
			}
		}
		catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
		return Issues;
	}
}