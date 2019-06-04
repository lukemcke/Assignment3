function validateLogin() {
	var email = document.getElementById("email").value;
	var password = document.getElementById("password").value;
	var valid = true;
	var errorMessage = "";
	if(email == "" || !email){
		valid = false;
		errorMessage = "Please Enter A Email\n";
	}
	if(password == "" || !password){
		valid = false;
		errorMessage += "Please Enter A Password";
	}
	if(!valid){
		alert(errorMessage);
	}
	
	return valid;
}

function validateReport() {
	var title = document.getElementById("txtTitle").value;
	var text = document.getElementById("txtarea").value;
	var category = document.getElementById("Cat").value;
	var valid = true;
	var errorMessage = "";
	if(title == "" || !title){
		valid = false;
		errorMessage = "Please Enter A Title\n";
	}
	if(text == "" || !text){
		valid = false;
		errorMessage += "Please Enter Text in Description\n";
	}
	if(category == "Select A Category"){
		valid = false;
		errorMessage += "Please Select a Category";
	}
	if(!valid){
		alert(errorMessage);
	}
	return valid;
}