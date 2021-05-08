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

<title>GadgetBadget &#8226; Admin Dashboard</title>
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/UserClient.js"></script>
<script src="Components/js.cookie.min.js"></script>
</head>
<body class="text-dark">
	<!-- MAIN HEADER -->
	<header
		class="navbar sticky-top bg-dark flex-md-nowrap p-0 shadow dashboard-header disable-select">
		<a href="#"
			class="d-flex align-items-center text-dark text-decoration-none main">
			<img class="mx-2" src="Media/wave.png" alt="" width="40" height="40">
			<span class="fs-4 text-white">GadgetBadget</span>
		</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<ul class="navbar-nav px-3 list-group list-group-horizontal">
			<li class="nav-item text-nowrap my-auto"><a
				class="nav-link text-white" href="Home.jsp">Sign out</a></li>
		</ul>
	</header>
	<!-- VERTICAL SIDEBAR -->
	<nav id="sidebarMenu"
		class="col-md-3 col-lg-2 d-md-block bg-dark text-white sidebar collapse disable-select">
		<div class="position-sticky pt-3">
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page"> <img
						src="Media/coordinate_system_white.png" width="20px" class="mx-2" />
						<span class="admindashboardlink">Dashboard</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"> <img
						src="Media/user_white.png" width="20px" class="mx-2" /> <span
						class="admindashboardlink">User Management</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"> <img
						src="Media/login_white.png" width="20px" class="mx-2" /> <span
						class="admindashboardlink">Account Security</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"> <img
						src="Media/gear_white.png" width="20px" class="mx-2" /> <span
						class="admindashboardlink">Profile Settings</span>
				</a></li>
			</ul>
		</div>
	</nav>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div class="container-fluid">
			<div class="row sidebarpage" id="admindashboard">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Dashboard</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group me-2">
							<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
						</div>
						<button type="button"
							class="btn btn-sm btn-outline-secondary dropdown-toggle">
							<span data-feather="calendar"></span> This week
						</button>
					</div>
				</div>
			</div>
			<div class="row sidebarpage" id="adminusermgmt">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">User Management</h1>
				</div>
				
				<!-- USER TYPE SELECTION ACCORDIAN -->
				<div class="accordion" id="accordionUserTypeSelect">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingResearchers">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseResearches"
								aria-expanded="true" aria-controls="collapseResearches">
								Researchers</button>
						</h2>
						<div id="collapseResearches" class="accordion-collapse collapse show"
							aria-labelledby="headingResearchers" data-bs-parent="#accordionUserTypeSelect">
							<div class="accordion-body">
								<strong>This is the first item's accordion body.</strong> It is
								shown by default, until the collapse plugin adds the appropriate
								classes that we use to style each element. These classes control
								the overall appearance, as well as the showing and hiding via
								CSS transitions. You can modify any of this with custom CSS or
								overriding our default variables. It's also worth noting that
								just about any HTML can go within the
								<code>.accordion-body</code>
								, though the transition does limit overflow.
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingFunders">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseFunders"
								aria-expanded="false" aria-controls="collapseFunders">
								Funders</button>
						</h2>
						<div id="collapseFunders" class="accordion-collapse collapse"
							aria-labelledby="headingFunders" data-bs-parent="#accordionUserTypeSelect">
							<div class="accordion-body">
								<strong>This is the second item's accordion body.</strong> It is
								hidden by default, until the collapse plugin adds the
								appropriate classes that we use to style each element. These
								classes control the overall appearance, as well as the showing
								and hiding via CSS transitions. You can modify any of this with
								custom CSS or overriding our default variables. It's also worth
								noting that just about any HTML can go within the
								<code>.accordion-body</code>
								, though the transition does limit overflow.
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingConsumers">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseConsumers"
								aria-expanded="false" aria-controls="collapseConsumers">
								Consumers</button>
						</h2>
						<div id="collapseConsumers" class="accordion-collapse collapse"
							aria-labelledby="headingConsumers" data-bs-parent="#accordionUserTypeSelect">
							<div class="accordion-body">
								<strong>This is the third item's accordion body.</strong> It is
								hidden by default, until the collapse plugin adds the
								appropriate classes that we use to style each element. These
								classes control the overall appearance, as well as the showing
								and hiding via CSS transitions. You can modify any of this with
								custom CSS or overriding our default variables. It's also worth
								noting that just about any HTML can go within the
								<code>.accordion-body</code>
								, though the transition does limit overflow.
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header border-top" id="headingEmployees">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseEmployees"
								aria-expanded="false" aria-controls="collapseEmployees">
								Employees</button>
						</h2>
						<div id="collapseEmployees" class="accordion-collapse collapse"
							aria-labelledby="headingEmployees" data-bs-parent="#accordionUserTypeSelect">
							<div class="accordion-body">
								<strong>This is the third item's accordion body.</strong> 4
								<code>.accordion-body</code>
								, though the transition does limit overflow.
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--  
			<div class="row sidebarpage" id="adminusermgmt">
				<h2>Section title</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>#</th>
								<th>Header</th>
								<th>Header</th>
								<th>Header</th>
								<th>Header</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1,001</td>
								<td>random</td>
								<td>data</td>
								<td>placeholder</td>
								<td>text</td>
							</tr>
							<tr>
								<td>1,002</td>
								<td>placeholder</td>
								<td>irrelevant</td>
								<td>visual</td>
								<td>layout</td>
							</tr>
							<tr>
								<td>1,003</td>
								<td>data</td>
								<td>rich</td>
								<td>dashboard</td>
								<td>tabular</td>
							</tr>
							<tr>
								<td>1,003</td>
								<td>information</td>
								<td>placeholder</td>
								<td>illustrative</td>
								<td>data</td>
							</tr>
							<tr>
								<td>1,004</td>
								<td>text</td>
								<td>random</td>
								<td>layout</td>
								<td>dashboard</td>
							</tr>
							<tr>
								<td>1,005</td>
								<td>dashboard</td>
								<td>irrelevant</td>
								<td>text</td>
								<td>placeholder</td>
							</tr>
							<tr>
								<td>1,006</td>
								<td>dashboard</td>
								<td>illustrative</td>
								<td>rich</td>
								<td>data</td>
							</tr>
							<tr>
								<td>1,007</td>
								<td>placeholder</td>
								<td>tabular</td>
								<td>information</td>
								<td>irrelevant</td>
							</tr>
							<tr>
								<td>1,008</td>
								<td>random</td>
								<td>data</td>
								<td>placeholder</td>
								<td>text</td>
							</tr>
							<tr>
								<td>1,009</td>
								<td>placeholder</td>
								<td>irrelevant</td>
								<td>visual</td>
								<td>layout</td>
							</tr>
							<tr>
								<td>1,010</td>
								<td>data</td>
								<td>rich</td>
								<td>dashboard</td>
								<td>tabular</td>
							</tr>
							<tr>
								<td>1,011</td>
								<td>information</td>
								<td>placeholder</td>
								<td>illustrative</td>
								<td>data</td>
							</tr>
							<tr>
								<td>1,012</td>
								<td>text</td>
								<td>placeholder</td>
								<td>layout</td>
								<td>dashboard</td>
							</tr>
							<tr>
								<td>1,013</td>
								<td>dashboard</td>
								<td>irrelevant</td>
								<td>text</td>
								<td>visual</td>
							</tr>
							<tr>
								<td>1,014</td>
								<td>dashboard</td>
								<td>illustrative</td>
								<td>rich</td>
								<td>data</td>
							</tr>
							<tr>
								<td>1,015</td>
								<td>random</td>
								<td>tabular</td>
								<td>information</td>
								<td>text</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			-->
			<div class="row sidebarpage" id="adminaccsec">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Account Security</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group me-2">
							<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
						</div>
						<button type="button"
							class="btn btn-sm btn-outline-secondary dropdown-toggle">
							<span data-feather="calendar"></span> This week
						</button>
					</div>
				</div>
			</div>
			<div class="row sidebarpage" id="adminprofsett">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Profile Settings</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group me-2">
							<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
						</div>
						<button type="button"
							class="btn btn-sm btn-outline-secondary dropdown-toggle">
							<span data-feather="calendar"></span> This week
						</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- BOOTSRAP JS CDN-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
		crossorigin="anonymous"></script>
</body>
</html>