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
<script type="text/javascript">
	
	function move_hunt(){
		var select_value = document.getElementById('hunt_menu');
		if(select_value.value=="1")   location.href='hunt?map_level=1&auto=false';  //�������� ��
		else if(select_value.value=="2")   location.href='hunt?map_level=2&auto=false';  //�Ѷ���б�
		else if(select_value.value=="3")   location.href='hunt?map_level=3&auto=false';  //�赿ȣ�� ������
	}
	
	
	function user_menu(){
		var select_value = document.getElementById('user_menu');
		if(select_value.value=="1")   location.href='user_info';  //ĳ���� ���� ����
		else if(select_value.value=="2")   location.href='inventory';  //�κ��丮
		//else if(select_value.value=="3")   alert("�̱����Դϴ�. ���� ���ϳ��� �����ϰڽ��ϴ�.");  //��ų ����
		//else if(select_value.value=="4")   alert("�̱����Դϴ�. ���� ���ϳ��� �����ϰڽ��ϴ�.");  //��ų ����
	}
	
	
	function shop_menu(){
		var select_value = document.getElementById('shop_menu');
		if(select_value.value=="1")   location.href='item_shop?location=weapon';  //���� ����
		else if(select_value.value=="2")   location.href='item_shop?location=armor';  //�� ����
		else if(select_value.value=="3")   location.href='item_shop?location=accessory';  //��ű� ����
		else if(select_value.value=="4")   location.href='item_shop?location=expen';  //�Ҹ�ǰ ����
	}
	
	
	function move_conveni(){
		var select_value = document.getElementById('conveni_menu');
		if(select_value.value=="1")   location.href='motel';  //���� ����
		else if(select_value.value=="2")   location.href='bank';  //���� ����
		//else if(select_value.value=="3")   alert("�̱����Դϴ�. ���� ���ϳ��� �����ϰڽ��ϴ�.");  //���� �Ұ���
		//else if(select_value.value=="4")   alert("�̱����Դϴ�. ���� ���ϳ��� �����ϰڽ��ϴ�.");  //���尣
		//�����Խ���, �̸��� �������� �����
	}
	
	/* hunt_menu, user_menu, shop_menu, conveni_menu */
	
</script>

<body>
	
	<%-- <c:set var="memID" value="${memID}" scope="session"/> --%>
	
	<c:if test="${empty sessionScope.memID }">
		<script type="text/javascript">
			alert("���񽺸� ���÷��� �α����� �ʿ��մϴ�.");
		</script>
		<meta http-equiv="refresh" content="0;url=login">
	</c:if>
	
	
	
	
	<div align="center" style="margin:0 auto;height: 1200px;width: 900px;" >
	
		<div align="center" style="background-color: skyblue;font-size: 50px;">
			<div style="width:220px; color: white; cursor: pointer;" onclick="location.href='main'">ANGRY'S</div>
		</div>
		
		
		<!-- ���� ���� -->
		<div style="background-color:#ffffff;height:300px;width:550px;float:left;">
			
			<div style="height:120px; width:100px;float:left;margin-top: 10px;">
				<img src="${pageContext.request.contextPath }/resources/${img}" style="float: left;">
				<label style="font-weight: bold">${nickname }</label>
			</div>
			
			
			 
			<table style="height:120px;width:210px;float:right;text-align: center; margin-left: 10px;margin-top: 10px;">
				<tr>	<th style="width:50px">
							����</th>		<td>${exp_info.user_level }</td>	</tr>
				<tr>	<th>����ġ</th>	<td>${exp_info.user_exp }</td>		</tr>
				<tr>	<th>������</th>	<td>${money_info.now_money }</td>	</tr>
				<tr>	<th>����</th>		<td>${money_info.bank_money }</td>	</tr>
			</table>
			
			
			
			<table style="height:120px;width:210px;float:right;text-align: center; margin-left: 10px;margin-top: 10px;">
				<tr><th style="width:50px">ü��</th>
					<td><div class="progress">
						<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50"
  							aria-valuemin="0" aria-valuemax="100" style="background-color:red; width:${HPpercent}%">
    						${user_info.user_nowHP} / ${user_info.user_maxHP}</div>
    					</div>
    				</td>
    			</tr>
				<tr>	<th>����</th>
					<td><div class="progress">
						<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
  							aria-valuemin="0" aria-valuemax="100" style="width:${MPpercent}%">
							${user_info.user_nowMP} / ${user_info.user_maxMP}</div>
    					</div>
    				</td>
				</tr>
				
				<tr>	<th>����</th>		<td>${exp_info.user_job }</td>			</tr>
				<tr>	<th>���õ�</th>	<td>${exp_info.user_jobexp }</td>		</tr>
			</table>
			
			
			<hr style="width:548px;height:0px;border:1px solid skyblue;float:left;margin-top:15px;margin-bottom:10px;"/>
			
			
			<table style="height:128px;width:300px;float:left;text-align: center;margin-left: 20px;">
				<tr>	<th style="width:50px">����</th><td>${user_weapon.item_name }</td>		</tr>
				<tr>	<th>��</th><td>${user_armor.item_name }</td>	</tr>
				<tr>	<th>��ű�</th><td>${user_acce.item_name }</td>	</tr>
			</table>
			
			<!-- user_weapon,user_armor,user_acce -->
			<table style="height:128px;width:210px;float:right;text-align: center;margin-left: 10px">
				<tr>	<th style="width:50px">���ݷ�</th><td>${user_info.user_att } + ${user_weapon.item_att }</td>	</tr>
				<tr>	<th>����</th><td>${user_info.user_def } + ${user_armor.item_att }</td>	</tr>
				<tr>	<th>�ӵ�</th><td>${user_info.user_spe } + ${user_acce.item_att }</td>		</tr>
			</table>
			
			
		</div>
		
		
		
		
		
		
		
		
			<hr style="width:0px;height:298px;border:1px solid skyblue;float:left;margin:auto"/>
		
		
		
		
		<!-- �̵��� �� -->
		<div style="background-color:#ffffff;height:300px;width:348px;float:left;">
			
			<br>
			
			<table style="height:250px;width:330px;text-align: center;"><tr><td>
				<label>����ϱ�</label></td>
				<td>
				<select class="form-control" id="hunt_menu">
					<option value=1>�������� ��</option>
					<option value=2>�Ѷ���б�</option>
					<option value=3>�赿ȣ�� ������</option>
				</select></td>
				<td><input type="button" value="�̵�" class="btn btn-outline-secondary" onclick="move_hunt()"></td></tr>
				
			
				<tr><td>
				<label>��������</label></td>
				<td>
				<select class="form-control" id="user_menu">
					<option value=1>ĳ���� ��������</option>
					<option value=2>�κ��丮</option>
					<!-- 
					<option value=3>��ų ����</option>
					<option value=4>��ų ����</option>
					 -->
				</select></td>
				<td><input type="button" value="�̵�" class="btn btn-outline-secondary" onclick="user_menu()"></td></tr>
				
			
			
				<tr><td>
				<label>����</label></td><td>
				<select class="form-control" id="shop_menu">
					<option value=1>���� ����</option>
					<option value=2>�� ����</option>
					<option value=3>��ű� ����</option>
					<option value=4>�Ҹ�ǰ ����</option>
				</select></td>
				<td><input type="button" value="�̵�" class="btn btn-outline-secondary" onclick="shop_menu()"></td></tr>
			
			
				<tr><td>
				<label>���ǽü�</label></td><td>
				<select class="form-control" id="conveni_menu">
					<option value=1>����</option>
					<option value=2>����</option>
					<!-- 
					<option value=3>�����Ұ���</option>
					<option value=4>���尣</option>
					 -->
				</select></td>
				<td><input type="button" value="�̵�" class="btn btn-outline-secondary" onclick="move_conveni()"></td></tr>
			</table>
		</div>
		
		
		
			<hr style="height:0px;width:898px;border: 1px solid skyblue;float:left;margin:auto"/>
		
		
		
		
		
		
		
		<!-- ���� ���� -->
		<div style="background-color:#ffffff;height:300px;width:100%;float:left;">
			<!-- ���ִ� �Ѹ��� -->
			<div style="width:550px;float:left;">
				<div style="height: 65px"><label style="margin-top: 20px"><b>������ �Ѹ���</b></label></div>
				<hr style="width:548px;height:0px;border:1px solid skyblue;float:left;margin:auto"/>
				<br>${castle_info.castle_text }
			</div>
			
			
			
			<hr style="width:0px;height:298px;border:1px solid skyblue;float:left;margin:auto"/>
			
			
			
			<!-- ���� ���� -->
			<div style="width:348px;float:left; text-align: center;">
				<div style="width:348px;float:left;">
					<div style="height: 65px"><label style="margin-top: 20px"><b>���� ����</b></label>
				</div>
				<hr style="width:346px;height:0px;border:1px solid skyblue;float:left;margin:auto"/>
				
				
				<table style="width: 320px;height: 203px; margin-top: 15px; margin-left: 28px">
					<tr><th style="width: 100px;">�� �̸�</th><td style="width: 248px;">${castle_info.castle_name }</td></tr>
					<tr><th>���ݷ�</th><td>${castle_info.castle_att }</td></tr>
					<tr><th>����</th><td>${castle_info.castle_def }</td></tr>
					<tr><th>ü��</th><td>${castle_info.castle_nowHP } / ${castle_info.castle_maxHP }</td></tr>
				</table>
			</div>
		</div>
		
		
		
		<hr style="height:0px;width:898px;border: 1px solid skyblue;float:left;margin:auto"/>
		
		
		
		<!-- �α� -->
		
		
		<div style="background-color:#ffffff;height:350px;width:100%;float:left;">
			<label style="font-weight: bolder;margin: 30px;">���� ����</label>
			<table class="table">
				<c:forEach var="log" items="${log }">
					<tr><td style="width: 700px">${log.log_text }</td><td style="width: 200px">${log.log_time }</td></tr>
				</c:forEach>
			</table>
		</div>
		
		
		<div style="text-align: center; background-color: #DDDDDD; height: 200px; width:100%; float:left;margin-top: 50px;">
			<label style="margin-top:80px">����Ư���� ���α� ����12�� 15, 5��(��ö�� 13-13)           ��ǥ��ȭ: 1544-0714          �������: ������</label>
		</div>
	</div>
	
</body>
</html>