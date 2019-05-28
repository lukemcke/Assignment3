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
	
}