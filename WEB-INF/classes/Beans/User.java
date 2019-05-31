package Beans;
import javax.sql.*;
import java.util.*;
import java.io.Serializable;

public class User implements Serializable{
	private int UserID;
	private String FirstName;
	private String LastName;
	private String Email;
	private String Password;
	private int Phone;
	private boolean IsAdmin;
	
	public void setUserid(int userID){
		this.UserID = userID;
	}
	public int getUserid(){
		return this.UserID;
	}
	public void setFirstname(String firstname){
		this.FirstName = firstname;
	}
	public String getFirstname(){
		return this.FirstName;
	}
	public void setLastname(String lastname){
		this.LastName = lastname;
	}
	public String getLastname(){
		return this.LastName;
	}
	public void setEmail(String email){
		this.Email = email;
	}
	public String getEmail(){
		return this.Email;
	}
	public void setPassword(String password){
		this.Password = password;
	}
	public String getPassword(){
		return this.Password;
	}
	public void setPhone(int phone){
		this.Phone = phone;
	}
	public int getPhone(){
		return this.Phone;
	}
	public void setIsadmin(boolean isadmin){
		this.IsAdmin = isadmin;
	}
	public boolean getIsadmin(){
		return this.IsAdmin;
	}
}