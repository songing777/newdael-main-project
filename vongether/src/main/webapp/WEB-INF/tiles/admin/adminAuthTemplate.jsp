<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
  <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Vongether</title>

  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="/resources/admin/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="/resources/admin/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="/resources/admin/css/plugins/simple-line-icons.css"/>
  <link rel="stylesheet" type="text/css" href="/resources/admin/css/plugins/animate.min.css"/>
  <link rel="stylesheet" type="text/css" href="/resources/admin/css/plugins/icheck/skins/flat/aero.css"/>
  <link href="/resources/admin/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="asset/img/logomi.png">
    </head>

  <body id="mimin" class="dashboard form-signin-wrapper">
	
	  <tiles:insertAttribute name="adminAuthBody" />
	
	
    

	    <script src="/resources/admin/js/jquery.min.js"></script>
      <script src="/resources/admin/js/jquery.ui.min.js"></script>
      <script src="/resources/admin/js/bootstrap.min.js"></script>

      <script src="/resources/admin/js/plugins/moment.min.js"></script>
      <script src="/resources/admin/js/plugins/icheck.min.js"></script>

      <!-- custom -->
     <script src="/resources/admin/js/main.js"></script>
      <script type="text/javascript">
       $(document).ready(function(){
         $('input').iCheck({
          checkboxClass: 'icheckbox_flat-aero',
          radioClass: 'iradio_flat-aero'
        });
       });
     </script>

	</body>
</html>
