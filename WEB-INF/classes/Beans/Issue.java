package Beans;
import javax.sql.*;
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
	String Category;
	String SubCategory;
	
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
	public void setDatereported(String datereported){
		this.DateReported = datereported;
	}
	public String getDatereported(){
		return DateReported;
	}
	public void setDateResolved(String dateResolved){
		this.DateResolved = dateResolved;
	}
	public String getDateResolved(){
		return DateResolved;
	}
	public void setStatus(String status){
		this.Status = status;
	}
	public String getStatus(){
		return Status;
	}
	public void setCategory(String category){
		this.Category = category;
	}
	public String getCategory(){
		return Category;
	}
	public void setSubcategory(String subcategory){
		this.SubCategory = subcategory;
	}
	public String getSubcategory(){
		return SubCategory;
	}
}