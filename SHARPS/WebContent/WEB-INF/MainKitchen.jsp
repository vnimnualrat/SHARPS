<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Kitchen</title>

<!-- Bootstrap Core CSS -->
<link
	href="bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="bootstrap/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="bootstrap/bower_components/datatables-responsive/css/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="bootstrap/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link href="bootstrap/bootstrap-switch-master/dist/css/bootstrap3/bootstrap-switch.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="style3.css" />


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body style="background-color: white;">
	


<div class="splash">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2">
            <h1><strong><u>The Kitchen</u></strong></h1>
            
          </div>
        </div>
      </div>
</div>
<br>
<br>

 <div class="row">

 </div>
<br>
<div class="container">
<div class="row">
                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <center><strong><font color= black>Toaster</font></strong></center>
                        </div>
                        <div class="panel-body">
                            	<img src="toaster.jpg"
								class="img-responsive img-rounded center-block"
								alt="Responsive image">
                        </div>
                        <div class="panel-footer">
                           <center><input class="form-control" type="checkbox" data-on-color="success" data-off-color="danger"></center>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <center><strong><font color= black>Refrigerator</font></strong></center>
                        </div>
                        <div class="panel-body">
                            	<form action ="kitchen">
                            	<input type="image" src="fridge.png" class="img-responsive img-rounded center-block"
								alt="Responsive image" />
                            	</form>
                            	
                        </div>
                        <div class="panel-footer">
                           <center><input class="form-control" type="checkbox" checked data-on-color="success" data-off-color="danger"></center>
                        </div>
                    </div>
                </div>
                
                    <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <center><strong><font color= black>Microwave</font></strong></center>
                        </div>
                        <div class="panel-body">
                            	<img src="microwave.jpg"
								class="img-responsive img-rounded center-block"
								alt="Responsive image">
                        </div>
                        <div class="panel-footer">
                           <center><input class="form-control" type="checkbox" data-on-color="success" data-off-color="danger"></center>
                        </div>
                    </div>
                </div>
</div>
</div>
<br>

<div class="container">
<div class="row">
                <div class="col-lg-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <center><strong><font color = black>Coffee Maker</font></strong></center>
                        </div>
                        <div class="panel-body">
                            	<img src="coffee_1.jpg"
								class="img-responsive img-rounded center-block"
								alt="Responsive image">
                        </div>
                        <div class="panel-footer">
                           <center><input class="form-control" type="checkbox" data-on-color="success" data-off-color="danger"></center>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <center><strong><font color = black>Oven</font></strong></center>
                        </div>
                        <div class="panel-body">
                            <img src="wall-oven1.jpg"
								class="img-responsive img-rounded center-block"
								alt="Responsive image">
                        </div>
                        <div class="panel-footer">
                           <center><input class="form-control" type="checkbox" data-on-color="success" data-off-color="danger"></center>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <center><strong><font color = black>Dishwasher</font></strong></center>
                        </div>
                        <div class="panel-body">
                           <img src="dishwasher.jpg"
								class="img-responsive img-rounded center-block"
								alt="Responsive image">
                        </div>
                        <div class="panel-footer">
                            <center><input class="form-control" type="checkbox" data-on-color="success" data-off-color="danger"></center>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-4 -->
</div>
</div>

           <br>
           <br>
            
           <div class="col-lg-4 col-lg-offset-4">
		<a href="Members?id=${sessionScope.id }">
			<button type="button" class="btn btn-success btn-lg btn-block">Main
				Menu</button>
		</a>
	</div>



	<!-- jQuery -->
	<script src="bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="bootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="bootstrap/dist/js/sb-admin-2.js"></script>

	<script src="bootstrap/bootstrap-switch-master/dist/js/bootstrap-switch.js"></script>
	  <script>
    $(function(argument) {
      $('[type="checkbox"]').bootstrapSwitch();
    })
    </script>

</body>
</html>