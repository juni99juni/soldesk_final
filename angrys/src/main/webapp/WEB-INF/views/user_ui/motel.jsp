<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>


<body>
	
	<c:set var="memID" value="${memID}" scope="session"/>
	<c:if test="${empty sessionScope.memID }">
		<script type="text/javascript">
			alert("���񽺸� ���÷��� �α����� �ʿ��մϴ�.");
		</script>
		<meta http-equiv="refresh" content="0;url=login">
	</c:if>	
	
	
	
	<div align="center" style="margin:0 auto;height: 1000px;width: 900px;" >
		<div align="center" style="background-color: skyblue;font-size: 50px;">
			<div style="width:220px; color: white; cursor: pointer;" onclick="location.href='main'">ANGRY'S</div>
		</div>
		
		
		<div style="margin-top: 100px;height: 200px;">
			<label>���� ������ ���� �� HP�� MP�� ��� ȸ�����ѵ帳�ϴ�.<br>�Ϸ� �� ���µ� <b>${user_gold } ���</b> �Դϴ�.<br></label>
			<c:if test="${user_gold < 1 }"><br>��尡 �����ñ���. ��¥�� �����ŵ� �����ϴ�.<br></c:if>
			<div style="margin-top: 20px;">
				<input class="btn btn-outline-secondary" type="button" value="ȸ���ϱ�" size="20" onclick="location.href='heal'">
				<input class="btn btn-outline-secondary" type="button" value="��������" size="20" onclick="location.href='main'">
			</div>
		</div>
		
		
		
		
		
		<div style="text-align: center; background-color: #DDDDDD; height: 200px;">
			<label style="margin-top:80px">����Ư���� ���α� ����12�� 15, 5��(��ö�� 13-13)           ��ǥ��ȭ: 1544-0714          �������: ������</label>
		</div>
	</div>
	
	
</body>
</html>