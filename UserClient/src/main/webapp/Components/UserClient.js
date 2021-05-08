//CHECK AUTH COOKIE ON PAGE LOAD
//SET CONTENT VISIBILITY
$(document).ready(function(){
	//handle history and page refresh issues
	window.onunload = function(){}; 
	
	var AuthCookie = Cookies.get('gadgetbadget-auth');
	
	//check cookie at first
	if(AuthCookie == undefined){
		window.location.href = "Home.jsp";
	}
	
    $(".sidebarpage").hide();
    loadAdminDBContents();
});

//SIDEBAR ACTIVE LINK SET
$(document).on("click", ".nav-link", function (event) {
    $(".nav-link").removeClass("active");
    $(this).addClass("active");
    $(".sidebarpage").hide();
    
    var activeSidebarItem = $(this).find(".admindashboardlink").text();
    
    if(activeSidebarItem == "Dashboard") {
    	loadAdminDBContents();
    } else if (activeSidebarItem == "User Management"){
	    loadAdminUMContents();
	} else if (activeSidebarItem == "Account Security"){
	    loadAdminASContents();
	} else if (activeSidebarItem == "Profile Settings"){
	    loadAdminPSContents();
	}	
});

//LOAD CONTENTS ON CLICK
function loadAdminDBContents(){
	$("#admindashboard").fadeIn();
}

function loadAdminUMContents(){
	$("#adminusermgmt").fadeIn();
}

function loadAdminASContents(){
	$("#adminaccsec").fadeIn();
}

function loadAdminPSContents(){
	$("#adminprofsett").fadeIn();
}