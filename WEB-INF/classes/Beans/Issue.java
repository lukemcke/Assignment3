package Beans;
import javax.sql.*;
import java.util.*;
import java.io.Serializable;

public class Issue implements Serializable{
	private int IssueID;
	private String Title;
	private String Description;
	private String ResolveDetails;
	private String DateReported;
	private String DateResolved;
	private String Status;
	private String Category;
	private String SubCategory;
	private int UserID;
	
	public void setIssueid(int ID){
		this.IssueID = ID;
	}
	public int getIssueid(){
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
	public void setDateresolved(String dateResolved){
		this.DateResolved = dateResolved;
	}
	public String getDateresolved(){
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
	public void setUserid(int userid){
		this.UserID = userid;
	}
	public int getUserid(){
		return this.UserID;
	}
}