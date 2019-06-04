package Beans;
import javax.sql.*;
import java.util.*;
import java.io.Serializable;

public class Knowledge implements Serializable{
	private int ArticleID;
	private String OriginalIssue;
	private String Description;
	private String ResolveDetails;
	private String Category;
	private String SubCategory;
	private String DateSolved;
	
	public void setArticleid(int articleID){
		this.ArticleID = articleID;
	}
	public int getArticleid(){
		return this.ArticleID;
	}
	public void setOriginalissue(String originalissue){
		this.OriginalIssue = originalissue;
	}
	public String getOriginalissue(){
		return this.OriginalIssue;
	}
	public void setDescription(String description){
		this.Description = description;
	}
	public String getDescription(){
		return this.Description;
	}
	public void setResolvedetails(String resolvedetails){
		this.ResolveDetails = resolvedetails;
	}
	public String getResolvedetails(){
		return this.ResolveDetails;
	}
	public void setCategory(String category){
		this.Category = category;
	}
	public String getCategory(){
		return this.Category;
	}
	public void setSubcategory(String subcategory){
		this.SubCategory = subcategory;
	}
	public String getSubcategory(){
		return this.SubCategory;
	}
	public void setDatesolved(String datesolved){
		this.DateSolved = datesolved;
	}
	public String getDatesolved(){
		return this.DateSolved;
	}
}