<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>SHaRPS Bathroom</title>
<style>
body {
	background-color: white;
}
</style>
</head>
<body>

	<div class="col-lg-6 col-lg-offset-3">
		<div>
			<div>

				<div class="panel-body">
					<div class="panel panel-red">
						<img src="
						bathroomsmall.jpg"
							style="height: 100%; width: 100%; object-fit: contain" />
					</div>
					<div>
						<div class="table-responsive panel panel-red">
							<table class="table table-striped">
								<tr>
									<td colspan="2" class="text-center panel-heading panel-red"><h3>
											${user.firstName}'s Bathroom Settings</h3></td>
								</tr>
								<tr>
									<td class="text-center">Light Intensity</td>
									<td class="text-left">${bathr.lightIntensity}</td>
								</tr>
								<tr>
									<td class="text-center">Room Temperature</td>
									<td class="text-left">${bathr.roomTemperature}&deg;F</td>
								</tr>
								<tr>
									<td class="text-center">Shower Water Temperature</td>
									<td class="text-left">${bathr.waterTemperature}&deg;F</td>
								</tr>
								<tr>
									<td class="text-center">Radio Power</td>
									<c:choose>
										<c:when test="${bathr.radioPower == 'Off'}">
											<td class="text-left text-danger">${bathr.radioPower}</td>
										</c:when>
										<c:otherwise>
											<td class="text-left text-success">${bathr.radioPower}</td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<td class="text-center">Radio Volume</td>
									<td class="text-left">${bathr.radioVolume}</td>
								</tr>

							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="panel-body">

			<a href="RoomSelection?id=${user.id }">
				<button type="submit" class="pull-left btn btn-danger">Room
					Selection</button>
			</a> <a href="BathRoomEdit?id=${user.id }">
				<button class="pull-right btn btn-danger">Adjust Settings</button>
			</a>

		</div>


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