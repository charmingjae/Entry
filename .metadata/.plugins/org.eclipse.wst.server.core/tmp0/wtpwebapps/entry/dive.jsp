<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>FOR(CE)GET.</title>

<link rel="stylesheet" href="./css/dive.css">
<!-- use cdn for the library / link the library file -->
<script src="https://cdn.jsdelivr.net/npm/baffle@0.3.6/dist/baffle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"> -->
</head>
<body>


	<!-- Header -->

	<jsp:include page="header.jsp"></jsp:include>

	<!-- image hover -->
	
	<div class="cursor"></div>
        <div class="cursor-follower"></div>
        <div id="wrapper">
            <div class="portfolio-item">
                <div class="portfolio-thumb">
                    <img src="./img/force1.png" alt="" />
                    	<span id="demo"> AIR FORCE 1 <br/><br/></span>
                    	<span id="in-demo"> ENTRY Term : 02/04(월) 22:00 ~ 23:00 (1시간)<br/>
                    						당첨자 발표 : 02/05(화) 07:00<br/>
                    						구매 기간 : 02/07(수) 12:00 ~ 14:00 (2시간)
                    	</span>
                </div>
            	
            </div>
        </div>
        <div class="btn">
            <!-- <button type="button" onclick="return confirm();">ENTRY</button> -->
            <!-- <input type="button" id="entry" value="ENTRY"></input> -->
            <button type="button" onclick="myFunction()">ENTRY</button>
            <script>
            	function myFunction(){
            		<%
					String getSession = (String)session.getAttribute("id");
					if(getSession == null || getSession.equals("")){
					%>
        			location.href="login.jsp";
        			return false;
					<%
					}
            		%>
            		if(confirm("Entry?") == true){
            			location.href="entry.jsp";
            			return true;
            		}
            		else{
            			alert("취소되었습니다.");
            			return false;
            		}
            	}
            </script>
        </div>
        <script>
            
            
            var cursor = $(".cursor"),
                follower = $(".cursor-follower");

            var posX = 0,
                posY = 0,
                mouseX = 0,
                mouseY = 0;

            TweenMax.to({}, 0.016, {
                repeat: -1,
                onRepeat: function() {
                    posX += (mouseX - posX) / 9;
                    posY += (mouseY - posY) / 9;

                    TweenMax.set(follower, {
                        css: {
                            left: posX - 20,
                            top: posY - 20
                        }
                    });

                    TweenMax.set(cursor, {
                        css: {
                            left: mouseX,
                            top: mouseY
                        }
                    });
                }
            });

            $(document).on("mousemove", function(e) {
                mouseX = e.pageX;
                mouseY = e.pageY;
            });

/*             $(".portfolio-item img").on("mouseenter", function() {
                cursor.addClass("active");
                follower.addClass("active");
            });

            $(".portfolio-item img").on("mouseleave", function() {
                cursor.removeClass("active");
                follower.removeClass("active");
            }); */
        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>

</body>
</html>