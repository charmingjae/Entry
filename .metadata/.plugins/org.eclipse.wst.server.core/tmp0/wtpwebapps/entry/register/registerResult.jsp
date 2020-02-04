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
		<c:when test="${userCheck == 1}">
			<script type="text/javascript">
				alert("이미 등록된 iD입니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:when test="${userCheck == 2}">
			<script type="text/javascript">
				alert("이미 등록된 E-MAIL입니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:when test="${userCheck == 0 }">
			<script type="text/javascript">
				alert("회원가입 성공");
				location.href ="login.jsp";
			</script>
		</c:when>
		<c:when test="${userCheck < 0 }">
			<script type="text/javascript">
				alert("회원 등록 실패");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>