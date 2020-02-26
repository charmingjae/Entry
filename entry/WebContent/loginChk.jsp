<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="simpleChain.IdChain" %>
<%@ page import="simpleChain.IdChain.*" %>
<%@ page import="simpleChain.Block" %>
<%@ page import="simpleChain.Block.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	
	String hash;
	
	
	if(IdChain.contains(IdChain.copytranForId,id)==true){
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs 	= null;
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/entry?"+
							"useSSl=false&serverTimezone=UTC";
		
		String dbUser = "root";
		String dbPass = "1234";
		
		
		//2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		
		//3. 쿼리를 위한 Statement 생성
		String sql = "SELECT * FROM user WHERE id =? and pw =?";
		pstat = conn.prepareStatement(sql);
		pstat.setString(1, id);
		pstat.setString(2, pw);
		
		//4. 쿼리 실행.
		rs = pstat.executeQuery();
		
		int stuCheck = 0;
		
		if(rs.next()){
			System.out.println("로그인 성공. Hash : " + IdChain.hash);

			session.setAttribute("id",id);
			response.sendRedirect("event.jsp");
			
		}else{
			
			%>
			
			<script type="text/javascript">
				alert("id와 비밀번호를 확인하세요.");
				history.go(-1);
			</script>
			<%
		}
		pstat.close();
		conn.close();
	}
	else{
	%>
		<script type="text/javascript">
			/* alert("iD가 존재하지 않습니다. Hash : " + (IdChain.blockchain.get(IdChain.blockchain.size()).hash).toString()); */
			history.go(-1);
		</script>
	<%	
	}
%>

</body>
</html>