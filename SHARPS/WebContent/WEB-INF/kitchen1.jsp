<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Kitchen </title>

    <!-- Bootstrap Core CSS -->
    <link href="bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="bootstrap/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <link href="bootstrap.css" rel="stylesheet">
<link href="bootstrap-switch.css" rel="stylesheet">
<script src="jquery.js"></script>
<script src="bootstrap-switch.js"></script>
    
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet" type="text/css" href="style2.css" />

</head>
<body style="background-color: white;">




	        
         
                

            <div class="splash">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2">
            <h1><strong><u>The Refrigerator</u></strong></h1>
            
          </div>
        </div>
      </div>
</div> 
            
             
<br>
 
      
             <div align = class="row">
           
                
                <div class="col-lg-3 col-md-6 col-lg-offset-2">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-cloud fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">35° F</div>
                                    <div>Temperature</div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tint fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">Good</div>
                                    <div>Water Filter</div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-warning fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">2</div>
                                    <div>Warnings</div>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
             
             
     <br>    
     <br> 
     <br> 
     <br> 
     <br> 
     <br> 
     <br> 
       
             
             
             
             
  <div class="row">
		<div class="col-lg-6 col-lg-offset-2">
                
                    <div class="panel panel-info">
                        <div class="panel-heading"><center>
                           <span class="glyphicon glyphicon-apple"></span>    
                            <b> Refrigerator Content</b></center>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive table-bordered ">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Iteam</th>
                                            <th>Quantity</th>
                                            <th>Exp Date</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${entries}" var="entry">
												<c:choose>
													<c:when test="${entry.percent < 33}"> 	
														<tr class="danger">
														<td>${entry.item}</td>
														<td>${entry.quantity}</td>
														<td>${entry.exp}</td>
														
														</tr>
													</c:when>
													<c:when test="${entry.percent > 34 && entry.percent < 66}"> 	
														<tr class="warning">
														<td>${entry.item}</td>
														<td>${entry.quantity}</td>
														<td>${entry.exp}</td>
														
														</tr>
													</c:when>
													
													
													<c:otherwise>
													<tr class="success">
													<td>${entry.item}</td>
													<td>${entry.quantity}</td>
													<td>${entry.exp}</td>
													
													</tr>
													
													
													</c:otherwise>
												
												
												
												</c:choose>
												
										
										</c:forEach>	            
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                                            </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            
                
            
            
            <div class="col-lg-3">
   				<div class="panel panel-info">
                        <div class="panel-heading">
                            <i class="fa fa-shopping-cart fa"></i> <b> Shopping List </b>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                            <c:forEach items="${entries}" var="entry">
												<c:choose>
													<c:when test="${entry.percent < 33}"> 	
													<div class="list-group-item">
                                     				<strong>${entry.item}</strong>
                                					</div>
													</c:when>
                            
                            </c:choose>
                            </c:forEach>
                            
                               
                            </div>
                            <!-- /.list-group -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
            	</div>
            

            </div>
          
           <br> 
           <div class="col-lg-4 col-lg-offset-4">
           <form action= "main">        
           <button type="submit" class="btn btn-outline btn-primary btn-lg btn-block">Kitchen</button>         
            </form>
            </div>


                        
<!-- jQuery -->
    <script src="bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="bootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="bootstrap/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>                        


</body>
</html>