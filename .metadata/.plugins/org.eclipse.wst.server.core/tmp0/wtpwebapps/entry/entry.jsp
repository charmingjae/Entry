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
		PreparedStatement pstat2 = null;
		ResultSet rs 	= null;
		ResultSet rs2 	= null;
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/entry?"+
							"useSSl=false&serverTimezone=UTC";
		
		String dbUser = "root";
		String dbPass = "1234";
		
		
		
		//2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		
		
		String sql =  "INSERT INTO entry(id,email) VALUES(?,?)";
		
		// 이미 등록했는지 중복체크
		String sqlchkId = "SELECT id FROM entry WHERE id = ?";
		pstat = conn.prepareStatement(sqlchkId);
		pstat.setString(1, id);
		
		/* email 가져오기 */
		String sqlEmail = "SELECT email FROM user WHERE id = ?";
		pstat2 = conn.prepareStatement(sqlEmail);
		pstat2.setString(1, id);
		
		
		
		rs = pstat.executeQuery(); // 이미 등록했는지 여부 실행
		rs2 = pstat2.executeQuery(); // email 가져오기.
		
		int dual = 0; // 중복체크 flag
		int result = 0;
		
		if(rs.next()){
			// 등록을 했으면.
			dual = 1;
			
		}else if(rs2.next()){
			String email = rs2.getString("email");
		 	pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, email);
			
			result = pstat.executeUpdate();
			
		}
		
		request.setAttribute("dual", dual);
		
		pstat.close();
		pstat2.close();
		conn.close();
	%>
	
	<jsp:forward page="entryResult.jsp"></jsp:forward>
</body>
</html>