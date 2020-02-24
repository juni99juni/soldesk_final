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
		function move_conveni(){
			var money = document.getElementById('want_money');
			var select_value = document.getElementById('bank_menu');
			//var now_money = parseInt(${user_money.now_money});
			//alert('${user_money.now_money}')
			
			
			
			if(money.value == ""){
				alert('���� �Է����ֽñ� �ٶ��ϴ�.');
				money.focus();
				return;
			}
			
			
			if(select_value.value == "2" && (parseInt(money.value) > parseInt(document.getElementById('now_money').value))){
				alert('���Ͻô� �ݾ��� �����ϰ����� �ʽ��ϴ�.');
				money.focus();
				return;
			}
			
			
			
			if(select_value.value == "4" && (parseInt(money.value) > parseInt(document.getElementById('bank_money').value))){
				alert('���Ͻô� �ݾ��� ����Ǿ����� �ʽ��ϴ�.');
				money.focus();
				return;
			}
			
			
			
			document.getElementById('bank_form').submit();
		}
		
		
		$(document).ready(function(){
			
			
			
			$('#bank_menu').on('change',function(){
				
				if(this.value==1){  //��ü �Ա�
					
					//$('input[name=want_money]').attr('value',${user_money.now_money});
					
					$('#want_money').val(${user_money.now_money});
					$("#want_money").attr("readonly",true);
				}
				else if(this.value==2){  //�����ݾ� �Ա�
					
					//$('input[name=want_money]').attr('value',0);
					
					$('#want_money').val(0);
					$("#want_money").attr("readonly",false);
				}
				else if(this.value==3){  //��ü ���
					
					
					//$('input[name=want_money]').attr('value',${user_money.bank_money});
					$('#want_money').val(${user_money.bank_money});
					$("#want_money").attr("readonly",true);
				}
				else if(this.value==4){  //�����ݾ� ���
					
					//$('input[name=want_money]').attr('value',0);
					
					$('#want_money').val(0);
					$("#want_money").attr("readonly",false);
				}
			});
		});
		
	</script>
	
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
		
		
		<div style="margin-top: 50px; height: 400px;">
		<form action="bank_action" method="POST" id="bank_form">
			<table style="width:300px">
			
			
			<tr><td>���� �ݾ�</td>
			<td><input type="text" readonly="readonly" size="20" value="${user_money.now_money }" id="now_money" style="text-align: right;"> </td><td>�޷�</td>
			</tr>
			
			
			<tr>&nbsp;<td></td><td></td><td>&nbsp;</td></tr>
			
			
			<tr><td>���� �׼�</td>
			<td><input type="text" readonly="readonly" size="20" value="${user_money.bank_money }" id="bank_money" style="text-align: right;"> </td><td>�޷�</td>
			</tr>
			
			
			<tr>&nbsp;<td></td><td></td><td>&nbsp;</td></tr>
			
			
				<tr><td>ó�� ����</td>
				<td><select class="form-control" id="bank_menu" name="bank_menu" style="width:168px;">
						<option value=1>���� ����</option>
						<option value=2>���� �ݾ� ����</option>
						<option value=3>���� ���</option>
						<option value=4>���� �ݾ� ���</option>
				</select></td><td>&nbsp;</td>
				
				
				<tr>&nbsp;<td></td><td></td><td>&nbsp;</td></tr>
				
				
				<tr><td>ó�� �ݾ�</td>
				<td><input type="text" readonly="readonly" id="want_money" name="want_money" size="20" style="text-align: right;" 
				 value="${user_money.now_money }" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td><td>�޷�</td>
			
			
			
			</table>
			
		</form>
			
			<div style="margin-top: 50px;">
				<input class="btn btn-outline-secondary" type="button" value="ó���ϱ�" size="20" onclick="move_conveni()">
				<input class="btn btn-outline-secondary" type="button" value="��������" size="20" onclick="location.href='main'">
			</div>
		</div>
		
		
		
		
		<div style="text-align: center; background-color: #DDDDDD; height: 200px;">
			<label style="margin-top:80px">����Ư���� ���α� ����12�� 15, 5��(��ö�� 13-13)           ��ǥ��ȭ: 1544-0714          �������: ������</label>
		</div>
	</div>
	
	
	
	
</body>
</html>