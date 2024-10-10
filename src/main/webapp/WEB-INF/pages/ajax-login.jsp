<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="<%= request.getContextPath() %>/style/myStyle.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<h2>AJAX Login</h2>
	<br/>
	<div class="card" style="width: 18rem; margin: auto; padding: 2rem;">
	  <div class="card-body pt-0">
	    <h5 class="card-title" style="padding-bottom: 1rem">登入</h5> 
	    <form id="loginForm">
	      <div class="mb-3">
	        <label class="form-label">帳號</label>
	        <input type="text" class="form-control" name="userName" value="${ userName }">
	      </div>
	      <div class="mb-3">
	        <label class="form-label">密碼</label>
	        <input type="password" class="form-control" name="password" value=${ password }>
	      </div>
	      <input id="login" type="submit" class="btn btn-primary" value="登入" />
	      <input type="hidden" name="isLogin" value="true" />
	    </form>	  
	    <br/>
	    <form action="register" method="GET">
	    	<button type="submit" class="btn btn-success">註冊</button>
	    </form>
	    <script src="<%= request.getContextPath() %>/js/loginConfirm.js"></script>
	  </div>
	</div>
	<ul style="color: red; font-size: 0.8em">
		<li id="loginError"></li>
	</ul>
	<br/>
	<p class="lead">${ successMessage }<p>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>