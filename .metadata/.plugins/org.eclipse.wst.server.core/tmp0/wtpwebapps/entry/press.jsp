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
    <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
    <link rel="stylesheet" href="./css/press.css">
</head>

<body>
    <div class="login-dark">
    <jsp:include page="headerForPress.jsp"></jsp:include>
        <form method="post">
            <h2 class="sr-only">Login Form</h2>
<!--             <div class="illustration"><i class="icon ion-ios-paw"></i></div> -->
                  <div class="media">
            <ul>
                  <li><ion-icon name="flame"></ion-icon><a href="https://www.google.com/search?q=totoro&sxsrf=ACYBGNQkquHC8QRXSNrRdha-64GeR8OMRA:1580824644096&source=lnms&tbm=isch&sa=X&ved=2ahUKEwj9-vPahrjnAhW5yYsBHWAFBp0Q_AUoAXoECBMQAw&biw=1680&bih=915" class="contact">みんな笑ってみな、<br/>おっかないのは逃げちゃうから</a></li>
            </ul>
            <button type="button" onclick="goal()">time's up</button>
            <script> 
            	function goal(){
            		if(confirm("추첨 하시겠습니까?") == true){
            			location.href="goal.jsp";
            			return true;
            		}
            		else{
            			alert("취소되었습니다.");
            			return false;
            		}
            	}
            </script>
            
      </div>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>