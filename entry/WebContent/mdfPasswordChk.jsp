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
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String mdfpw = request.getParameter("mdfPassword");
	String mdfpwChk = request.getParameter("mdfPasswordChk");
	
	
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
	String sql = "SELECT * FROM user WHERE id =? and pw =?"; // 아이디와 비밀번호가 맞는지 확인.
	pstat = conn.prepareStatement(sql);
	pstat.setString(1, id);
	pstat.setString(2, pw);
	
	//4. 쿼리 실행.
	rs = pstat.executeQuery();
	
	int stuCheck = 0;
	
	int result = 0;
	
	if(rs.next()){	
		if(mdfpw.equals(mdfpwChk)){ // 변경할 비밀번호와 비밀번호 확인이 일치했을 때.
			String uptPw = "UPDATE user set pw = ? where id = ?"; // 비밀번호 업데이트
			pstat = conn.prepareStatement(uptPw);
			pstat.setString(1, mdfpw);
			pstat.setString(2, id);
			
			result = pstat.executeUpdate();
			session.invalidate();
			%>
			
			<script type="text/javascript">
				alert("변경 완료.");
				
				location.href="event.jsp";
			</script>
			<%
		}
		else{
			%>
			
			<script type="text/javascript">
				alert("변경할 비밀번호가 일치하지 않습니다.");
				history.go(-1);
			</script>
			<%
		}
	}else{ // 현재 비밀번호가 일치하지 않을 때
		%>
		
		<script type="text/javascript">
			alert("현재 비밀번호가 일치하지 않습니다.");
			history.go(-1);
		</script>
		<%
	}

	
	pstat.close();
	conn.close();
%>

</body>
</html>