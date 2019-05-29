package Beans;

import javax.sql.*;
import java.sql.*;
import java.sql.Date;
import java.util.*;


public class DataAccess {
	
	public static List<String> getCategories() throws Exception{
		List<String> categories = new LinkedList<String>();
		categories.add("Network");
		categories.add("Software");
		categories.add("Hardware");
		categories.add("Email");
		categories.add("Account");
		
		return categories;
	}
	
	public static Issue getIssue(int IssueID) throws Exception{
		String query = "SELECT * FROM Issue WHERE IssueID = "+ IssueID + "";
		Issue issue = new Issue();
		try(Connection connection = Config.getConnection();
		Statement statement = connection.createStatement(); 
		ResultSet result = statement.executeQuery(query);){ 
			while(result.next()){ 
				issue.setIssueID(result.getInt(1));
				issue.setTitle(result.getString(2));
				issue.setDescription(result.getString(3));
				issue.setDatereported(result.getString(5));
				issue.setStatus(result.getString(7));
				issue.setCategory(result.getString(8));
				issue.setSubcategory(result.getString(9));
			}
		}
		catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
			return issue;
	}
	
	public static List<Issue> getAllIssues() throws Exception{
		String query = "SELECT * FROM Issue";
		List<Issue> Issues = new LinkedList<>();
		try(Connection connection = Config.getConnection();
		Statement statement = connection.createStatement(); 
		ResultSet result = statement.executeQuery(query);){ 
			while(result.next()){ 
				Issue issue = new Issue();

				issue.setIssueID(result.getInt(1));
				issue.setTitle(result.getString(2));
				issue.setDescription(result.getString(3));
				issue.setDatereported(result.getString(5));
				issue.setStatus(result.getString(7));
				issue.setCategory(result.getString(8));
				issue.setSubcategory(result.getString(9));
				;
				Issues.add(issue);
				
			}
		}
		catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
		return Issues;
	}
	
	public void reportIssue(Issue issue) throws Exception {
		try {
			
			Connection connection = Config.getConnection();
			
			PreparedStatement statement = connection.prepareStatement("INSERT INTO Issue (Title, Description, DateReported, Status, Category, SubCategory) VALUES (?,?,?,?,?,?)");
			
			long now = System.currentTimeMillis();
			java.sql.Timestamp timestamp = new java.sql.Timestamp(now);
			
			statement.setString(1, issue.getTitle());
			statement.setString(2, issue.getDescription());
			statement.setTimestamp(3, timestamp);
			statement.setString(4, "New");
			statement.setString(5, issue.getCategory());
			statement.setString(6, issue.getSubcategory());
			
			statement.executeUpdate();
		}
		catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
		
	}
	
	public static List<Issue> searchIssues(String keyWord) throws Exception{
		String query = "SELECT * FROM Issue WHERE Title LIKE '%"+ keyWord + "%' OR Description LIKE '%" + keyWord + "%' OR Category LIKE '%"+ keyWord + "%'";
		List<Issue> Issues = new LinkedList<>();
		try(Connection connection = Config.getConnection();
		Statement statement = connection.createStatement(); 
		ResultSet result = statement.executeQuery(query);){ 
			while(result.next()){ 
				Issue issue = new Issue();

				issue.setIssueID(result.getInt(1));
				issue.setTitle(result.getString(2));
				issue.setDescription(result.getString(3));
				issue.setDateresolved(result.getString(4));
				issue.setDatereported(result.getString(5));
				issue.setStatus(result.getString(7));
				issue.setCategory(result.getString(8));
				issue.setSubcategory(result.getString(9));
				;
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