package Beans;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.io.Serializable;

public class Category implements Serializable{
	String CategoryID;
	String CategoryType;
	
	public void setCategoryID(String ID){
		this.CategoryID = ID;
	}
	public String getCategoryID(){
		return CategoryID;
	}
	public void setCategoryType(String Type){
		this.CategoryType = Type;
	}
	public String getCategoryType(){
		return CategoryType;
	}
	
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
}