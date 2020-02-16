<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Untitled</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="./css/mdfPassword.css">
</head>

<body>
	<%
		String id = (String)session.getAttribute("id");
	%>
    <div class="login-dark">
    <jsp:include page="headerForRL.jsp"></jsp:include>
        <form action="mdfPasswordChk.jsp" method="post">
            <!-- <h2 class="sr-only">Login Form</h2> -->
            <div class="illustration"><i class="icon icon ion-planet"></i></div>
            <div class="form-group"><input class="form-control" name="id" value="<%= id%>" readonly></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="현재 비밀번호"></div>
            <div class="form-group"><input class="form-control" type="password" name="mdfPassword" placeholder="변경할 비밀번호"></div>
            <div class="form-group"><input class="form-control" type="password" name="mdfPasswordChk" placeholder="비밀번호 확인"></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit">UPDATE!</button></div>
            <a href="register.jsp" class="forgot">회원이 아니십니까?</a>
            <a href="#" class="forgot">Forgot your iD or password?</a>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>