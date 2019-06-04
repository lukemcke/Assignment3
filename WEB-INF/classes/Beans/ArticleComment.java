package Beans;
import javax.sql.*;
import java.util.*;
import java.io.Serializable;

public class ArticleComment implements Serializable{
	private int CommentID;
	private String Title;
	private String Field;
	private int ArticleID;
	
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
	public void setArticleid(int articleid){
		this.ArticleID = articleid;
	}
	public int getArticleid(){
		return this.ArticleID;
	}
	
}