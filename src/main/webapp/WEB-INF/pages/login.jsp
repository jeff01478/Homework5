<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome To My Spring Boot Playground!</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="<%= request.getContextPath() %>/style/myStyle.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
    body {
        background: linear-gradient(to right, #6a11cb, #2575fc);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .card {
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .btn-primary, .btn-success {
        border-radius: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    .form-label {
        font-weight: bold;
    }
    .form-control {
        border-radius: 5px;
    }
</style>
</head>
<body>
    <br/>
    <div class="card" style="width: 20rem; margin: auto; padding: 2rem;">
      <div class="card-body pt-0">
        <h5 class="card-title text-center" style="padding-bottom: 1rem">登入</h5> 
        <form action="lottery/loginConfirm" method="POST">
          <div class="mb-3">
            <label class="form-label">帳號</label>
            <input type="text" class="form-control" name="userName" value="${ userName }" placeholder="輸入您的帳號">
          </div>
          <div class="mb-3">
            <label class="form-label">密碼</label>
            <input type="password" class="form-control" name="password" value="${ password }" placeholder="輸入您的密碼">
          </div>
          <button type="submit" class="btn btn-primary w-100">登入</button>
          <input type="hidden" name="isLogin" value="true" />
        </form>	  
        <br/>
        <form action="register" method="GET">
            <button type="submit" class="btn btn-success w-100">註冊</button>
        </form>
      </div>
      <br/>
        <p id="loginError" class="text-center" style="color: red; font-size: 0.8em">${ loginError }</p>
    </div>
    <div class="text-center mt-3">
        <a href="ajax-login" class="text-white">使用新版登入</a>
    </div>
    <br/>
    <p class="lead text-center text-white">${ successMessage }</p>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>
