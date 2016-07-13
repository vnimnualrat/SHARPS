<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/cs496stu02" user="cs496stu02"
	password="32rtalvU" />
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/health.css">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui.js"></script>

<script src="js/jquery.knob.js"></script>
<link href="css/layout.css" rel="stylesheet">

<title>Health</title>

<!-- Bootstrap Core -->
<link
	href="bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">



<script type="text/javascript">
	$(function() {
		$('.dateTxt').datepicker({
			dateFormat : "yy-mm-dd",
			showAnim : "clip",
			minDate : 0
		});
	});
</script>
<script>
	$(function() {
		var dialog, form, emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, name = $("#name"), quantity = $("#quantity"), expiration = $("#expiration"), allFields = $(
				[]).add(name).add(quantity).add(expiration), tips = $(".validateTips");

		function addUser() {
			var valid = true;
			allFields.removeClass("ui-state-error");

			if (valid) {
				$("#colorTable tbody")
						.append(
								"<tr class=\"warning\">" + "<td>" + name.val()
										+ "</td>" + "<td>" + quantity.val()
										+ "</td>" + "<td>" + expiration.val()
										+ "</td>" + "</tr>");
				dialog.dialog("close");
			}
			return valid;
		}

		dialog = $("#dialog-form").dialog({
			autoOpen : false,
			height : 550,
			width : 400,
			modal : true,
			buttons : {
				//"Enter Medication" : addUser,
				Cancel : function() {
					dialog.dialog("close");
				}
			},
			show : {
				effect : "shake",
				duration : 700
			},
			hide : {
				effect : "explode",
				duration : 500
			},
			close : function() {
				form[0].reset();
				allFields.removeClass("ui-state-error");
			}
		});

		form = dialog.find("form").on("submit", function(event) {
			event.preventDefault();
			addUser();
		});
		$("#create-user").button().on("click", function() {
			dialog.dialog("open");
		});
	});
</script>
<script>
	$.plot($("#placeholder"), [ [ [ 0, 0 ], [ 1, 1 ] ] ], {
		yaxis : {
			max : 1
		}
	});
</script>
<link href="css/examples.css" rel="stylesheet" type="text/css">
<script src="js/jquery.flot.js"></script>
<script type="text/javascript">
	$(function() {

		// We use an inline data source in the example, usually data would
		// be fetched from a server
		var data = [], totalPoints = 200;

		function getRandomData() {

			if (data.length > 0)
				data = data.slice(1);
			// Do a random walk
			while (data.length < totalPoints) {

				var prev = data.length > 0 ? data[data.length - 1] : 50, y = prev
						+ Math.random() * 12 - 5;

				if (y < 0) {
					y = 0;
				} else if (y > 100) {
					y = 100;
				}

				data.push(y);
			}

			// Zip the generated y values with the x values

			var res = [];
			for (var i = 0; i < data.length; ++i) {
				res.push([ i, data[i] ])
			}

			return res;
		}

		// Set up the control widget

		var updateInterval = 70;
		$("#updateInterval").val(updateInterval).change(function() {
			var v = $(this).val();
			if (v && !isNaN(+v)) {
				updateInterval = +v;
				if (updateInterval < 1) {
					updateInterval = 1;
				} else if (updateInterval > 2000) {
					updateInterval = 2000;
				}
				$(this).val("" + updateInterval);
			}
		});

		var plot = $.plot("#placeholder", [ getRandomData() ], {
			series : {
				shadowSize : 0
			// Drawing is faster without shadows
			},
			yaxis : {
				min : 60,
				max : 100
			},
			xaxis : {
				show : false
			}
		});

		function update() {
			plot.setData([ getRandomData() ]);
			// Since the axes don't change, we don't need to call plot.setupGrid()
			plot.draw();
			setTimeout(update, updateInterval);
		}
		update();
		// Add the Flot version string to the footer
		$("#footer").prepend("Flot " + $.plot.version + " &ndash; ");
	});
</script>
</head>
<body>

	<div class="splash">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div style="padding-top: 180px; color: black;">
						<h1>
							<strong><u>Health</u></strong>
						</h1>
					</div>

				</div>
			</div>
		</div>
	</div>
	<p>${user.firstName}'s Health Report</p>
	<sql:query dataSource="${db}" var="rx">
		SELECT * FROM medicine WHERE medExpiration >= CURDATE();
	</sql:query>

	<br />
	<br />

	<div id='content'></div>
	<div id="dialog-form" title="Enter New Medication">
		<p class="validateTips"></p>

		<form id='ajaxform' name='ajaxform' action='AddRx' method='post'>
			<fieldset>
				<label for="name">Medication Name:</label> <input type="text"
					name="name" id="name" class="text ui-widget-content ui-corner-all"
					required> <label for="quantity">Quantity:</label> <input
					type="text" name="quantity" id="quantity"
					class="text ui-widget-content ui-corner-all" required> <label
					for="expiration">Expiration Date:</label> <input type="text"
					name="expiration" id="expiration" class="dateTxt" required>
				<br /> <label for="dosage">Dosage:</label> <input type="text"
					name="dosage" id="dosage" required> <br /> <input
					type="submit" value="Submit" />
			</fieldset>
		</form>
		<script type="text/javascript">
			var form = $('#ajaxform');
			form.submit(function() {

				$.ajax({
					type : form.attr('method'),
					url : form.attr('action'),
					data : form.serialize(),

				});

				return false;
			});
		</script>
	</div>
	<br />
	<br />
	<div class="col-lg-6">
		<div class="panel panel-default">
			<div class="panel-heading">Medicine Cabinet</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table id="colorTable" class="table">
						<thead>
							<tr>
								<th>Rx Name</th>
								<th>Quantity</th>
								<th>Expiration</th>
								<th>Dosage</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${rx.rows}">
								<c:if test="${row.medQuantity >= 15}">
									<tr class="success">
								</c:if>
								<c:if test="${row.medQuantity < 15 && row.medQuantity >= 10}">
									<tr class="warning">
								</c:if>
								<c:if test="${row.medQuantity < 10}">
									<tr class="danger">
								</c:if>
								<td><c:out value="${row.medName}" /></td>
								<td><c:out value="${row.medQuantity}" /></td>
								<td><c:out value="${row.medExpiration}" /></td>
								<td><c:out value="${row.medDosage}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button id="create-user">Add Medicine</button>
				</div>
			</div>
		</div>
	</div>


	<div style="padding-left: 110px;" class="col-lg-3">
		<div class="panel panel-info">
			<div class="panel-heading">Steps Taken</div>
			<div class="panel-body">




				<script>
					$(function() {

						$(".knob")
								.knob(
										{
											draw : function() {
												if (this.$.data('skin') == 'tron') {

													var a = this.angle(this.cv) // Angle
													, sa = this.startAngle // Previous start angle
													, sat = this.startAngle // Start angle
													, ea // Previous end angle
													, eat = sat + a // End angle
													, r = true;

													this.g.lineWidth = this.lineWidth;

													this.o.cursor
															&& (sat = eat - 0.3)
															&& (eat = eat + 0.3);

													if (this.o.displayPrevious) {
														ea = this.startAngle
																+ this
																		.angle(this.value);
														this.o.cursor
																&& (sa = ea - 0.3)
																&& (ea = ea + 0.3);
														this.g.beginPath();
														this.g.strokeStyle = this.previousColor;
														this.g
																.arc(
																		this.xy,
																		this.xy,
																		this.radius
																				- this.lineWidth,
																		sa, ea,
																		false);
														this.g.stroke();
													}

													this.g.beginPath();
													this.g.strokeStyle = r ? this.o.fgColor
															: this.fgColor;
													this.g
															.arc(
																	this.xy,
																	this.xy,
																	this.radius
																			- this.lineWidth,
																	sat, eat,
																	false);
													this.g.stroke();

													this.g.lineWidth = 2;
													this.g.beginPath();
													this.g.strokeStyle = this.o.fgColor;
													this.g
															.arc(
																	this.xy,
																	this.xy,
																	this.radius
																			- this.lineWidth
																			+ 1
																			+ this.lineWidth
																			* 2
																			/ 3,
																	0,
																	2 * Math.PI,
																	false);
													this.g.stroke();

													return false;
												}
											}
										});

					});
				</script>

				<div class="demo">
					<input class="knob" data-min="0" data-displayPrevious=false
						data-max="15000" data-step="100" value="9200">
				</div>
			</div>

			<style>
p {
	font-size: 30px;
	line-height: 30px
}

div.demo {
	text-align: center;
	width: 280px;
	float: center
}

div.demo>p {
	font-size: 20px
}
</style>
		</div>
	</div>


	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div id="content">
		<div class="demo-container">
			<label>Heart Rate</label>
			<div id="placeholder" class="demo-placeholder"></div>
		</div>
	</div>


	<div class="col-lg-4 col-lg-offset-4">
		<a href="Members?id=${sessionScope.id }">
			<button type="button" class="btn btn-success btn-lg btn-block">Main
				Menu</button>
		</a>
	</div>
</body>
</html>
