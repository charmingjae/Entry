<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>GOAL!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="./css/main.css" />
    <link
      href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
  
  	<%
  		String userId = (String)request.getParameter("userId");
  	%>
    <div class="wrapper">
      <div class="parallax__group hero-container">
        <div class="parallax__layer sky"></div>
        <div class="parallax__layer bushes"></div>
        <div class="parallax__layer water"></div>
        <div class="parallax__layer people1"></div>
        <div class="parallax__layer people2"></div>
        <div class="parallax__layer people3"></div>
        <div class="parallax__layer hero-text">
          <h2><a href="event.jsp">ENTRY</a></h2>
          <ul>
          </ul>
          <div class="year-container">
            <h1>GOAL!</h1>
          </div>
        </div>
      </div>
      <div class="parallax__group info-container">
        <img src="./img/concert.jpg" alt="Lively and colourful concert" />
        <div class="text-container">
          <h2>축하합니다!</h2>
          <h2><%=userId %> 님께서는 <a href="dive.jsp">AIR FORCE 1</a>에 당첨되셨습니다.</h2>
          <p>구매 기간 : XX월 XX일 00:00 ~ 00:00</p>
          <p>구매 장소 : 아무 데나</p>
        </div>
      </div>
    </div>
  </body>
</html>
