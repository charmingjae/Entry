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
	<c:choose>
		<c:when test="${dual == 0}">
			<script type="text/javascript">
				alert("추첨 완료.");
				location.href ="press.jsp";
			</script>
		</c:when>
		<c:when test="${dual == 1}">
			<script type="text/javascript">
				alert("오류 발생.");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>	
</body>
</html>