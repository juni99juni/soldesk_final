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
			<label style="margin-left: 30px"><b>ĳ���� ����</b></label>
		</div>
		
		
		
		
		
		<div style="height: 50px; width: 50%; float: left; margin-top: 50px; text-align: right;">
			<label style="margin-right: 30px"><b>ĳ���� ���</b></label>
		</div>
		
		
			<hr style="height:0px;width:898px;border: 1px solid skyblue;float:left;margin:auto"/>
		
		
		
		
		
		<!-- ĳ���� ���� -->
		<div style="float:left; width: 449px;height: 295px">
			
			<table class="table" style="text-align: center;width: 50%;float: left;">
				<tr><th style="width:90px">
						�г���</th>	<td>${nickname }</td></tr>
				<tr><th>HP</th>		<td>${user_info.user_nowHP }/${user_info.user_maxHP }</td></tr>
				<tr><th>MP</th>		<td>${user_info.user_nowMP }/${user_info.user_maxMP }</td></tr>
				<tr><th>���ݷ�</th>	<td>${user_info.user_att }</td></tr>
				<tr><th>����</th>	<td>${user_info.user_def }</td></tr>
				<tr><th>���ǵ�</th>	<td>${user_info.user_spe }</td></tr>
				
			</table>
			
			<table class="table" style="text-align: center;width: 50%;float: left;">
				<tr><th style="width:90px">
						����</th>		<td>${exp_info.user_job }</td></tr>
				<tr><th>����</th>		<td>${exp_info.user_level }</td></tr>
				<tr><th>����ġ</th>	<td>${exp_info.user_exp }</td></tr>
				<tr><th>���õ�</th>	<td>${exp_info.user_jobexp }</td></tr>
				<tr><th>������</th>	<td>${money_info.now_money }</td></tr>
				<tr><th>����</th>		<td>${money_info.bank_money }</td></tr>
			</table>
		</div>
		
		
			<hr style="width:0px;height:293px;border:1px solid skyblue;float:left;margin:auto"/>
		
		
		
		<!-- ĳ���� ���â -->
		<div style="float:left; width: 449px;height: 200px">
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
		
		<hr style="height:0px;width:898px;border: 1px solid skyblue;float:left;margin:auto"/>
		
		
		<div style="margin-top: 75px;float: left;text-align: center;width: 100%">
			<input class="btn btn-outline-secondary" type="button" value="��������" size="20" onclick="location.href='main'">
		</div>
		
		<div style="text-align: center; background-color: #DDDDDD; height: 200px; width:100%; float:left;margin-top: 100px;">
			<label style="margin-top:80px">����Ư���� ���α� ����12�� 15, 5��(��ö�� 13-13)           ��ǥ��ȭ: 1544-0714          �������: ������</label>
		</div>
	</div>
	
</body>
</html>