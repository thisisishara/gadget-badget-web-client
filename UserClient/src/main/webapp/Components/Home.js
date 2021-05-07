$(document).ready(function(){
	$("#alertbox").hide();
	
	//remove auth cookies
	if (Cookies.get('gadgetbadget-auth') != undefined){
		Cookies.remove('gadgetbadget-auth');
	}
});

$(document).on("click", "#signin", function (event) {
    $("#alertbox").hide()
    $("#alertheading").text("");
    $("#alertcontent").text("");

    var status = validateCredentials();
    if (status != true) {
        $("#alertheading").text("Error occurred while signing in");
        $("#alertcontent").text(status);
		$(".alert").removeClass("alert-secondary").addClass("alert-danger");
        $("#alertbox").show();
        return;
    }

    $.ajax(
        {
            url: "Authenticate",
            type: "POST",
            data: $("#loginform").serialize(),
            dataType: "text",
            xhrFields: {
    			withCredentials: true
			},
            complete: function (response, status) {
                onAuthenticationComplete(response.responseText, status);
            }
        });
});

function onAuthenticationComplete(response, status) {
    if (status == "success") {
        var resultSet = JSON.parse(response);
        if (resultSet.STATUS.trim() == "AUTHENTICATED") {
            //redirect
            //test cookie val
			//alert(resultSet["JWT Auth Token"].trim());
			$("#alertheading").text("Authenticated.");
	        $("#alertcontent").text("JWT="+resultSet["JWT Auth Token"].trim());
			$(".alert").removeClass("alert-secondary").addClass("alert-success");
	        $("#alertbox").show();
	        
	        //set cookie
	        Cookies.remove('gadgetbadget-auth');
	        Cookies.set('gadgetbadget-auth', resultSet["JWT Auth Token"].trim(), { expires: 1 });
	        
	        window.location.href = "AdminDashboard.jsp";
        } else {
	        $("#alertheading").text("Authentication Failed");
	        $("#alertcontent").text(resultSet.MESSAGE.trim());
			$(".alert").removeClass("alert-secondary").addClass("alert-danger");
	        $("#alertbox").show();
        }
    } else if (status == "error") {
        $("#alertheading").text("Authentication Failed");
        $("#alertcontent").text(status);
		$(".alert").removeClass("alert-secondary").addClass("alert-danger");
        $("#alertbox").show();
    } else {
        $("#alertheading").text("Authentication Failed.");
        $("#alertcontent").text("Unknown error occurred while signing in. please try again later.");
		$(".alert").removeClass("alert-secondary").addClass("alert-danger");
        $("#alertbox").show();
    }
    $("#loginform")[0].reset();
}


// CLIENT-MODEL================================================================
function validateCredentials() {
    // username
    if ($("#username").val().trim() == "") {
        return "Type in a valid username.";
    }
    // password
    if ($("#password").val().trim() == "") {
        return "Type in a valid password.";
    }
    return true;
}