package Beans;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.Serializable;
import java.util.*;
import java.text.SimpleDateFormat;

<<<<<<< HEAD
@WebServlet(urlPatterns = { "/Knowledge" })
=======
@WebServlet(urlPatterns = { "/knowledgebase" })
>>>>>>> 0a1b6ba472d4df8ebcd06244030127eeb73bc7b3
public class KnowledgeController extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		DataAccess DA = new DataAccess();
		//DA.addArticle();
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
	public void addArticle(){
		//String articleTitle = request.getParameter();
		
		//Knowledge article = new Knowledge();
		//article.set(

	}
}