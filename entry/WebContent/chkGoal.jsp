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
	
	
			String getSession = "";
			getSession = (String)session.getAttribute("id");
		
			
			
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
			
			
			
			/* 당첨자 체크 체크 */
			String sqlchkId = "SELECT id FROM goal WHERE id=?";
			pstat = conn.prepareStatement(sqlchkId);
			pstat.setString(1, getSession);
			
			
			rs = pstat.executeQuery();
			
			int userCheck = 0; // 중복 회원 검사용
			int result = 0; // insert문 flag
			
			if(rs.next()){
				
			}
			else{
				userCheck = 1;
			}
			
			request.setAttribute("userCheck", userCheck);
			
			pstat.close();
			conn.close();
	%>
	
	<jsp:forward page="chkGoalResult.jsp"></jsp:forward>
</body>
</html>