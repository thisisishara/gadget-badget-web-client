$(document).ready(function(){
	$("#alertbox").hide();
	$("#consumerform").hide();
	$("#researcherform").hide();
	$("#funderform").hide();
});

$(document).on("click", "#check", function (event) {
    alert( "Handler called." );
});

$(document).on("change", "#user", function (event) {
    //alert( $(this).val() );
	if( $(this).val()=="Consumer") {
		$('#researcherform').fadeOut();
		$('#consumerform').fadeIn();
		$("#funderform").fadeOut();
	}
	else if( $(this).val()=="Funder") {
		$('#researcherform').fadeOut();
		$('#consumerform').fadeOut();
		$("#funderform").fadeIn();
	}
	else if( $(this).val()=="Researcher") {
		$('#researcherform').fadeIn();
		$('#consumerform').fadeOut();
		$("#funderform").fadeOut();
	}
	else {
		$('#researcherform').fadeOut();
		$('#consumerform').fadeOut();
		$("#funderform").fadeOut();
	}
});