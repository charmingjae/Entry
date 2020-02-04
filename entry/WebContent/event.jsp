<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>FOR(CE)GET.</title>

<link rel="stylesheet" href="./css/event.css">
<!-- use cdn for the library / link the library file -->
<script src="https://cdn.jsdelivr.net/npm/baffle@0.3.6/dist/baffle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
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
                    <a href='dive.jsp'><img src="./img/force1.png" alt="" /></a>
                </div>
            </div>
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

            $(".portfolio-item img").on("mouseenter", function() {
                cursor.addClass("active");
                follower.addClass("active");
            });

            $(".portfolio-item img").on("mouseleave", function() {
                cursor.removeClass("active");
                follower.removeClass("active");
            });
        </script>


	<!-- Timer -->
    <span id="demo"></span>

    <script>
        // Set the date we're counting down to
        var countDownDate = new Date("Feb 19, 2020 12:00:00").getTime();

        // Update the count down every 1 second
        var x = setInterval(function() {

        // Get today's date and time
        var now = new Date().getTime();

        // Find the distance between now and the count down date
        var distance = countDownDate - now;

        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Display the result in the element with id="demo"
        document.getElementById("demo").innerHTML = days + "d &nbsp" + hours + "h &nbsp"
        + minutes + "m &nbsp" + seconds + "s &nbsp";

        // If the count down is finished, write some text
        if (distance < 0) {
        clearInterval(x);
        document.getElementById("demo").innerHTML = "EXPIRED";
        }
        }, 1000);
    </script>
    
    <!-- End Timer -->

</body>
</html>