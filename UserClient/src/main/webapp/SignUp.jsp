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

<title>GadgetBadget &#8226 Sign Up</title>
<!-- <script src="Components/jquery-3.2.1.min.js"></script> -->
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/SignUp.js"></script>
</head>
<body class="text-dark">
	<div class="container py-3 font-light">
		<header
			class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom">
			<a href="#"
				class="d-flex align-items-center text-dark text-decoration-none main">
				<img class="mx-2" src="Media/wave.png" alt="" width="40" height="40">
				<span class="fs-4">GadgetBadget</span>
			</a>
			<nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto ">
				<a class="me-3 py-2 text-dark text-decoration-none" href="Home.jsp">Home</a>
			</nav>
		</header>
		<main class="mb-0 pb-0">
			<div class="row align-items-center g-5 py-5" id="alertbox">
				<div class="alert alert-secondary" role="alert">
					<h4 class="alert-heading">Alert Box.</h4>
					<p>Alert content.</p>
					<hr>
					<p class="mb-0">Alert more info.</p>
				</div>
			</div>
			<div class="container col-xl-10 col-xxl-8 px-4 py-0 main">
				<div class="col-md-6 mb-5">
					<h3 class="mb-2" id="mainheading">Let us know who you are</h3>
				</div>
				<!-- user type selection -->
				<div class="col-md-4 mb-5">
					<label for="user" class="form-label">I am a</label> <select
						id="user" class="form-select user">
						<option selected>Select</option>
						<option>Funder</option>
						<option>Researcher</option>
						<option>Consumer</option>
					</select>
				</div>

				<!-- CUNSUMER TYPE SIGNUP -->
				<form class="row g-3" id="consumerform" name="consumerform">
					<div class="col-12 input-group">
						<span class="input-group-text" id="consumerun-span">@</span> <input
							type="text" class="form-control" placeholder="Username"
							aria-label="Username" aria-describedby="consumerun-span"
							id="consumerusername">
					</div>
					<div class="col-md-6">
						<input type="email" class="form-control" id="consumeremail"
							placeholder="Email">
					</div>
					<div class="col-md-6">
						<input type="password" class="form-control" id="consumerpassword"
							placeholder="Password">
					</div>
					<div class="col-12">
						<div class="input-group">
							<span class="input-group-text">First and last name</span> <input
								type="text" aria-label="First name" class="form-control">
							<input type="text" aria-label="Last name" class="form-control">
						</div>
					</div>
					<div class="col-md-4">
						<select id="consumergender" class="form-select">
							<option selected>Select</option>
							<option>Female</option>
							<option>Male</option>
							<option>Other</option>
						</select>
					</div>
					<div class="col-12">
						<button type="button" class="btn btn-dark" id="consumersignup" value="Sign Up">Create an Account</button>
					</div>
				</form>

				<!-- RESEARCHER TYPE SIGNUP -->
				<form class="row g-3" id="researcherform" name="researcherform">
					<div class="col-md-6">
						<label for="inputEmail4" class="form-label">Email</label> <input
							type="email" class="form-control" id="inputEmail4">
					</div>
					<div class="col-md-6">
						<label for="inputPassword4" class="form-label">Password</label> <input
							type="password" class="form-control" id="inputPassword4">
					</div>
					<div class="col-12">
						<label for="inputAddress" class="form-label">Address</label> <input
							type="text" class="form-control" id="inputAddress"
							placeholder="1234 Main St">
					</div>
					<div class="col-12">
						<label for="inputAddress2" class="form-label">Address 2</label> <input
							type="text" class="form-control" id="inputAddress2"
							placeholder="Apartment, studio, or floor">
					</div>
					<div class="col-md-6">
						<label for="inputCity" class="form-label">City</label> <input
							type="text" class="form-control" id="inputCity">
					</div>
					<div class="col-md-4">
						<label for="inputState" class="form-label">State</label> <select
							id="inputState" class="form-select">
							<option selected>Choose...</option>
							<option>...</option>
						</select>
					</div>
					<div class="col-md-2">
						<label for="inputZip" class="form-label">Zip</label> <input
							type="text" class="form-control" id="inputZip">
					</div>
					<div class="col-12">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="gridCheck">
							<label class="form-check-label" for="gridCheck"> Check me
								out </label>
						</div>
					</div>
					<div class="col-12">
						<button type="submit" class="btn btn-primary">Sign in</button>
					</div>
				</form>

				<!-- FUNDER TYPE SIGNUP -->
				<form class="row g-3" id="funderform" name="funderform">
					<div class="col-md-6">
						<label for="inputEmail4" class="form-label">Email</label> <input
							type="email" class="form-control" id="inputEmail4">
					</div>
					<div class="col-md-6">
						<label for="inputPassword4" class="form-label">Password</label> <input
							type="password" class="form-control" id="inputPassword4">
					</div>
					<div class="col-12">
						<label for="inputAddress" class="form-label">Address</label> <input
							type="text" class="form-control" id="inputAddress"
							placeholder="1234 Main St">
					</div>
					<div class="col-12">
						<label for="inputAddress2" class="form-label">Address 2</label> <input
							type="text" class="form-control" id="inputAddress2"
							placeholder="Apartment, studio, or floor">
					</div>
					<div class="col-md-6">
						<label for="inputCity" class="form-label">City</label> <input
							type="text" class="form-control" id="inputCity">
					</div>
					<div class="col-md-4">
						<label for="inputState" class="form-label">State</label> <select
							id="inputState" class="form-select">
							<option selected>Choose...</option>
							<option>...</option>
						</select>
					</div>
					<div class="col-md-2">
						<label for="inputZip" class="form-label">Zip</label> <input
							type="text" class="form-control" id="inputZip">
					</div>
					<div class="col-12">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="gridCheck">
							<label class="form-check-label" for="gridCheck"> Check me
								out </label>
						</div>
					</div>
					<div class="col-12">
						<button type="submit" class="btn btn-primary">Sign in</button>
					</div>
				</form>
			</div>
		</main>
		<footer class="pt-2 my-md-5 pt-md-5 border-top">
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
</body>
</html>