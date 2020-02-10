<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="goalChain.GoalChain" %>
<%@ page import="goalChain.GoalChain.*" %>
<%@ page import="goalChain.Block" %>
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
		
		List<Object> goalChain = new ArrayList<>(); // 갖고갈 array
		
		
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
		pstat = conn.prepareStatement(sqlchkId); // GOAL 테이블 초기화 지정
		
		int delete = 0;
		delete = pstat.executeUpdate(); // 테이블 초기화 실행
		
		int dual = 0; // 중복체크 flag
		int result = 0;
		
	 	pstat = conn.prepareStatement(sql); // 랜덤으로 테이블에 데이터 삽입 지정
		
		result = pstat.executeUpdate(); // Insert 실행
		
		
		/* 당첨자들 블록체인에 넣기 */
		String goal = "SELECT id FROM GOAL";
		pstat = conn.prepareStatement(goal);
		rs = pstat.executeQuery();
		
		rs = pstat.executeQuery();
		
		int count = 0;
		while(rs.next()){
			goalChain.add(count,(String)rs.getString("id"));
			count++;
		}
		
		GoalChain chain = new GoalChain();
		
		/* 	블록체인에서 사용할 체인 복사*/
		chain.id = id;
		
		System.out.println("CHAIN id = " + chain.id);
		System.out.println("CHAIN email = " + chain.email);
		
		
		chain.addObject(chain.email, chain.id);
		
		
			
		request.setAttribute("dual", dual);
		
		pstat.close();
		conn.close();
	%>
	
	<jsp:forward page="goalResult.jsp"></jsp:forward>
</body>
</html>