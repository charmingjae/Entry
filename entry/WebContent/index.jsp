<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>FOR(CE)GET.</title>

<!--  Link CSS File -->
<link rel="stylesheet" href="./css/index.css">

<!-- use cdn for the library / link the library file -->
<script src="https://cdn.jsdelivr.net/npm/baffle@0.3.6/dist/baffle.min.js"></script>


</head>
<body>
	<!-- Header -->
	
	


	<!-- For Theme -->
      <div class="container">
            <div class="data">Classic?</div>
      </div>
      
      <script type="text/javascript">

	      const text = baffle(".data");
	      text.set({
	            characters : '█▓█ ▒░/▒░ █░▒▓/ █▒▒ ▓▒▓/█ ░█▒/ ▒▓░ █<░▒ ▓/░>',
	            speed: 130
	      });
	      text.start();
	      text.reveal(4000);

      </script>
      
      
    <!-- Until Here For Theme -->
    
    
    <div class="text middle" data-text="AIR FORCE 1">
      air force 1
    </div>



    <!-- For Nav button -->
      <div class="wrapper">
        <div class="btn">
            <button type="button" onclick="location.href='event.jsp'">S w o O s h!</button>
        </div>
      </div>
      <script type="text/javascript">

      const text2 = baffle("button");
      text2.set({
            characters : '█▓█ ▒░/▒░ █░▒▓/ █▒▒ ▓▒▓/█ ░█▒/ ▒▓░ █<░▒ ▓/░>',
            speed: 160
      });
      text2.start();
      text2.reveal(4000);

      </script>
	
</body>
</html>
