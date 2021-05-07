$(document).ready(function(){
	//handle history issues
	window.onunload = function(){}; 
	
	var AuthCookie = Cookies.get('gadgetbadget-auth');
	
	//check cookie at first
	if(AuthCookie == undefined){
		window.location.href = "Home.jsp";
	}	
});