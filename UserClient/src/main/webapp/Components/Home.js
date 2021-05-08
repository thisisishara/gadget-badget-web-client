//CONTENT PREPARATION
$(document).ready(function(){
	//handle history and page refresh issues
	window.onunload = function(){};
	
	//remove auth cookies
	if (Cookies.get('gadgetbadget-auth') != undefined){
		Cookies.remove('gadgetbadget-auth');
	}
	
	//set toast delay
    $('.toast').toast({
        //autohide: false,
        delay: 5000
    });
});

//TOAST
$(document).on("click", "#liveToastBtn", function (event) {
    $('.toast').toast('show');
});

$(document).on("click", "#signin", function (event) {
    var validationStatus = validateCredentials();
    if (validationStatus != true) {
       	buildToast("bg-danger", "Couldn't Sign in", validationStatus, "", "Media/error_red_sq.png")
        $('.toast').toast('show');
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
            //test cookie val
			//alert(resultSet["JWT Auth Token"].trim());
			
			buildToast("bg-success", "Authenticated.", "Signed in successfully. Redirecting...", "", "Media/check_green.png")
            $('.toast').toast('show');
	        
	        //set cookie [exp: 1day]
	        Cookies.remove('gadgetbadget-auth');
	        Cookies.set('gadgetbadget-auth', resultSet["JWT Auth Token"].trim(), { expires: 1 });
	        
	        //redirect
	        var role = resultSet.ROLE.trim();
	        if(role == "ADMIN") {
	        	window.location.href = "AdminDashboard.jsp";
	        } else {
		       	buildToast("bg-danger", "Couldn't Sign in", "Only Administrators can sign-in for now.", "", "Media/error_red_sq.png")
		        $('.toast').toast('show');
	        }
        } else {
        	buildToast("bg-danger", "Couldn't Sign in", "Authentication Failed."+"\n"+resultSet.MESSAGE.trim(), "", "Media/error_red_sq.png")
        	$('.toast').toast('show');
        }
    } else if (status == "error") {
        buildToast("bg-danger", "Couldn't Sign in", "Authentication Failed due to an unknown issue.", "", "Media/error_red_sq.png")
        $('.toast').toast('show');
    } else {
        buildToast("bg-danger", "Couldn't Sign in", "Failed to contact the server. Please try again later.", "", "Media/error_red_sq.png")
        $('.toast').toast('show');
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

function buildToast(bg, heading, body, time, icon) {
    $("#liveToastIcon").attr("src", icon);
    $("#liveToast").removeClass();
    $("#liveToast").addClass("toast hide text-white " + bg);
    $("#liveToastHeaderDiv").removeClass();
    $("#liveToastHeaderDiv").addClass("toast-header text-white " + bg);
    $("#liveToastTime").text(time);
    $("#liveToastHeading").text(heading);
    $("#liveToastBody").text(body);
}