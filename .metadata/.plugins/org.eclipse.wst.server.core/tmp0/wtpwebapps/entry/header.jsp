<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="simpleChain.IdChain" %>
<%@ page import="simpleChain.IdChain.*" %>
<%@ page import="simpleChain.Block" %>
<!DOCTYPE html>
<html>
<head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>Responsive Sticky Navbar</title>
      <link rel="stylesheet" href="./css/header.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
      
</head>
<body>
<div class="wrapper">
            <header>
                  <nav>

<!--                         <div class="menu-icon">
                              <i class="fa fa-bars fa-2x"></i>
                        </div> -->

                        <div class="logo">
                              <!-- LOGO -->
                              <a class="center__text glitch is-glitching" data-text="ENTRY" href="event.jsp"><span>ENTRY</span></a>
                        </div>
                        

            <div class="menu">
            
            		<ul>	
            					<%
            						String getSession = "";
            					
            						try{
            							getSession = (String)session.getAttribute("id");
            							if(getSession == null || getSession.equals("")){

            							}
            							else{
   								%>			<%-- <li><a onclick="myFunction()">Welcome <%=getSession %></a></li> --%>
   											<li><strong><a href="menu.html">Welcome <%=getSession %></a></strong></li>
   	                            <%
            							}
            						}catch(Exception e){
            							System.out.println("Exception : " + e);
            						}
            					%>
                                    <li><a href="index.jsp">Home</a></li>
<!--                                     <li><a href="#">About</a></li>
                                    <li><a href="#">Blog</a></li> -->
                                    <li><a href="contact.jsp">Contact</a></li>
                                    
	                            <%									
	                            	try{
	                            		getSession = (String)session.getAttribute("id");
	                            		if(getSession == null || getSession.equals("")){
	                            %>			<li><a href="login.jsp">Log-in</a></li>
	                            <%
	                            		}
	                            		else{
	                            			if(getSession.equals("admin")){
                   				%>			<li><a href="press.jsp">!!! PRESS !!!</a></li>
                   							<li><a href="generateBlock.jsp">BLOCK</a></li>
   	                            <%
	                            			}
	                            %>			<li><a href="logout.jsp">Log-Out</a></li>
	                            <%
	                            		}
	                            	}catch(Exception e){
	                            		System.out.println("Exception : " + e);
	                            	}
								
								%>
                   	</ul>
                  
            </div>
                  </nav>
            </header>
      </div>

      <script type="text/javascript">
      
  	function myFunction(){
  		if(confirm("당첨 결과를 확인하시겠습니까?") == true){
  			location.href="chkGoal.jsp";
  			return true;
  		}
  		else{
  			alert("취소되었습니다.");
  			return false;
  		}
  	}
      
/* 
      // Menu-toggle button

      $(document).ready(function() {
            $(".menu-icon").on("click", function() {
                  $("nav ul").toggleClass("showing");
            });
      });
      

      // Scrolling Effect

      $(window).on("scroll", function() {
            if($(window).scrollTop()) {
                  $('nav').addClass('black');
            }

            else {
                  $('nav').removeClass('black');
            }
      }) */


      </script>

</body>
</html>