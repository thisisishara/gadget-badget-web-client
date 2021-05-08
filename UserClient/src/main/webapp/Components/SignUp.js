$(document).ready(function(){
	//handle history and page refresh issues
	window.onunload = function(){};
	
	$("#user").val("Select");
	
	$("#alertbox").hide();
	$("#consumerform").hide();
	$("#researcherform").hide();
	$("#funderform").hide();
	
	//remove auth cookies
	if (Cookies.get('gadgetbadget-auth') != undefined){
		Cookies.remove('gadgetbadget-auth');
	}
});

$(document).on("click", "#check", function (event) {
    alert( "Handler called." );
});

$(document).on("change", "#user", function (event) {
    //alert( $(this).val() );
	if( $(this).val()=="Consumer") {
		$('#researcherform').hide();
		$('#consumerform').fadeIn();
		$("#funderform").hide();
	}
	else if( $(this).val()=="Funder") {
		$('#researcherform').hide();
		$('#consumerform').hide();
		$("#funderform").fadeIn();
	}
	else if( $(this).val()=="Researcher") {
		$('#researcherform').fadeIn();
		$('#consumerform').hide();
		$("#funderform").hide();
	}
	else {
		$('#researcherform').fadeOut();
		$('#consumerform').fadeOut();
		$("#funderform").fadeOut();
	}
});