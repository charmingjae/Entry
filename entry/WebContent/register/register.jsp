<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REGISTER</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="../css/register.css">
</head>

<body>

<script type="text/javascript">
	
	// Check Empty Input Box
	function check(){
		if(!frm.id.value){
			alert("iD를 입력하세요.");
			frm.id.focus();
			return false;
		}
		if(!frm.password.value){
			alert("비밀번호를 입력하세요.");
			frm.password.focus();
			return false;
		}
		if(!frm.email.value){
			alert("비밀번호를 입력하세요.");
			frm.email.focus();
			return false;
		}
	}
	// End Check
	
</script>

    <div class="login-dark">
    	<jsp:include page="../headerForRL.jsp"></jsp:include>
    	<!-- Register Form -->
        <form action="registerProc.jsp" name="frm" onsubmit="return check()" method="post">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><i class="icon ion-gear-a"></i></div>
            <div class="form-group"><input class="form-control" name="id" placeholder="iD"></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
            <div class="form-group"><input class="form-control" type="email" name="email" placeholder="e-Mail"></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit">회원가입</button></div>
            <a href="login.jsp" class="forgot">이미 iD가 있으십니까?</a>
        </form>
        <!-- End Register Form -->
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>