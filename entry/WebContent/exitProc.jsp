<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String id = (String)session.getAttribute("id");
	
	int result = 0;
	
	
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
	
	/* user 테이블 정보 삭제 */
	String sql = "DELETE FROM user where id = ?";
	pstat = conn.prepareStatement(sql);
	pstat.setString(1, id);
	result = pstat.executeUpdate();
	
	/* entry 테이블 정보 삭제 */
	String sql2 = "DELETE FROM entry where id = ?";
	pstat = conn.prepareStatement(sql2);
	pstat.setString(1, id);
	result = pstat.executeUpdate();
	
	/* goal 테이블 정보 삭제 */
	String sql3 = "DELETE FROM goal where id = ?";
	pstat = conn.prepareStatement(sql3);
	pstat.setString(1, id);
	result = pstat.executeUpdate();
	
	
	session.invalidate();
	
	%>
	
	<script type="text/javascript">
		alert("회원탈퇴가 완료되었습니다.");
		location.href="event.jsp";
	</script>
	<%

	
	pstat.close();
	conn.close();
%>

</body>
</html>