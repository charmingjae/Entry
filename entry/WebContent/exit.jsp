<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Untitled</title>
    <link rel="stylesheet" href="./css/exit.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.bundle.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>

<body>
    <jsp:include page="headerForRL.jsp"></jsp:include>
    <div class="button" onClick="myFunction()"> <a style="color: #ff0066;"> </a> </div>
	<div class="button1"></div>
  	<div style="width:50%;">
        <canvas id="canvas"></canvas>
    </div>
</body>
<script type="text/javascript">
/* function myFunction(){
		if(confirm("회원탈퇴를 진행하시겠습니까?") == true){
			location.href="exitProc.jsp";
			return true;
		}
		else{
			alert("취소되었습니다.");
			return false;
		}
} */


/* 회원탈퇴 시 문자열을 비교하여 탈퇴 여부 결정 */
function myFunction(){
		var name = prompt("회원탈퇴를 원하시면 '차민재 짱'을 입력하세요.","");
		if(name == "차민재 짱"){
			location.href="exitProc.jsp";
			return true;
		}
		else{
			alert("입력한 문자를 확인하세요.");
			return false;
		}
}
</script>

</html>