
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<!-- Navbar Brand-->
	<a class="navbar-brand ps-3" href="index.html">Infinity Learn</a>
	<!-- Sidebar Toggle-->
	<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
		id="sidebarToggle" href="#!">
		<i class="bi bi-list h4"></i>
	</button>
	<ul class="ms-auto navbar-nav ms-auto  me-3 me-lg-4">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
			aria-expanded="false"><i class="bi bi-person-circle h3"></i></a>
			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="navbarDropdown">
				<li><a class="dropdown-item" href="#!">Profile</a></li>
				<li><a class="dropdown-item" href="#!">Settings</a></li>
				<li>
					<hr class="dropdown-divider" />
				</li>
				<li><a class="dropdown-item" href="#!">Logout</a></li>
			</ul></li>
	</ul>
</nav>
<div id="layoutSidenav">
	<div id="layoutSidenav_nav">
		<nav class="sb-sidenav accordion sb-sidenav-dark"
			id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">
					<div class="sb-sidenav-menu-heading">Menu</div>
					<a class="nav-link active" href="#">
						<div class="sb-nav-link-icon">
							<i class="bi bi-columns-gap"></i>
						</div> Dashboard
					</a> <a class="nav-link" href="/teacher/courses/list.html">
						<div class="sb-nav-link-icon">
							<i class="bi bi-folder"></i>
						</div> Courses
					</a> <a class="nav-link" href="/teacher/students/list.html">
						<div class="sb-nav-link-icon">
							<i class="bi bi-people"></i>
						</div> Students
					</a> <a class="nav-link" href="/teacher/messages/list.html">
						<div class="sb-nav-link-icon">
							<i class="bi bi-chat-left-dots"></i></i>
						</div> Messages
					</a> <a class="nav-link" href="/teacher/notifications/list.html">
						<div class="sb-nav-link-icon">
							<i class="bi bi-bell"></i>
						</div> Notifications
					</a>
				</div>
			</div>
			<div class="sb-sidenav-footer">
				<div class="small">Logged in as:</div>
				Phyoe Zaw Aung
			</div>
		</nav>
	</div>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<div class="container">
					<!-- Write your content here -->
					<h1 class="mt-4">Dashboard</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
					<form class="row mb-4 justify-content-end">
						<div class="col-3">
							<select id="inputState" class="form-select">
								<option selected>2023</option>
								<option>2024</option>
								<option>2025</option>
							</select>
						</div>
					</form>
					<div class="row">
						<div class="col-xl-4 col-md-6">
							<div class="card mb-4">
								<div class="card-header">Students</div>
								<div class="card-body">

									<div class="row">
										<div class="col-8">Total</div>
										<div class="col-4 text-end">2000</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-8">Certified</div>
										<div class="col-4 text-end">500</div>
									</div>
									<hr>
								</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small stretched-link" href="#">View Details</a>
									<div class="small">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-8 col-md-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-area me-1"></i> Students Per Month
								</div>
								<div class="card-body">
									<canvas id="student-chart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-md-6">
							<div class="card mb-4">
								<div class="card-header">Courses</div>
								<div class="card-body">

									<div class="row">
										<div class="col-8">Total</div>
										<div class="col-4 text-end">20</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-8">Reviewed</div>
										<div class="col-4 text-end">5</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-8">Under Reviewed</div>
										<div class="col-4 text-end">5</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-8">Draft</div>
										<div class="col-4 text-end">10</div>
									</div>
								</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small stretched-link" href="#">View Details</a>
									<div class="small">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-8 col-md-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-area me-1"></i> Courses Per Month
								</div>
								<div class="card-body">
									<canvas id="course-chart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</main>