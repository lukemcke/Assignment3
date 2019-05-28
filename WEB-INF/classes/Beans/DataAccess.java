package Beans;

import javax.sql.*;
import java.sql.*;
import java.util.*;


public class DataAccess {
	
	public static List<Category> getCategories() throws Exception{
		String query = "SELECT * FROM Category";
		List<Category> categories = new LinkedList<>();
		try(Connection connection = Config.getConnection(); //step 1
		Statement statement = connection.createStatement(); //step 2
		ResultSet result = statement.executeQuery(query);){ //step 3 and 4
			while(result.next()){ //step 5
				Category category = new Category();
				category.setCategoryID(Integer.toString(result.getInt(1)));
				category.setCategoryType(result.getString(2));
				categories.add(category);
			}
		}
		catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
		return categories;
	}
	public List<String> getSubCategories(String CategoryID) throws Exception{

				Connection connection = null;
				ResultSet rs = null;
				PreparedStatement ps = null;
				try {
				connection = Config.getConnection();
				ps = connection.prepareStatement("SELECT SubCategoryType FROM SubCategory WHERE CategoryID =?");
				ps.setString(1, CategoryID);
				rs = ps.executeQuery();
				
				List<String> subCategoryList = new ArrayList<String>();
				while(rs.next())
				{
					subCategoryList.add(rs.getString("SubCategoryType"));
				}
				return subCategoryList;
				
			} catch (Exception ex) {
				ex.printStackTrace();
			}finally {
				connection.close();
			}
			return null;
		}
	
	public void reportIssue(Issue issue) throws Exception {
		try {
			
			Connection connection = Config.getConnection(); //step 1
			
			PreparedStatement statement = connection.prepareStatement("INSERT INTO Issue (Title, Description, DateReported, Status, CategoryID) VALUES (?,?,?,?,?)");
			statement.setString(1, issue.getTitle());
			statement.setString(2, issue.getDescription());
			statement.setString(3, issue.getDateReported());
			statement.setString(4, "New");
			statement.setInt(5, 1);
			
			statement.executeUpdate();
		}
		catch(SQLException e){
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
		
	}
		
	}