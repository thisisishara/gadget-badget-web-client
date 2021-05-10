<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link rel="stylesheet" href="Views/gadgetbadget.dark.css">

<!-- Favicons -->
<link rel="icon" href="Media/phywhite.png" sizes="32x32" type="image/png">

<title>GadgetBadget &#8226; Sign Up</title>
<!-- <script src="Components/jquery-3.2.1.min.js"></script> -->
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/SignUp.js"></script>
</head>
<body class="text-dark">
	<div class="container py-3 font-light">
		<header
			class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom disable-select">
			<a href="#"
				class="d-flex align-items-center text-dark text-decoration-none main"
				draggable="false"> <img class="mx-2" src="Media/phy.png" alt=""
				width="40" height="40" draggable="false"> <span class="fs-4">GadgetBadget</span>
			</a>
			<nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto ">
				<a class="me-3 py-2 text-dark text-decoration-none" href="Home.jsp">Home</a>
			</nav>
		</header>
		<main class="mb-0 pb-0">
			<!-- CONTENT START -->
			<div class="container col-xl-10 col-xxl-8 px-4 py-0 main">
				<div class="col-md-6 mb-5 disable-select">
					<h3 class="mb-2" id="mainheading">Let us know who you are</h3>
				</div>
				<!-- USER TYPE SELECTION -->
				<div class="col-md-4 mb-5">
					<label for="user" class="form-label disable-select">I am a</label>
					<select id="user" class="form-select user">
						<option selected>Select</option>
						<option>Funder</option>
						<option>Researcher</option>
						<option>Consumer</option>
					</select>
				</div>

				<!-- CUNSUMER TYPE SIGNUP -->
				<form class="row g-3" id="consumerform" name="consumerform">
					<input type="hidden" class="formtask" name="formtask"
						value="USERS"> <input type="hidden" class="usertype"
						id="usertype" name="usertype" value="Consumer">
					<div class="col-12 input-group">
						<span class="input-group-text disable-select" id="consumerun-span">@</span>
						<input type="text" class="form-control" placeholder="Username"
							aria-label="Username" aria-describedby="consumerun-span"
							id="consumerusername" name="consumerusername">
					</div>
					<div class="col-md-6">
						<input type="email" class="form-control" id="consumeremail"
							name="consumeremail" placeholder="Email">
					</div>
					<div class="col-md-6">
						<input type="password" class="form-control" id="consumerpassword"
							name="consumerpassword" placeholder="Password">
					</div>
					<div class="col-12">
						<div class="input-group">
							<span class="input-group-text disable-select">First and
								last name</span> <input type="text" aria-label="First name"
								class="form-control" id="consumerfirstname"
								name="consumerfirstname"> <input type="text"
								aria-label="Last name" class="form-control"
								id="consumerlastname" name="consumerlastname">
						</div>
					</div>
					<div class="col-md-4">
						<select id="consumergender" name="consumergender"
							class="form-select">
							<option selected>Gender</option>
							<option>Female</option>
							<option>Male</option>
							<option>Other</option>
						</select>
					</div>
					<div class="col-md-4">
						<div class="col-12">
							<input type="text" class="form-control" id="consumerphone"
								name="consumerphone" placeholder="Phone">
						</div>
					</div>
					<div class="col-12">
						<button type="button" class="btn btn-dark" id="consumersignup"
							name="consumersignup">Create Account</button>
					</div>
				</form>

				<!-- RESEARCHER TYPE SIGNUP -->
				<form class="row g-3" id="researcherform" name="researcherform">
					<input type="hidden" class="formtask" name="formtask"
						value="USERS"> <input type="hidden" class="usertype"
						id="usertype" name="usertype" value="Researcher">
					<div class="col-12 input-group">
						<span class="input-group-text disable-select"
							id="researcherun-span">@</span> <input type="text"
							class="form-control" placeholder="Username" aria-label="Username"
							aria-describedby="researcherun-span" id="researcherusername"
							name="researcherusername">
					</div>
					<div class="col-md-6">
						<input type="email" class="form-control" id="researcheremail"
							name="researcheremail" placeholder="Email">
					</div>
					<div class="col-md-6">
						<input type="password" class="form-control"
							id="researcherpassword" name="researcherpassword"
							placeholder="Password">
					</div>
					<div class="col-12">
						<div class="input-group">
							<span class="input-group-text disable-select">First and
								last name</span> <input type="text" aria-label="First name"
								class="form-control" id="researcherfirstname"
								name="researcherfirstname" placeholder="First Name"> <input
								type="text" aria-label="Last name" class="form-control"
								id="researchersecondname" name="researchersecondname"
								placeholder="Second Name">
						</div>
					</div>
					<div class="col-md-4">
						<select id="researchergender" name="researchergender"
							class="form-select">
							<option selected>Gender</option>
							<option>Female</option>
							<option>Male</option>
							<option>Other</option>
						</select>
					</div>
					<div class="col-md-4">
						<div class="col-12">
							<input type="text" class="form-control" id="researcherphone"
								name="researcherphone" placeholder="Phone">
						</div>
					</div>
					<div class="col-md-4">
						<div class="col-12">
							<input type="text" class="form-control" id="researcherinstitute"
								name="researcherinstitute" placeholder="Institution">
						</div>
					</div>
					<div class="col-md-8">
						<div class="col-12">
							<select id="researcherfos" name="researcherfos"
								class="form-select">
								<option selected>Field of Study</option>
								<option>Information Security</option>
								<option>Artificial Intelligence and Machine Learning</option>
								<option>ICT for Development</option>
								<option>Distributed &amp; Parallel Computing</option>
								<option>Software Engineering</option>
								<option>Data Communication &amp; Networking</option>
								<option>Visual Computing</option>
								<option>Robotics &amp; Intelligent Systems</option>
								<option>Data Science</option>
								<option>Design Lab</option>
								<option>Assistive Technology</option>
								<option>e-learning and Education</option>
								<option>Computational Linguistics</option>
								<option>Business Intelligence and Analytics</option>
								<option>Human Computer Interaction</option>
								<option>Other</option>
							</select>
						</div>
					</div>
					<div class="col-md-4">
						<div class="col-12">
							<input type="text" class="form-control" id="researcheryoe"
								name="researcheryoe" placeholder="Years of Experience">
						</div>
					</div>
					<div class="col-12">
						<button type="button" class="btn btn-dark" id="researchersignup"
							name="researchersignup">Create Account</button>
					</div>
				</form>

				<!-- FUNDER TYPE SIGNUP -->
				<form class="row g-3 " id="funderform" name="funderform">
					<input type="hidden" class="formtask" name="formtask"
						value="USERS"> <input type="hidden" class="usertype"
						id="usertype" name="usertype" value="Funder">
					<div class="col-12 input-group">
						<span class="input-group-text disable-select" id="funderun-span">@</span>
						<input type="text" class="form-control" placeholder="Username"
							aria-label="Username" aria-describedby="funderun-span"
							id="funderusername" name="funderusername">
					</div>
					<div class="col-md-6">
						<input type="email" class="form-control" id="funderemail"
							name="funderemail" placeholder="Email">
					</div>
					<div class="col-md-6">
						<input type="password" class="form-control" id="funderpassword"
							name="funderpassword" placeholder="Password">
					</div>
					<div class="col-12">
						<div class="input-group">
							<span class="input-group-text disable-select">First and
								last name</span> <input type="text" aria-label="First name"
								class="form-control" id="funderfirstname" name="funderfirstname">
							<input type="text" aria-label="Last name" class="form-control"
								id="fundersecondname" name="fundersecondname">
						</div>
					</div>
					<div class="col-md-4">
						<select id="fundergender" name="fundergender" class="form-select">
							<option selected>Gender</option>
							<option>Female</option>
							<option>Male</option>
							<option>Other</option>
						</select>
					</div>
					<div class="col-md-4">
						<div class="col-12">
							<input type="text" class="form-control" id="funderphone"
								name="funderphone" placeholder="Phone">
						</div>
					</div>
					<div class="col-md-4">
						<div class="col-12">
							<input type="text" class="form-control" id="funderorg"
								name="funderorg" placeholder="Organization">
						</div>
					</div>
					<div class="col-12">
						<button type="button" class="btn btn-dark" id="fundersignup"
							name="fundersignup">Create Account</button>
					</div>
				</form>
			</div>
		</main>
		<!-- TOAST -->
		<!-- button type="button" class="btn btn-primary" id="liveToastBtn">Show
			live toast</button-->
		<div class="position-fixed top-0 end-0 p-3" style="z-index: 5">
			<div id="liveToast" class="toast hide bg-danger text-white"
				role="alert" aria-live="assertive" aria-atomic="true">
				<div id="liveToastHeaderDiv"
					class="toast-header bg-danger text-white">
					<img id="liveToastIcon" src="Media/error_red_sq.png"
						class="rounded me-2" alt="..." width="25px"> <strong
						class="me-auto" id="liveToastHeading">Bootstrap Toast</strong> <small
						id="liveToastTime">Just Now</small>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="toast" aria-label="Close"></button>
				</div>
				<div class="toast-body" id="liveToastBody">Hello, world! This
					is a toast message.</div>
			</div>
		</div>
		<footer class="pt-2 my-md-5 pt-md-5 border-top disable-select">
			<div class="row">
				<div class="col-12 col-md">
					<small class="d-block mb-3 text-muted">&copy; 2021
						GadgetBadget.</small>
				</div>
				<div class="col-6 col-md">
					<h5>GadgetBadget</h5>
					<ul class="list-unstyled text-small">
						<li class="mb-1"><a
							class="link-secondary text-decoration-none" href="Home.jsp">Home</a></li>
					</ul>
				</div>
				<div class="col-6 col-md">
					<h5>About</h5>
					<ul class="list-unstyled text-small">
						<li class="mb-1"><a
							class="link-secondary text-decoration-none"
							href="https://github.com/thisisishara/GadgetBadget">GadgetBadget
								Web Services</a></li>
						<li class="mb-1"><a
							class="link-secondary text-decoration-none" href="#">Developer(s)</a></li>
						<li class="mb-1"></li>
					</ul>
				</div>
				<div class="col-6 col-md">
					<h5>Social</h5>
					<ul class="list-unstyled text-small">
						<li class="mb-1"><a
							class="link-secondary text-decoration-none"
							href="https://github.com/thisisishara/">More Projects</a></li>
						<li class="mb-1"><a
							class="link-secondary text-decoration-none"
							href="https://linkedin.com/in/isharadissanayake/">Contact Us</a></li>
					</ul>
				</div>
			</div>
		</footer>
	</div>
	<!-- BOOTSRAP JS CDN-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
		crossorigin="anonymous"></script>
</body>
</html>