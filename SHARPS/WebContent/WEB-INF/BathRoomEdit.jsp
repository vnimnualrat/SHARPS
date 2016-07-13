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
<title>Bathroom Edit Settings</title>
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
							<form action="BathRoomEdit" method="post">
								<table class="table table-striped">
									<tr>
										<td colspan="2" class="text-center panel-heading panel-red"><h3>
												${user.firstName}'s Bathroom Settings</h3></td>
									</tr>
									<tr>
										<td class="text-left">Light Intensity</td>
										<td><input name="lightIntensity" class="slider-width"
											type="range" value="${bathr.lightIntensity}" min="0"
											max="100" step="5" /></td>
									</tr>
									<tr>
										<td class="text-left">Room Temperature</td>
										<td><input name="roomTemperature" class="slider-width"
											type="range" value="${bathr.roomTemperature}" min="50"
											max="90" step="5" /></td>
									</tr>
									<tr>
										<td class="text-left">Water Temperature</td>
										<td><input name="waterTemperature" class="slider-width"
											type="range" value="${bathr.waterTemperature}" min="75"
											max="125" step="5" /></td>
									</tr>
									<tr>
										<td class="text-left">Radio Power</td>
										<td><label class="radio-inline"> <c:choose>
													<c:when test="${bathr.radioPower == 'Off'}">
														<input id="off" type="radio" checked="" value="Off"
															name="radioPower"></input>
													</c:when>
													<c:otherwise>
														<input id="off" type="radio" value="Off" name="radioPower"></input>
													</c:otherwise>
												</c:choose> Off
										</label> <label class="radio-inline"> <c:choose>
													<c:when test="${bathr.radioPower == 'On'}">
														<input id="on" type="radio" checked="" value="On"
															name="radioPower"></input>
													</c:when>
													<c:otherwise>
														<input id="on" type="radio" value="On" name="radioPower"></input>
													</c:otherwise>
												</c:choose> On
										</label></td>
									</tr>
									<tr>
										<td class="text-left">Radio Volume</td>
										<td><input name="radioVolume" class="slider-width"
											type="range" value="${bathr.radioVolume}" min="0" max="100"
											step="5" /><input name="id" type="hidden" value="${user.id}" /></td>

									</tr>
									<tr>
										<td colspan="2" class="text-center"><input
											class="btn btn-danger" type="submit" name="save" value="Save"></td>
									</tr>

								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="panel-body">

			<a href="BathRoomMain?id=${user.id}">
				<button class="pull-right btn btn-danger">Cancel</button>
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