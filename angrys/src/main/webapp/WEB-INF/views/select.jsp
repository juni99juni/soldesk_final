<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	��ȣ <br><br>
	<c:forEach var="user" items="${user }">
		
		���̵� : ${user.ID }<br>
		����� : ${user.password }<br>
		�̸��� : ${user.nickname }<br>
		
		<br><br>
		
	</c:forEach>
	
</body>
</html>