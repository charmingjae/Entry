<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		// Session에서 가져온 id
		String id = (String)session.getAttribute("id");
		
		
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
		
		
		String sql =  "INSERT INTO GOAL(id,email) SELECT id, email FROM ENTRY ORDER BY RAND() LIMIT 2";
		
		// 이미 등록했는지 중복체크
		String sqlchkId = "DELETE FROM GOAL";
		pstat = conn.prepareStatement(sqlchkId);
		
		int delete = 0;
		delete = pstat.executeUpdate(); // 테이블 초기화 실행
		
		int dual = 0; // 중복체크 flag
		int result = 0;
		
	 	pstat = conn.prepareStatement(sql);
		
		result = pstat.executeUpdate();
			
		request.setAttribute("dual", dual);
		
		pstat.close();
		conn.close();
	%>
	
	<jsp:forward page="goalResult.jsp"></jsp:forward>
</body>
</html>