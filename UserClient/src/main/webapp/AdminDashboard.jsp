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
<link rel="icon" href="Media/phywhite.png" sizes="32x32"
	type="image/png">

<title>GadgetBadget &#8226; Admin Dashboard</title>
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/UserClient.js"></script>
<script src="Components/js.cookie.min.js"></script>
</head>
<body class="text-dark">
	<!-- MAIN HEADER -->
	<header
		class="navbar sticky-top bg-dark flex-md-nowrap p-0 shadow dashboard-header disable-select"
		style="z-index: 101">
		<a href="#"
			class="d-flex align-items-center text-dark text-decoration-none main">
			<img class="mx-2 my-2" src="Media/phywhite.png" alt="" width="40"
			height="40"> <span class="fs-4 text-white">GadgetBadget</span>
		</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<ul class="navbar-nav px-3 list-group list-group-horizontal">
			<li class="nav-item text-nowrap my-auto"><a
				class="nav-link text-white" href="Home.jsp"><button
						type="button" class="btn btn-outline-info btn-sm me-sm-3">Sign
						out</button></a></li>
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
				<div class="accordion mb-3" id="accordionUserTypeSelect">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingResearchers">
							<button class="accordion-button bg-dark text-light" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseResearches"
								aria-expanded="true" aria-controls="collapseResearches">
								Researchers</button>
						</h2>
						<div id="collapseResearches"
							class="accordion-collapse collapse show"
							aria-labelledby="headingResearchers"
							data-bs-parent="#accordionUserTypeSelect">
							<div class="accordion-body">
								<div class="mb-3">
									<strong>Manage Researchers</strong> <br>Create new
									researcher-type user accounts, Update or Delete existing user
									accounts of researchers who have already signed up.
								</div>
								<!-- RESEARCHER TYPE SIGNUP -->
								<form class="row g-3" id="researcherform" name="researcherform">
									<input type="hidden" class="researcherisupdate"
										name="researcherisupdate" id="researcherisupdate"
										value="false"> <input type="hidden" class="formtask"
										name="formtask" value="USERS"> <input type="hidden"
										class="usertype" id="usertype" name="usertype"
										value="Researcher">
									<div class="col-12 input-group" id="researcherusernamegroup">
										<span class="input-group-text disable-select"
											id="researcherun-span">@</span> <input type="text"
											class="form-control" placeholder="Username"
											aria-label="Username" aria-describedby="researcherun-span"
											id="researcherusername" name="researcherusername"
											autocomplete="false">
									</div>
									<div class="col-md-5">
										<input type="email" class="form-control" id="researcheremail"
											name="researcheremail" placeholder="Email">
									</div>
									<div class="col-md-3" id="researcherpasswordgroup">
										<input type="password" class="form-control"
											id="researcherpassword" name="researcherpassword"
											placeholder="Password">
									</div>
									<div class="col-md-3" id="researcherconfpasswordgroup">
										<input type="password" class="form-control"
											id="researcherconfpassword" name="researcherconfpassword"
											placeholder="Confirm Password">
									</div>
									<div class="col-md-1" id="researcherconfpasswordcb">
										<input type="checkbox" class="btn-check btn-block w-100"
											id="researchershowpasswords" autocomplete="off"> <label
											class="btn btn-danger" for="researchershowpasswords"><span><img
												id="researchershowpasswordicon" src="Media/eye.png"
												alt="..." /></span></label>
									</div>
									<div class="col-12">
										<div class="input-group">
											<span class="input-group-text disable-select">First
												and last name</span> <input type="text" aria-label="First name"
												class="form-control" id="researcherfirstname"
												name="researcherfirstname" placeholder="First Name">
											<input type="text" aria-label="Last name"
												class="form-control" id="researchersecondname"
												name="researchersecondname" placeholder="Second Name">
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
											<input type="text" class="form-control"
												id="researcherinstitute" name="researcherinstitute"
												placeholder="Institution">
										</div>
									</div>
									<div class="col-md-8">
										<div class="col-12">
											<select id="researcherfos" name="researcherfos"
												class="form-select">
												<option selected>Field of Study</option>
												<option>Information Security</option>
												<option>Artificial Intelligence and Machine
													Learning</option>
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
										<button type="button" class="btn btn-primary"
											id="researchersignup" name="researchersignup">Create
											Account</button>
										<button type="button" class="btn btn-secondary invisible"
											id="researchercancelupdate" name="researchercancelupdate">Cancel</button>
									</div>
								</form>
								<div class="mt-5">
									<strong>Existing Accounts of Researchers</strong> <br>Following
									is a list of all researchers who have already signed up with
									GadgetBadget.
								</div>
								<div class="researcherAccountsGrid" id="researcherAccountsGrid">
									<!-- DYNAMICALLY GENERATED RESEARCHER ACCOUNT LIST TABLE -->
								</div>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header border-top" id="headingFunders">
							<button class="accordion-button collapsed bg-dark text-light"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseFunders" aria-expanded="false"
								aria-controls="collapseFunders">Funders</button>
						</h2>
						<div id="collapseFunders" class="accordion-collapse collapse"
							aria-labelledby="headingFunders"
							data-bs-parent="#accordionUserTypeSelect">
							<div class="accordion-body">
								<div class="mb-3">
									<strong>Manage Funders</strong> <br>Create new funder-type
									user accounts, Update or Delete existing user accounts of
									funders who have already signed up.
								</div>
								<!-- FUNDER TYPE SIGNUP -->
								<form class="row g-3 " id="funderform" name="funderform">
									<input type="hidden" class="funderisupdate"
										name="funderisupdate" id="funderisupdate" value="false">
									<input type="hidden" class="formtask" name="formtask"
										value="USERS"> <input type="hidden" class="usertype"
										id="usertype" name="usertype" value="Funder">
									<div class="col-12 input-group" id="funderusernamegroup">
										<span class="input-group-text disable-select"
											id="funderun-span">@</span> <input type="text"
											class="form-control" placeholder="Username"
											aria-label="Username" aria-describedby="funderun-span"
											id="funderusername" name="funderusername">
									</div>
									<div class="col-md-5">
										<input type="email" class="form-control" id="funderemail"
											name="funderemail" placeholder="Email">
									</div>
									<div class="col-md-3" id="funderpasswordgroup">
										<input type="password" class="form-control"
											id="funderpassword" name="funderpassword"
											placeholder="Password">
									</div>
									<div class="col-md-3" id="funderconfpasswordgroup">
										<input type="password" class="form-control"
											id="funderconfpassword" name="funderconfpassword"
											placeholder="Confirm Password">
									</div>
									<div class="col-md-1" id="funderconfpasswordcb">
										<input type="checkbox" class="btn-check btn-block w-100"
											id="fundershowpasswords" autocomplete="off"> <label
											class="btn btn-danger" for="fundershowpasswords"><span><img
												id="fundershowpasswordicon" src="Media/eye.png" alt="..." /></span></label>
									</div>
									<div class="col-12">
										<div class="input-group">
											<span class="input-group-text disable-select">First
												and last name</span> <input type="text" aria-label="First name"
												class="form-control" id="funderfirstname"
												name="funderfirstname"> <input type="text"
												aria-label="Last name" class="form-control"
												id="fundersecondname" name="fundersecondname">
										</div>
									</div>
									<div class="col-md-4">
										<select id="fundergender" name="fundergender"
											class="form-select">
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
										<button type="button" class="btn btn-primary"
											id="fundersignup" name="fundersignup">Create Account</button>
										<button type="button" class="btn btn-secondary invisible"
											id="fundercancelupdate" name="fundercancelupdate">Cancel</button>
									</div>
								</form>
								<div class="mt-5">
									<strong>Existing Accounts of Funders</strong> <br>Following
									is a list of all funders who have already signed up with
									GadgetBadget.
								</div>
								<div class="funderAccountsGrid" id="funderAccountsGrid">
									<!-- DYNAMICALLY GENERATED RESEARCHER ACCOUNT LIST TABLE -->
								</div>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header border-top" id="headingConsumers">
							<button class="accordion-button collapsed bg-dark text-light"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseConsumers" aria-expanded="false"
								aria-controls="collapseConsumers">Consumers</button>
						</h2>
						<div id="collapseConsumers" class="accordion-collapse collapse"
							aria-labelledby="headingConsumers"
							data-bs-parent="#accordionUserTypeSelect">
							<div class="accordion-body">
								<div class="mb-3">
									<strong>Manage Consumers</strong> <br>Create new
									consumer-type user accounts, Update or Delete existing user
									accounts of consumers who have already signed up.
								</div>
								<!-- CUNSUMER TYPE SIGNUP -->
								<form class="row g-3" id="consumerform" name="consumerform">
									<input type="hidden" class="consumerisupdate"
										name="consumerisupdate" id="consumerisupdate" value="false">
									<input type="hidden" class="formtask" name="formtask"
										value="USERS"> <input type="hidden" class="usertype"
										id="usertype" name="usertype" value="Consumer">
									<div class="col-12 input-group" id="consumerusernamegroup">
										<span class="input-group-text disable-select"
											id="consumerun-span">@</span> <input type="text"
											class="form-control" placeholder="Username"
											aria-label="Username" aria-describedby="consumerun-span"
											id="consumerusername" name="consumerusername">
									</div>
									<div class="col-md-5">
										<input type="email" class="form-control" id="consumeremail"
											name="consumeremail" placeholder="Email">
									</div>
									<div class="col-md-3" id="consumerpasswordgroup">
										<input type="password" class="form-control"
											id="consumerpassword" name="consumerpassword"
											placeholder="Password">
									</div>
									<div class="col-md-3" id="consumerconfpasswordgroup">
										<input type="password" class="form-control"
											id="consumerconfpassword" name="consumerconfpassword"
											placeholder="Confirm Password">
									</div>
									<div class="col-md-1" id="consumerconfpasswordcb">
										<input type="checkbox" class="btn-check btn-block w-100"
											id="consumershowpasswords" autocomplete="off"> <label
											class="btn btn-danger" for="consumershowpasswords"><span><img
												id="consumershowpasswordicon" src="Media/eye.png"
												alt="..." /></span></label>
									</div>
									<div class="col-12">
										<div class="input-group">
											<span class="input-group-text disable-select">First
												and last name</span> <input type="text" aria-label="First name"
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
										<button type="button" class="btn btn-primary"
											id="consumersignup" name="consumersignup">Create
											Account</button>
										<button type="button" class="btn btn-secondary invisible"
											id="consumercancelupdate" name="consumercancelupdate">Cancel</button>
									</div>
								</form>
								<div class="mt-5">
									<strong>Existing Accounts of Consumers</strong> <br>Following
									is a list of all consumers who have already signed up with
									GadgetBadget.
								</div>
								<div class="consumerAccountsGrid" id="consumerAccountsGrid">
									<!-- DYNAMICALLY GENERATED RESEARCHER ACCOUNT LIST TABLE -->
								</div>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header border-top" id="headingEmployees">
							<button class="accordion-button collapsed bg-dark text-light"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseEmployees" aria-expanded="false"
								aria-controls="collapseEmployees">Employees</button>
						</h2>
						<div id="collapseEmployees" class="accordion-collapse collapse"
							aria-labelledby="headingEmployees"
							data-bs-parent="#accordionUserTypeSelect">
							<div class="accordion-body">
								<div class="mb-3">
									<strong>Manage Employees</strong> <br>Create new
									employee-type user accounts, Update or Delete existing user
									accounts of employees who are involved with GadgetBadget
									System.
								</div>
								<!-- EMPLOYEE TYPE SIGNUP -->
								<form class="row g-3 " id="employeeform" name="employeeform">
									<input type="hidden" class="employeeisupdate"
										name="employeeisupdate" id="employeeisupdate" value="false">
									<input type="hidden" class="formtask" name="formtask"
										value="USERS"> <input type="hidden" class="usertype"
										id="usertype" name="usertype" value="Employee">
									<div class="col-12 input-group" id="employeeusernamegroup">
										<span class="input-group-text disable-select"
											id="employeeun-span">@</span> <input type="text"
											class="form-control" placeholder="Username"
											aria-label="Username" aria-describedby="employeeun-span"
											id="employeeusername" name="employeeusername">
									</div>
									<div class="col-md-5">
										<input type="email" class="form-control" id="employeeemail"
											name="employeeemail" placeholder="Email">
									</div>
									<div class="col-md-3" id="employeepasswordgroup">
										<input type="password" class="form-control"
											id="employeepassword" name="employeepassword"
											placeholder="Password">
									</div>
									<div class="col-md-3" id="employeeconfpasswordgroup">
										<input type="password" class="form-control"
											id="employeeconfpassword" name="employeeconfpassword"
											placeholder="Confirm Password">
									</div>
									<div class="col-md-1" id="employeeconfpasswordcb">
										<input type="checkbox" class="btn-check btn-block w-100"
											id="employeeshowpasswords" autocomplete="off"> <label
											class="btn btn-danger" for="employeeshowpasswords"><span><img
												id="employeeshowpasswordicon" src="Media/eye.png"
												alt="..." /></span></label>
									</div>
									<div class="col-12">
										<div class="input-group">
											<span class="input-group-text disable-select">First
												and last name</span> <input type="text" aria-label="First name"
												class="form-control" id="employeefirstname"
												name="employeefirstname"> <input type="text"
												aria-label="Last name" class="form-control"
												id="employeesecondname" name="employeesecondname">
										</div>
									</div>
									<div class="col-md-4">
										<select id="employeegender" name="employeegender"
											class="form-select">
											<option selected>Gender</option>
											<option>Female</option>
											<option>Male</option>
											<option>Other</option>
										</select>
									</div>
									<div class="col-md-4">
										<div class="col-12">
											<input type="text" class="form-control" id="employeephone"
												name="employeephone" placeholder="Phone">
										</div>
									</div>
									<div class="col-md-4">
										<div class="col-12">
											<input type="text" class="form-control" id="employeeeid"
												name="employeeeid" placeholder="GadgetBadget Employee ID">
										</div>
									</div>
									<div class="col-md-4">
										<select id="employeedep" name="employeedep"
											class="form-select">
											<option selected>Department</option>
											<option>IT Department</option>
											<option>HR Department</option>
											<option>Sales &amp; Marketing Department</option>
											<option>Finance Department</option>
											<option>Production and QA Department</option>
										</select>
									</div>
									<div class="col-md-4">
										<div class="col-12">
											<input type="date" class="form-control" id="employeedh"
												name="employeedh" placeholder="Date Hired">
										</div>
									</div>
									<div class="col-md-4" id="employeerolegroup">
										<select id="employeerole" name="employeerole"
											class="form-select">
											<option selected>Role</option>
											<option>Administrator</option>
											<option>Financial Manager</option>
											<option>Employee</option>
										</select>
									</div>
									<div class="col-12">
										<button type="button" class="btn btn-primary"
											id="employeesignup" name="employeesignup">Create
											Account</button>
										<button type="button" class="btn btn-secondary invisible"
											id="employeecancelupdate" name="employeecancelupdate">Cancel</button>
									</div>
								</form>
								<div class="mt-5">
									<strong>Existing Accounts of Employees</strong> <br>Following
									is a list of all employees who are assigned to GadgetBadget
									System.
								</div>
								<div class="employeeAccountsGrid" id="employeeAccountsGrid">
									<!-- DYNAMICALLY GENERATED RESEARCHER ACCOUNT LIST TABLE -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
	<!-- TOAST -->
	<!-- button type="button" class="btn btn-primary" id="liveToastBtn">Show
			live toast</button-->
	<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 102">
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
	<!-- BOOTSRAP JS CDN-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
		crossorigin="anonymous"></script>
</body>
</html>