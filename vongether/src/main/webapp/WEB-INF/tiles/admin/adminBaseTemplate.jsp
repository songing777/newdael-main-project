<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin-vongether</title>
 
    <!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="/resources/admin/css/bootstrap.min.css">

      <!-- plugins -->
      <link rel="stylesheet" type="text/css" href="/resources/admin/css/plugins/font-awesome.min.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/admin/css/plugins/simple-line-icons.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/admin/css/plugins/animate.min.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/admin/css/plugins/fullcalendar.min.css"/>
  <link href="/resources/admin/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="/resources/admin/img/logomi.png">
  
  <!-- start: Javascript -->
    <script src="/resources/admin/js/jquery.min.js"></script>
    <script src="/resources/admin/js/jquery.ui.min.js"></script>
    <script src="/resources/admin/js/bootstrap.min.js"></script>
   
    
    <!-- plugins -->
    <script src="/resources/admin/js/plugins/moment.min.js"></script>
    <script src="/resources/admin/js/plugins/jquery.nicescroll.js"></script>
    <script src="/resources/admin/js/plugins/jquery.vmap.sampledata.js"></script>

</head>

  <body id="mimin" class="dashboard">
	
	<div id="baseBody">
			<tiles:insertAttribute name="adminHeader" />
			<div class="container-fluid mimin-wrapper">
				<tiles:insertAttribute name="adminLeft" />
			  <div id="content">
				  <tiles:insertAttribute name="adminBody" />
				</div>
			</div>
	</div>
	
	
	
    


    <!-- custom -->
     <script src="/resources/admin/js/main.js"></script>

	


	</body>
</html>
