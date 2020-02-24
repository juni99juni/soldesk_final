<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		
		$(document).ready(function(){
			$("#ID").focus();
			$("#login").click(function(){
				
				if($("#ID").val() != "" && $("#password").val() != ""){
					
					$.ajax({
						url : "login_action" ,
						type : "post" ,
						data : {
								"ID": $("#ID").val(),
								"password" : $("#password").val()
								} ,
								
						success : function(data) {
							if(data=='true'){
								//�Ұ���
								location.href="main";
							}else{
								//����
								alert("���̵� �������� �ʰų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
							}
						}
					});
				}
				
				
				else if($("#ID").val() == ""){
					alert("���̵� �Է����ּ���.");
					$("#ID").focus();
					return;
				}
				else if($("#password").val() == ""){
					alert("��й�ȣ�� �Է����ּ���.");
					$("#password").focus();
					return
				}
				
			})
			
		});
		
		function enterkey(){
			if(window.event.keyCode == 13){
				login();
			}
		}
		
		
	</script>
	
	
<body>

<div align="center" style="margin:0 auto;background-color:skyblue;height: 300px;width: 300px;" >
	
	
	<c:if test="${not empty sessionScope.memID }">
		<script type="text/javascript">
			alert("�̹� �α����� �Ǿ��ֽ��ϴ�.");
		</script>
		<meta http-equiv="refresh" content="0;url=main">
	</c:if>
	
	
	
	
	<br>
	<label>
		<h2 style="color:white">Angry's</h2>
		<h2 style="color:white">LOGIN</h2>
	</label>
	<br>
	
	
	
	<form action="login_action" method="POST" name="login_form">
	
		<!-- &nbsp;&nbsp;<label style="color: white;">���̵�</label>&nbsp;&nbsp; -->
		<input type="text" size="20" maxlength="20" placeholder="���̵�" id="ID" name="ID">
		<br><br>
		<!-- &nbsp;<label style="color: white;">��й�ȣ</label>&nbsp; -->
		<input type="password" size="20" maxlength="20" placeholder="��й�ȣ" id="password" name="password" onkeyup="enterkey()">
		<br><br>
		
		
		<input class="btn btn-outline-secondary" style="background-color: white" type="button" value="�α���" id="login">&nbsp;
		<input class="btn btn-outline-secondary" style="background-color: white;" type="button" value="ȸ������" onclick="location.href='signup'">
	</form>
	
	
</div>

</body>
</html>