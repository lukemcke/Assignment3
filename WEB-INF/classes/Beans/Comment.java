package Beans;
import javax.sql.*;
import java.util.*;
import java.io.Serializable;

public class Comment implements Serializable{
	private int CommentID;
	private String Title;
	private String Field;
	private int IssueID;
	
	public void setCommentid(int commentID){
		this.CommentID = commentID;
	}
	public int getCommentid(){
		return this.CommentID;
	}
	public void setTitle(String title){
		this.Title = title;
	}
	public String getTitle(){
		return this.Title;
	}
	public void setField(String field){
		this.Field = field;
	}
	public String getField(){
		return this.Field;
	}
	public void setIssueid(int issueid){
		this.IssueID = issueid;
	}
	public int getIssueid(){
		return this.IssueID;
	}
	
}