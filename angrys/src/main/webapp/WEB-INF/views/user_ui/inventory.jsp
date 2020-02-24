<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script type="text/javascript">
		
	function equip(){
		
		//pk_no�� ������
		var radio_btn = $(':input[name=user_item]:radio:checked').val();
		
		
		if( radio_btn ){
			alert(radio_btn+"�� �����߽��ϴ�");
			
		}
		else if(radio_btn == null){
			alert("�������� ���õ��� �ʾҽ��ϴ�.");
			return false;
        }
		
		
		
		$.ajax({
			url : "item_category_check" ,
			type : "POST" ,
			data : {	"pk_no": radio_btn	} ,
					
			success : function(data) {
				//consoles
				if(data=='true'){
					//����
					document.getElementById('user_item_form').submit();
				}else{
					//�Ұ���
					alert("������ �� ���� ������ �������Դϴ�.");
					
				}
			}
		});
	}
		
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
		
		
		
		<div style="height: 50px; width: 50%; float: left; margin-top: 50px; text-align: left;">
			<label style="margin-left: 30px"><b>ĳ���� ���</b></label>
		</div>
		
		
		
		
		
		<div style="height: 50px; width: 50%; float: left; margin-top: 50px; text-align: right;">
			<label style="margin-right: 30px"><b>�κ��丮</b></label>
		</div>
		
		
			<hr style="height:0px;width:898px;border: 1px solid skyblue;float:left;margin:auto"/>
		
		
		
		
		
		<!-- ĳ���� ���� -->
		<div style="float:left; width: 449px;height: 295px">
			
			<table class="table" style="width: 100%; margin-top: 49px;text-align: center;">
				<tr><th style="width:90px;"></th>
					<th style="width:199px;">�̸�</th>
					<th style="width:80px;">����</th>
					<th style="width:80px;">����</th></tr>
				<tr><th>�����</th>	<td>${user_weapon.item_name }</td>	<td>${user_weapon.item_att }</td>	<td>${user_weapon.item_wei }</td></tr>
				<tr><th>��</th>	<td>${user_armor.item_name }</td>	<td>${user_armor.item_att }</td>	<td>${user_armor.item_wei }</td></tr>
				<tr><th>��ű�</th>	<td>${user_acce.item_name }</td>	<td>${user_acce.item_att }</td>	<td>${user_acce.item_wei }</td></tr>
				<!-- ��ĭ -->
				<tr><th>	</th>	<td>		</td>	<td></td>	<td></td></tr>
				
			</table>
			
			
		</div>
		
		
			<hr style="width:0px;height:293px;border:1px solid skyblue;float:left;margin:auto"/>
		
		
		
		<!-- ĳ���� ���â -->
		<div style="float:left; width: 449px;height: 200px">
			<form id="user_item_form" action="equipment_item" method="POST">
				<table class="table" style="width: 100%; text-align: center; font-size: 12px;float: left;">
					<tr>
					<th style="width:70px;">����</th>
					<th style="width:214px;">������ �̸�</th>
					<th style="width:118px;">����</th>
					</tr>
					
					
					
					<c:forEach var="user_list" items="${user_list }">
						<tr><td>
						<input type="radio" name="user_item" value="${user_list.pk_no }">
						</td>
						<td>${user_list.item_name }</td><td>${user_list.price }</td></tr>
					</c:forEach>
				</table>
				
			</form>
		</div>
		
		<hr style="height:0px;width:898px;border: 1px solid skyblue;float:left;margin:auto"/>
		
		
		<div style="margin-top: 75px;float: left;text-align: center;width: 100%">
			<input class="btn btn-outline-secondary" type="button" value="����ϱ�" size="20" onclick="equip()">
			<input class="btn btn-outline-secondary" type="button" value="��������" size="20" onclick="location.href='main'">
		</div>
		
		<div style="text-align: center; background-color: #DDDDDD; height: 200px; width:100%; float:left;margin-top: 100px;">
			<label style="margin-top:80px">����Ư���� ���α� ����12�� 15, 5��(��ö�� 13-13)           ��ǥ��ȭ: 1544-0714          �������: ������</label>
		</div>
	</div>
	
</body>
</html>