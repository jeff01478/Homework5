<%@page import="java.util.LinkedList"%>
<%@page import="java.net.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
  <style>
    body {
      background-color: #f4f7fa;
      font-family: 'Roboto', sans-serif;
      color: #333;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 2rem;
    }

    h1 {
      font-size: 3rem;
      font-weight: 700;
      color: #1a1a2e;
      text-align: center;
      margin-bottom: 1.5rem;
    }

    p {
      font-size: 1.2rem;
      color: #666;
      text-align: center;
      margin-bottom: 2rem;
    }

    .card {
      background-color: #fff;
      border-radius: 15px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      padding: 2rem;
      max-width: 600px;
      margin: 0 auto;
    }

    .card-title {
      font-size: 1.8rem;
      font-weight: 500;
      color: #007bff;
      text-align: center;
      margin-bottom: 1.5rem;
    }

    .form-label {
      font-size: 1.1rem;
      color: #333;
      font-weight: 500;
    }

    .form-control {
      padding: 12px;
      border-radius: 8px;
      border: 1px solid #ccc;
      width: 100%;
      margin-bottom: 1.5rem;
      transition: border-color 0.3s ease;
    }

    .form-control:focus {
      border-color: #007bff;
      outline: none;
    }

    .btn-primary {
      padding: 12px;
      font-size: 1.2rem;
      font-weight: 500;
      background-color: #007bff;
      border: none;
      border-radius: 8px;
      color: white;
      cursor: pointer;
      transition: background-color 0.3s ease, transform 0.2s ease;
      width: 100%;
      margin-top: 1rem;
    }

    .btn-primary:hover {
      background-color: #0056b3;
      transform: scale(1.02);
    }

    .error-messages {
      color: red;
      font-size: 0.9rem;
      margin-top: 1.5rem;
      text-align: center;
    }

    .logout-link {
      display: block;
      text-align: center;
      font-size: 1.1rem;
      color: #007bff;
      margin-top: 2rem;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    .logout-link:hover {
      color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>樂透號碼選號系統</h1>
    <p>簡單高效，為您快速選出樂透幸運號碼</p>
    <div class="card">
      <h5 class="card-title">樂透號碼產生器</h5>
      <form action="exLottery" method="post">
        <div class="mb-3">
          <label for="groups" class="form-label">數組</label>
          <input type="text" class="form-control" name="groups" placeholder="請輸入整數" value="${ groups }">
        </div>
        <div class="mb-3">
          <label for="filterNum" class="form-label">排除的數字</label>
          <input type="text" class="form-control" name="filterNum" placeholder="每個數字需用空格隔開" value="${ filterNum }">
        </div>
        <button type="submit" class="btn btn-primary">送號</button>
      </form>
    </div>
    <div class="error-messages">
      <ul>
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
    </div>
    <a href="logout" class="logout-link">登出</a>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>
