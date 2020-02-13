<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String userId = (String)request.getAttribute("userId");
	%>
	<c:choose>
		<c:when test="${userCheck == 0 }">
			<script type="text/javascript">
				alert("축하합니다!");
				location.href = "amigoalin.jsp?userId=<%=userId%>";
			</script>
		</c:when>
		<c:when test="${userCheck > 0 }">
			<script type="text/javascript">
				alert("안타깝습니다 ㅜ");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>