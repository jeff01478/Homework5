<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function showSuccessMessage(message) {
	    alert(message);
	}
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="<%= request.getContextPath() %>/style/myStyle.css" rel="stylesheet"/>
</head>
<body style="background-color: #f5f5f5; font-family: 'Arial', sans-serif;">
	<div class="card shadow-lg" style="width: 22rem; margin: 5% auto; padding: 2rem; border-radius: 15px; background-color: #ffffff;">
	  <div class="card-body pt-0">
	    <h4 class="card-title text-center" style="padding-bottom: 1rem; font-weight: bold; color: #007bff;">帳號註冊</h4>
	    <form:form id="registerForm" action="/homework5/add-person" method="POST">
	      <div class="mb-3">
	        <form:label path="userName" class="form-label">帳號</form:label>
	        <form:input path="userName" type="text" class="form-control" name="userName" value="${ registerUserName }" placeholder="請輸入帳號" style="padding: 10px; border-radius: 5px;"/>
	        <p id="userNameMsg" style="font-size: 12px; color: red;"></p>
	      </div>
	      <div class="mb-3">
	        <form:label path="password" class="form-label">密碼</form:label>
	        <form:input path="password" type="password" class="form-control" name="password" value="${ registerPassword }" placeholder="請輸入密碼" style="padding: 10px; border-radius: 5px;"/>
	        <p id="passwordMsg" style="font-size: 12px; color: red;"></p>
	      </div>
	      <div class="mb-3">
	        <label class="form-label">確認密碼</label>
	        <input type="password" class="form-control" name="confirmPassword" value="${ confirmPassword }" placeholder="請再次輸入密碼" style="padding: 10px; border-radius: 5px;"/>
	      </div>
	      <button type="submit" class="btn btn-primary w-100" style="padding: 10px; font-weight: bold; border-radius: 5px; background: linear-gradient(135deg, #007bff, #0056b3);">送出</button>
	    </form:form>
	  </div>
	</div>

	<!-- Error messages section -->
	<ul style="color: red; font-size: 0.9em; text-align: center;">
		<table style="margin: auto;">
			<% 
				LinkedList<String> errorMsgs = (LinkedList)session.getAttribute("errors");
				if(errorMsgs != null) {
					for(String error : errorMsgs) {
						out.println("<tr><td><li>" + error + "</li></td></tr>");
					}
				}
			%>
		</table>
	</ul>

	<!-- External JS Libraries -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

	<!-- Custom JavaScript -->
	<script src="<%= request.getContextPath() %>/js/registerConfirm.js"></script>
</body>
</html>