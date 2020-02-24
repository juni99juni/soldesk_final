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

<script type="text/javascript">
	
	
	
	$(document).ready(function(){
		
		var ID = false;
		var password = false;
		var nickname = false;
		
		
		
		$("#ID").keyup(function(){
			
			
			
			var query = $("#ID").val();
			
			
			$.ajax({
				url : "ID_overlap_check?" ,
				type : "get" ,
				data : {"userID": query } ,
				success : function(data) {
					if($('#ID').val()==""){
						$('#idlabel').text('');
						$('#subbutton').attr('disabled', true);
					}
					else if(data=='false'){
						//�Ұ���
						$('#idlabel').text('��� �Ұ����� ���̵��Դϴ�.');
						ID = false;
						$('#subbutton').attr('disabled', true);
					}else{
						//����
						$('#idlabel').text('��� ������ ���̵��Դϴ�.');
						ID = true;
						if(ID==true && password==true && nickname==true){
							$('#subbutton').attr('disabled', false);
						}
						
					}
				}
			});
			
		});
		
		
		
		
		$("#nickname").keyup(function(){
			
			
			
			var query = $("#nickname").val();
			
			
			$.ajax({
				url : "nickname_overlap_check?" ,
				type : "get" ,
				data : {"nickname": query } ,
				success : function(data) {
					if($('#nickname').val()==""){
						$('#nicknamelabel').text('');
						$('#subbutton').attr('disabled', true);
					}
					else if(data=='false'){
						//�Ұ���
						$('#nicknamelabel').text('��� �Ұ����� �г����Դϴ�.');
						nickname = false;
						$('#subbutton').attr('disabled', true);
					}else{
						//����
						$('#nicknamelabel').text('��� ������ �г����Դϴ�.');
						nickname = true;
						if(ID==true && password==true && nickname==true){
							$('#subbutton').attr('disabled', false);
						}
						
					}
				}
			});
			
		});
		
		
		$('#password1').keyup(function(){
			if($('#password1').val()==$('#password2').val()){
				$('#tttt').text("��й�ȣ�� ��ġ�մϴ�.");
				//$('#subbutton').attr('disabled', false);
				password = true;
				if(ID==true && password==true && nickname==true){
					$('#subbutton').attr('disabled', false);
				}
			} else {
				$('#tttt').text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				//$('#subbutton').attr('disabled', true);
				password = false;
				$('#subbutton').attr('disabled', true);
			}
		});
		
		$('#password2').keyup(function(){
			if($('#password1').val()==$('#password2').val()){
				$('#tttt').text("��й�ȣ�� ��ġ�մϴ�.");
				//$('#subbutton').attr('disabled', false);
				password = true;
				if(ID==true && password==true && nickname==true){
					$('#subbutton').attr('disabled', false);
				}
			} else {
				$('#tttt').text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				//$('#subbutton').attr('disabled', true);
				password = false;
				$('#subbutton').attr('disabled', true);
			}
		});
		
		
		
		/* var Stringgg = "��й�ȣ�� ��ġ�մϴ�.";
		$('#nickname').keyup(function(){
			if(ID==true && password==true){
				alert('nickname ����!');
				$('#subbutton').attr('disabled', false);
			}
		}) */
		
		
	})
	//�г��� ���Խ�, 
</script>

<body>
	
	
	<div align="center" style="margin:0 auto;height: 1000px;width: 900px;" >
		<div align="center" style="background-color: skyblue;font-size: 50px;">
			<div style="width:220px; color: white; cursor: pointer;" onclick="location.href='login'">ANGRY'S</div>
		</div>
		
		
		
		
		
		
		
		<form action="signup_action" method="POST" style="margin-top: 100px">
			
			
			
			<input class="button" type="text" id="ID" name="ID" maxlength="15" placeholder="���̵�"><br>
			<label id="idlabel"></label><br>
			<input type="password" id="password1" name="password" maxlength="15" placeholder="��й�ȣ"><br><br>
			<input type="password" id="password2" maxlength="15" placeholder="��й�ȣ Ȯ��"><br>
			<label id="tttt"></label><br>
			<input type="text" id="nickname" name="nickname" maxlength="6" placeholder="�г���"><br>
			<label id="nicknamelabel"></label><br>
			<br>
			
			<input type="submit" value="ȸ������" id="subbutton" disabled="disabled" class="btn btn-outline-secondary">
			<input type="button" value="���ư���" onclick="location.href='login'" class="btn btn-outline-secondary">
			
		</form>
		
		
		
		
		
		
		
		
		<div style="text-align: center; background-color: #DDDDDD; height: 200px; width:100%; float:left;margin-top: 100px;">
			<label style="margin-top:80px">����Ư���� ���α� ����12�� 15, 5��(��ö�� 13-13)           ��ǥ��ȭ: 1544-0714          �������: ������</label>
		</div>
		
		
	</div>
	
	
</body>
</html>