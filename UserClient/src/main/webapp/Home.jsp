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

<title>GadgetBadget &#8226 Sign In</title>
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/Home.js"></script>
<script src="Components/js.cookie.min.js"></script>
</head>
<body class="text-dark">
	<div class="container pt-3 font-light main-container">
		<header
			class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom">
			<a href="#"
				class="d-flex align-items-center text-dark text-decoration-none main">
				<img class="mx-2" src="Media/wave.png" alt="" width="40" height="40">
				<span class="fs-4">GadgetBadget</span>
			</a>

			<nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto ">
				<a class="me-3 py-2 text-dark text-decoration-none"
					href="SignUp.jsp">Sign Up</a>
			</nav>
		</header>
		<main class="mb-0 pb-0">
			<div class="container col-xl-10 col-xxl-8 px-4 py-5 main">
				<div class="row align-items-center g-5 py-5">
					<div class="col-lg-7 text-center text-lg-start" id="hero">
						<h1 class="display-4 fw-bold lh-1 mb-3">Hey, there!</h1>
						<p class="col-lg-10 fs-4">Glad to see an innovative mind. go
							ahead and get signed in to get started. If you don't own a
							GadgetBadget account yet, why wait? smash that sign up button to
							get registered today.</p>
					</div>
					<div class="col-10 mx-auto col-lg-5">
						<form id="loginform" name="loginform"
							class="p-2 border rounded-3 bg-light">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="username"
									name="username" placeholder="Username"> <label
									for="floatingInput">Username</label>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="Password"> <label
									for="floatingPassword">Password</label>
							</div>
							<button
								class="btn btn-dark btn-lg px-4 me-sm-3 fw-bold text-white w-100"
								type="button" id="signin" name="signin">Sign In</button>
							<hr class="my-2">
							<small class="text-muted">Please contact the
								Administrator if there are login-related issues.</small>
						</form>
					</div>
				</div>
				<div class="row align-items-center g-5 py-5" id="alertbox">
					<div class="alert alert-secondary" role="alert">
						<h4 class="alert-heading" id="alertheading">Alert!</h4>
						<p id="alertcontent">Alert content.</p>
						<!-- <hr >
						<p class="mb-0" id="alertbody2"> Alert Footer.</p>-->
					</div>
				</div>
			</div>
		</main>
		<footer class="pt-2 my-md-5 pt-md-5 border-top">
			<div class="row">
				<div class="col-12 col-md">
					<small class="d-block mb-3 text-muted">&copy; 2021
						GadgetBadget.</small>
				</div>
				<div class="col-6 col-md">
					<h5>Sign Up</h5>
					<ul class="list-unstyled text-small">
						<li class="mb-1"><a
							class="link-secondary text-decoration-none" href="SignUp.jsp">Create
								an account</a></li>
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