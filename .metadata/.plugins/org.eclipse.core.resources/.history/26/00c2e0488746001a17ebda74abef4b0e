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
	
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String email = request.getParameter("email");
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = null;
		PreparedStatement pstat = null;
		PreparedStatement pstat2 = null;
		ResultSet rs 	= null;
		ResultSet rs2 	= null;
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/entry?"+
							"useSSl=false&serverTimezone=UTC";
		
		String dbUser = "root";
		String dbPass = "1234";
		
		
		
		//2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		
		
		String sql =  "INSERT INTO user(id,pw,email) VALUES(?,?,?)";
		
		
		/* Id 중복 체크 */
		String sqlchkId = "SELECT * FROM user WHERE id = ?";
		pstat = conn.prepareStatement(sqlchkId);
		pstat.setString(1, id);
		
		
		/* Email 중복 체크 */
		String sqlchkEmail = "SELECT * FROM user WHERE email = ?";
		pstat2 = conn.prepareStatement(sqlchkEmail);
		pstat2.setString(1, email);
		
		rs = pstat.executeQuery();
		rs2 = pstat2.executeQuery();
		
		int userCheck = 0; // 중복 회원 검사용
		int result = 0; // insert문 flag
		
		if(rs.next()){
			// 테이블에 사원정보가 등록되어 있는 경우.
			userCheck = 1; // id 중복
		}
		else if(rs2.next()){
			userCheck = 2; // email 중복
		}
		else{
			// 테이블에 사원 정보가 등록되어 있지 않은 경우.
		 	pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, pw);
			pstat.setString(3, email);
			
			result = pstat.executeUpdate();
		}
		
		request.setAttribute("userCheck", userCheck);
		
		pstat.close();
		pstat2.close();
		conn.close();
	%>
	
	<jsp:forward page="registerResult.jsp"></jsp:forward>
</body>
</html>