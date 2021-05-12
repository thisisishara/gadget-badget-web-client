//-------------------------------------------------------------------------------------------------------------------------------
//CONNECTOR----------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------

//CONTENT PREPARATION
$(document).ready(function () {
    //handle history and page refresh issues
    window.onunload = function () { };

    $("#user").val("Select");

    $("#consumerform").hide();
    $("#researcherform").hide();
    $("#funderform").hide();

    //remove auth cookies
    if (Cookies.get('gadgetbadget-auth') != undefined) {
        Cookies.remove('gadgetbadget-auth');
    }

    //set toast delay
    $('.toast').toast({
        //autohide: false,
        delay: 5000
    });
});

//USER TYPE SELECTION EVENT LISTENER
$(document).on("change", "#user", function (event) {
    //alert( $(this).val() );
    if ($(this).val() == "Consumer") {
        $('#researcherform').hide();
        $('#consumerform').fadeIn();
        $("#funderform").hide();
    }
    else if ($(this).val() == "Funder") {
        $('#researcherform').hide();
        $('#consumerform').hide();
        $("#funderform").fadeIn();
    }
    else if ($(this).val() == "Researcher") {
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

//TOAST
$(document).on("click", "#liveToastBtn", function (event) {
    $('.toast').toast('show');
});

//SUBMIT CONSUMER FORM
$(document).on("click", "#consumersignup", function (event) {
    //hide alerts
    //$('.toast').toast('hide');

    //form validation
    var validationStatus = validateConsumerForm();
    if (validationStatus != true) {
        buildToast("bg-danger", "Couldn't Creating the Account", validationStatus, "", "Media/error_red_sq.png");
        $('.toast').toast('show');
        return;
    }

    $.ajax(
        {
            url: "UserClientAPI",
            type: "POST",
            data: $("#consumerform").serialize(),
            dataType: "text",
            complete: function (response, status) {
                onConsumerSaveComplete(response.responseText, status);
            }
        });
});

//POST-CONSUMER RESPONSE HANDLING
function onConsumerSaveComplete(response, status) {
    if (status == "success") {
        var resultSet = JSON.parse(response);

        if (resultSet.STATUS.trim() == "SUCCESSFUL") {
            buildToast("bg-success", "Signing up completed.", "Account created successfully. Please sign in to start using your new account.", "", "Media/check_green.png");
            $('.toast').toast('show');
        } else {
            buildToast("bg-danger", "Error Occurred", resultSet.MESSAGE.trim(), "", "Media/error_red_sq.png");
            $('.toast').toast('show');
        }
    } else if (status == "error") {
        buildToast("bg-danger", "Couldn't Create the Account", "Error occurred while saving the account details.", "", "Media/error_red_sq.png");
        $('.toast').toast('show');
    } else {
        buildToast("bg-danger", "Couldn't Create the Account", "Unknown Error occurred while creating the account.", "", "Media/error_red_sq.png");
        $('.toast').toast('show');
    }
    $("#consumerform")[0].reset();
}

//SUBMIT FUNDER FORM
$(document).on("click", "#fundersignup", function (event) {
    //hide alerts
    //$('.toast').toast('hide');

    //form validation
    var validationStatus = validateFunderForm();
    if (validationStatus != true) {
        buildToast("bg-danger", "Couldn't Creating the Account", validationStatus, "", "Media/error_red_sq.png");
        $('.toast').toast('show');
        return;
    }

    $.ajax(
        {
            url: "UserClientAPI",
            type: "POST",
            data: $("#funderform").serialize(),
            dataType: "text",
            complete: function (response, status) {
                onFunderSaveComplete(response.responseText, status);
            }
        });
});

//POST-FUNDER RESPONSE HANDLING
function onFunderSaveComplete(response, status) {
    if (status == "success") {
        var resultSet = JSON.parse(response);

        if (resultSet.STATUS.trim() == "SUCCESSFUL") {
            buildToast("bg-success", "Signing up completed.", "Account created successfully. Please sign in to start using your new account.", "", "Media/check_green.png");
            $('.toast').toast('show');
        } else {
            buildToast("bg-danger", "Error Occurred", resultSet.MESSAGE.trim(), "", "Media/error_red_sq.png");
            $('.toast').toast('show');
        }
    } else if (status == "error") {
        buildToast("bg-danger", "Couldn't Create the Account", "Error occurred while saving the account details.", "", "Media/error_red_sq.png");
        $('.toast').toast('show');
    } else {
        buildToast("bg-danger", "Couldn't Create the Account", "Unknown Error occurred while creating the account.", "", "Media/error_red_sq.png");
        $('.toast').toast('show');
    }
    $("#funderform")[0].reset();
}

//SUBMIT RESEARCHER FORM
$(document).on("click", "#researchersignup", function (event) {
    //hide alerts
    //$('.toast').toast('hide');

    //form validation
    var validationStatus = validateResearcherForm();
    if (validationStatus != true) {
        buildToast("bg-danger", "Couldn't Creating the Account", validationStatus, "", "Media/error_red_sq.png");
        $('.toast').toast('show');
        return;
    }

    $.ajax(
        {
            url: "UserClientAPI",
            type: "POST",
            data: $("#researcherform").serialize(),
            dataType: "text",
            complete: function (response, status) {
                onResearcherSaveComplete(response.responseText, status);
            }
        });
});

//POST-RESEARCHER RESPONSE HANDLING
function onResearcherSaveComplete(response, status) {
    if (status == "success") {
        var resultSet = JSON.parse(response);

        if (resultSet.STATUS.trim() == "SUCCESSFUL") {
            buildToast("bg-success", "Signing up completed.", "Account created successfully. Please sign in to start using your new account.", "", "Media/check_green.png");
            $('.toast').toast('show');
        } else {
            buildToast("bg-danger", "Error Occurred", resultSet.MESSAGE.trim(), "", "Media/error_red_sq.png");
            $('.toast').toast('show');
        }
    } else if (status == "error") {
        buildToast("bg-danger", "Couldn't Create the Account", "Error occurred while saving the account details.", "", "Media/error_red_sq.png");
        $('.toast').toast('show');
    } else {
        buildToast("bg-danger", "Couldn't Create the Account", "Unknown Error occurred while creating the account.", "", "Media/error_red_sq.png");
        $('.toast').toast('show');
    }
    $("#researcherform")[0].reset();
}

//-------------------------------------------------------------------------------------------------------------------------------
//CLIENT-MODEL-------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------

function validateConsumerForm() {
    //VALIDATIONS
    if ($("#consumerusername").val().trim() == "") {
        return "Username cannot be empty.";
    }

    if ($("#consumeremail").val().trim() == "") {
        return "Email address cannot be empty.";
    }

    var emailRegEx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (!emailRegEx.test($("#consumeremail").val().trim())) {
        return "Enter a valid email address.";
    }

    if ($("#consumerpassword").val().trim() == "") {
        return "Password cannot be empty.";
    }

    if ($("#consumerfirstname").val().trim() == "") {
        return "First name cannot be empty.";
    }

    if ($("#consumerlastname").val().trim() == "") {
        return "Last name cannot be empty.";
    }

    if ($("#consumergender").val().trim() == "Gender") {
        return "Gender cannot be empty.";
    }

    var phoneRegEx = /(0|[+][9][4])[0-9]{9}/;
    if (!phoneRegEx.test($("#consumerphone").val().trim())) {
        return "Enter a valid contact number.";
    }
    return true;
}

function validateFunderForm() {
    //VALIDATIONS
    if ($("#funderusername").val().trim() == "") {
        return "Username cannot be empty.";
    }

    if ($("#funderemail").val().trim() == "") {
        return "Email address cannot be empty.";
    }

    var emailRegEx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (!emailRegEx.test($("#funderemail").val().trim())) {
        return "Enter a valid email address.";
    }

    if ($("#funderpassword").val().trim() == "") {
        return "Password cannot be empty.";
    }

    if ($("#funderfirstname").val().trim() == "") {
        return "First name cannot be empty.";
    }

    if ($("#fundersecondname").val().trim() == "") {
        return "Last name cannot be empty.";
    }

    if ($("#fundergender").val().trim() == "Gender") {
        return "Gender cannot be empty.";
    }

    var phoneRegEx = /(0|[+][9][4])[0-9]{9}/;
    if (!phoneRegEx.test($("#funderphone").val().trim())) {
        return "Enter a valid contact number.";
    }

    if ($("#funderorg").val().trim() == "") {
        return "Organization cannot be empty.";
    }

    return true;
}

function validateResearcherForm() {
    //VALIDATIONS
    if ($("#researcherusername").val().trim() == "") {
        return "Username cannot be empty.";
    }

    if ($("#researcheremail").val().trim() == "") {
        return "Email address cannot be empty.";
    }

    var emailRegEx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (!emailRegEx.test($("#researcheremail").val().trim())) {
        return "Enter a valid email address.";
    }

    if ($("#researcherpassword").val().trim() == "") {
        return "Password cannot be empty.";
    }

    if ($("#researcherfirstname").val().trim() == "") {
        return "First name cannot be empty.";
    }

    if ($("#researchersecondname").val().trim() == "") {
        return "Last name cannot be empty.";
    }

    if ($("#researchergender").val().trim() == "Gender") {
        return "Gender cannot be empty.";
    }

    var phoneRegEx = /(0|[+][9][4])[0-9]{9}/;
    if (!phoneRegEx.test($("#researcherphone").val().trim())) {
        return "Enter a valid contact number.";
    }

    if ($("#researcherinstitute").val().trim() == "") {
        return "Institute cannot be empty.";
    }

    if ($("#researcherfos").val().trim() == "Field of Study") {
        return "Field of Study cannot be empty.";
    }

    if ($("#researcheryoe").val().trim() == "") {
        return "Years of Experience cannot be empty.";
    }

    if (!$.isNumeric($("#researcheryoe").val().trim())) {
        return "Invalid Value given for Years of Experience.";
    }

    if ($("#researcheryoe").val().trim() < 0 || $("#researcheryoe").val().trim() > 100) {
        return "Years of Experience is out of range.";
    }

    return true;
}

function buildToast(bg, heading, body, time, icon) {
    $("#liveToast").removeClass();
    $("#liveToast").addClass("toast hide text-white " + bg);
    $("#liveToastHeaderDiv").removeClass();
    $("#liveToastHeaderDiv").addClass("toast-header text-white " + bg);
    $("#liveToastIcon").attr("src", icon);
    $("#liveToastTime").text(time);
    $("#liveToastHeading").text(heading);
    $("#liveToastBody").text(body);
}