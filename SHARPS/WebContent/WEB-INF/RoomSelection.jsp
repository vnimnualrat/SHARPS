<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Bootstrap Core CSS -->
<link
	href="bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="bootstrap/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="bootstrap/dist/css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="bootstrap/bower_components/morrisjs/morris.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="bootstrap/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewpoint" content="width = device-width, initial-scale = 1">

<title>SHaRPS MultiRoom Selection</title>
<style>
h1 {
	margin-bottom: 0em;
	margin-top: 10px;
	padding-left: 15px;
	font-size: 50px;
	text-transform: uppercase;
	letter-spacing: 3px;
	color: black;
}

.splash {
	height: 25em;
	padding-top: 9em;
	margin-bottom: 2em;
	background-image: url("mainpage.jpg");
	background-size: cover;
	color: #fff;
	text-align: center;
}

body {
	background-color: white;
}
</style>

</head>
<body>

	<div class="splash">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h1>
						<strong><u>SHaRPS MultiRoom</u></strong>
					</h1>

				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-6 col-lg-offset-3">
		<div>
			<div class="panel panel-red">
				<h2 class="text-center">Welcome ${user.firstName}!</h2>
			</div>

		</div>
		<div>
			<div class="panel panel-red">
				<div class="panel-heading text-center">
					<h4>PLEASE SELECT THE ROOM YOU ARE CURRENTLY IN</h4>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table">
							<tr class="text-center">
								<td><a href="LivingRoomMain?id=${user.id}"> <img
										src="livingroom.jpg" height="200" width="250" /></a></td>
								<td><a href="BedRoomMain?id=${user.id}"> <img
										src="bedroom.jpeg" height="200" width="250" /></a></td>
								<td><a href="BathRoomMain?id=${user.id}"> <img
										src="bathroom.jpg" height="200" width="250" /></a></td>
							</tr>
							<tr class="text-center">
								<td>Living Room</td>
								<td>Bedroom</td>
								<td>Bathroom</td>
							</tr>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>

	</div>

	<div class="col-lg-4 col-lg-offset-4">
		<a href="Members?id=${sessionScope.id }">
			<button type="button" class="btn btn-success btn-lg btn-block">Main
				Menu</button>
		</a>
	</div>

	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="bootstrap/bower_components/raphael/raphael-min.js"></script>
	<script src="bootstrap/bower_components/morrisjs/morris.min.js"></script>
	<script src="bootstrap/js/morris-data.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="bootstrap/dist/js/sb-admin-2.js"></script>


</body>
</html>