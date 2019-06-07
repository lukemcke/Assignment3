
Luke McKenzie : 3259537
Julio De Guzman : 3235116
Nathan Haigh : 3201666

URL : http://localhost:8080/c3259537_c3235116_c3201666_FinalProject/

Setup procedure:
		
Our system is run using MySQLWorkbench to initialise the local server -
 1. Open MySQLWorkbench
 2. Select "Add connection"
 3. Select "Configure Server Management"
 4. Continue to select next until setup complete
 5. Open the newly created connection
 6. Open the SQL script "assignment3.sql" and run it (this should create the schema and add dummy data)
 7. Open Tomocat and enter the URL above.

Structure : 

Our system is set as an MVC Structure that uses controllers 
to retrieve/store the data from the JSP's and send it to a DataAccess class
where it then stores or retrieves data. Therefore the JSP's never directly
access the jsp files as the controller act as a medium between the two.

Jsps <--> Controller <--> DataAccess
			^
			|
			Classes 