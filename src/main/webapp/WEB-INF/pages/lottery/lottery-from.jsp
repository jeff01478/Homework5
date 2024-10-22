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
</head>
<body style="background: linear-gradient(to right, #ff6a00, #ee0979); font-family: 'Arial', sans-serif; color: white;">
  <div class="container text-center" style="padding: 3rem 0;">
    <h1 style="font-size: 3rem; font-weight: bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">🎉 樂透號碼選號 🎉</h1>
    <p style="font-size: 1.5rem; margin-bottom: 2rem; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);">讓運氣成為你的夥伴，輕鬆產生您的幸運號碼！</p>
    <form action="ex-lottery" method="post" class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="card p-4" style="border-radius: 15px; background-color: rgba(255, 255, 255, 0.8); box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);">
            <h5 class="card-title text-center mb-4" style="color: #ee0979; font-size: 2rem; font-weight: bold;">樂透號碼產生器</h5>
            <div class="mb-3">
              <label for="groups" class="form-label" style="font-size: 1.2rem; color: #333;">數組</label>
              <input type="text" class="form-control" name="groups" placeholder="請輸入整數" value="${ groups }" style="padding: 10px; border-radius: 10px;">
            </div>
            <div class="mb-3">
              <label for="filterNum" class="form-label" style="font-size: 1.2rem; color: #333;">排除的數字</label>
              <input type="text" class="form-control" name="filterNum" placeholder="每個數字需用空格隔開" value="${ filterNum }" style="padding: 10px; border-radius: 10px;">
            </div>
            <div class="d-grid gap-2">
              <button id="lotteryButton" type="submit" class="btn btn-primary" style="padding: 15px; font-size: 1.5rem; font-weight: bold; background: linear-gradient(135deg, #ff6a00, #ee0979); border: none; border-radius: 10px; transition: all 0.3s ease;">送號</button>
            </div>
          </div>
        </div>
      </div>
    </form>
    <ul style="color: red; font-size: 1rem; margin-top: 1.5rem;">
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
    <a href="logout" style="color: #fff; font-size: 1.2rem; text-decoration: underline;">登出</a>
  </div>

  <!-- External JS Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

  <!-- Custom JavaScript for Button Animation -->
  <script>
    // Add hover animation to the button
    const lotteryButton = document.getElementById('lotteryButton');

    // Add hover effect to scale up the button
    lotteryButton.addEventListener('mouseover', function() {
      this.style.transform = 'scale(1.1)';
    });

    // Remove hover effect when the mouse leaves
    lotteryButton.addEventListener('mouseout', function() {
      this.style.transform = 'scale(1)';
    });

    // Add click effect to scale down the button briefly when clicked
    lotteryButton.addEventListener('mousedown', function() {
      this.style.transform = 'scale(0.95)';
    });

    // Return to normal size after the click
    lotteryButton.addEventListener('mouseup', function() {
      this.style.transform = 'scale(1.1)';
    });
  </script>
</body>
</html>
