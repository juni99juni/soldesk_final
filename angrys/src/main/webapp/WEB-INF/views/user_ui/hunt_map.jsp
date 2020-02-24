<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
	
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script type="text/javascript">
		
		
		
		
		$(document).ready(function(){
			 
			if(${auto_check} == true){
				$("#move_auto").prop("checked", true);
				$('#move_text').text('5�ʵ� �̵��մϴ�.');
				
				setTimeout(function(){
					
					location.href='hunt?map_level=${map_level}&auto=true';
				},5000);
				/* 
				if($("#move_auto").is('checked')==false){
					$('#move_text').text('');
					return false;
				}
				 */
			}else{
				$("#move_auto").prop("checked", false);
				$('#move_text').text('');
				
			}
			
			
			setTimeout(function() {
				$('#butt').attr('disabled', false);
			}, 5000);
			
			 
			$("#move_auto").on('click',function(){
				
				if($(this).prop('checked')){
					$('#move_text').text('5�ʵ� �̵��մϴ�.');
					
					setTimeout(function(){
						/* 
						if($("#move_auto").is('checked')==false){
							$('#move_text').text('');
							return false;
						}
						 */
						location.href='hunt?map_level=${map_level}&auto=true';
					},5000);				
				} else{
					$('#move_text').text('');
					return false;
				}
				
			});
			
			/* 
			$("#move_label").on('click',function(){
				
				if($("#move_auto").prop('checked')){
					$('#move_text').text('5�ʵ� �̵��մϴ�.');
					
					setTimeout(function(){
						location.href='hunt?map_level=${map_level}&auto=true';
					},5000);				
				}
				
			});
			 */
			
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
	
	
	
	<div align="center" style="margin:0 auto;width: 900px;" >
	
		<div align="center" style="background-color: skyblue;font-size: 50px;">
			<div style="width:220px; color: white; cursor: pointer;" onclick="location.href='main'">ANGRY'S</div>
		</div>
		
		
		<!-- ���� ���� -->
		<div style="height: 200px; width: 449px; background-color: white; float: left;">
			<label style="font-weight: bolder; margin-top: 15px;">${user_info.nick_name }</label>
			
			<div>
				<table class="table" style="width:220px;float:left;">
					<tr style="font-size: 12px"><th>�����</th><td>${user_weapon.item_name }</td></tr>
					<tr style="font-size: 12px"><th>��</th><td>${user_armor.item_name }</td></tr>
					<tr style="font-size: 12px"><th>��ű�</th><td>${user_acce.item_name }</td></tr>
					<tr style="font-size: 12px"><th></th><td></td></tr>
				</table>
				
				<table class="table" style="width:220px;float:right;">
					<tr style="font-size: 12px"><th>���ݷ�</th><td>${user_info.user_att }</td></tr>
					<tr style="font-size: 12px"><th>����</th><td>${user_info.user_def }</td></tr>
					<tr style="font-size: 12px"><th>���ǵ�</th><td>${user_info.user_spe }</td></tr>
					<tr style="font-size: 12px"><th></th><td></td></tr>
				</table>
			</div>
		</div>
		
		<hr style="width:0px;height:198px;border:1px solid skyblue;float:left;margin:auto"/>
		
		<!-- ���� ���� -->
		<div style="height: 200px; width: 449px; background-color: white; float: left;">
			<label style="font-weight: bolder; margin-top: 15px;">${monster_info.monster_name }</label>
			
			<div>
				<table class="table" style="width:220px;float:left;">
					<tr style="font-size: 12px"><th>�����</th><td> - </td></tr>
					<tr style="font-size: 12px"><th>��</th><td> - </td></tr>
					<tr style="font-size: 12px"><th>��ű�</th><td> - </td></tr>
					<tr style="font-size: 12px"><th></th><td></td></tr>
				</table>
				
				<table class="table" style="width:220px;float:right;">
					<tr style="font-size: 12px"><th>���ݷ�</th><td>${monster_info.monster_att }</td></tr>
					<tr style="font-size: 12px"><th>����</th><td>${monster_info.monster_def }</td></tr>
					<tr style="font-size: 12px"><th>���ǵ�</th><td>${monster_info.monster_spe }</td></tr>
					<tr style="font-size: 12px"><th></th><td></td></tr>
				</table>
			</div>
		</div>
		
		
			<hr style="height:0px;width:898px;border: 1px solid skyblue;float:left;margin:auto"/>
		
		
		<c:set var="turn" value="0"/>
		<c:set var="turn_bar" value="1"/>
		
		<% 
			//int user_HP, monster_HP;
			//userFightDTO user = (userFightDTO)request.getAttribute("user_info");
			//monsterDTO monster = (monsterDTO)request.getAttribute("monster_info");
		%>
		
		<c:set var="user_HP" value="${user_info.user_nowHP }"/>
		<c:set var="user_MP" value="${user_info.user_nowMP }"/>
		<c:set var="monster_HP" value="${monster_info.monster_nowHP }"/>
		<c:set var="monster_MP" value="${monster_info.monster_nowMP }"/>
		
		
		
		<%-- <c:out value="${(user_HP/user_info.user_maxHP)*100 }"/> --%>
		<c:forEach var="fight" items="${fight }">
			<%-- <c:set target="${turn }" value="${turn +1 }"/> --%>
			
			<c:set var="user_HP_percent" value="${(user_HP/user_info.user_maxHP)*100 }"/>
			<c:set var="user_MP_percent" value="${(user_MP/user_info.user_maxMP)*100 }"/>
			<c:set var="monster_HP_percent" value="${(monster_HP/monster_info.monster_maxHP)*100 }"/>
			<c:set var="monster_MP_percent" value="${(monster_MP/monster_info.monster_maxMP)*100 }"/>
			
			<!-- �� Ƚ�� �˷��ֱ� -->
			<c:set var="turn" value="${turn+1 }"/>
			
			<div style="float: top;margin:auto">
				<c:if test="${ (turn mod 2) == 1 }">
					<c:if test="${turn_bar ne 1 }">
						<br>
						<%-- <%user_HP=%>${fight.nowHP}<%;
						
						monster_HP = monster.getMonster_maxHP();
						%> --%>
						<!-- ü�� ��Ȳ -->
						<div style="width: 100%; float:left; margin-bottom: 20px; margin-top:20px;">
							<div style="width:300px; float:left; margin-left:50px;">
								<div class="progress">
									<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50"
  										aria-valuemin="0" aria-valuemax="100" style="background-color:red; width:${user_HP_percent}%">
    									${user_HP} / ${user_info.user_maxHP}</div>
    							</div>
    							<div class="progress">
									<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
  										aria-valuemin="0" aria-valuemax="100" style="width:${user_MP_percent}%">
										${user_MP} / ${user_info.user_maxMP}</div>
    							</div>
							</div>
							
							
							
							<div style="width:300px; float:right;margin-right:50px;">
								<div class="progress">
									<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50"
  										aria-valuemin="0" aria-valuemax="100" style="background-color:red; width:${monster_HP_percent}%">
    									${monster_HP} / ${monster_info.monster_maxHP}</div>
    							</div>
    							<div class="progress">
									<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
  										aria-valuemin="0" aria-valuemax="100" style="width:${monster_MP_percent}%">
										${monster_MP} / ${monster_info.monster_maxMP}</div>
    							</div>
							</div>
						</div>
						<hr style="height:0px;width:898px;border: 1px solid skyblue;float:left;margin:auto"/>	
					</c:if>
					
					<label style="margin-top: 5px;"><c:out value="${turn_bar }"/> �� ����</label>
					<hr style="height:0px;width:898px;border: 1px solid skyblue;float:top;margin:auto"/>
					<c:set var="turn_bar" value="${turn_bar+1 }"/>
				</c:if>
			</div>
			
			
			
			<!-- �ο� ���� ��� -->
			<div style="background-color: white; width: 900px;float:left; margin:auto;">
			<br>
				<!-- ������ ������ �� -->
				<c:if test="${fight.whois eq user_info.nick_name }">
					<div style="text-align: left;">
						<img src="${pageContext.request.contextPath }/resources/${img}" style="float: left;">
						<label style="margin-left:30px;">${fight.whois }�� ${fn:length(fight.dmg)} ȸ ����!</label><br>
						
						
						<!-- DTO ���� dmg list -->
						<div style="text-align: left; width: 400px;float: left;">
							<c:forEach var="dmg" items="${fight.dmg }">
								<label style="margin-left:30px">${fight.whois}�� �⺻ ����! ${dmg } �������� ������.</label><br>
							</c:forEach>
						</div>
						<c:set var="monster_HP" value="${fight.nowHP }"/>
					</div>
				</c:if>
				
				
				
				<!-- ������ ���� -->
				<c:if test="${fight.whois eq monster_info.monster_name }">
					<div style="text-align: right; margin:auto;">
						<img src="${pageContext.request.contextPath }/resources/${img}" style="float: right;">
						<label style="margin-right:30px">${fight.whois }�� ${fn:length(fight.dmg)} ȸ ����!</label><br>
						
						
						<!-- DTO ���� dmg list���� �������� �̾Ƴ���. -->
						<div>
							<c:forEach var="dmg" items="${fight.dmg }">
								<label style="margin-right:30px">${fight.whois}�� �⺻ ����! ${dmg } �������� ������.</label><br>
							</c:forEach>
						</div>
						<c:set var="user_HP" value="${fight.nowHP }"/>
					</div>
				</c:if>
				
				
				
				
				
				
				
				
				
				<!-- ���� ��� -->
				<c:if test="${fight.win eq true }"><br>
					<div style="width:100%; float:left;"><b>${fight.whois }�� �¸��ߴ�!</b></div><br>
					<div style="width: 100%; float:left; margin-bottom: 20px; margin-top:20px;">
							<div style="width:300px; float:left; margin-left:50px;">
								<div class="progress">
									<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50"
  										aria-valuemin="0" aria-valuemax="100" style="background-color:red; width:${user_HP_percent}%">
    									${user_HP} / ${user_info.user_maxHP}</div>
    							</div>
    							<div class="progress">
									<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
  										aria-valuemin="0" aria-valuemax="100" style="width:${user_MP_percent}%">
										${user_MP} / ${user_info.user_maxMP}</div>
    							</div>
							</div>
							
							
							
							<div style="width:300px; float:right;margin-right:50px;">
								<div class="progress">
									<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50"
  										aria-valuemin="0" aria-valuemax="100" style="background-color:red; width:${monster_HP_percent}%">
    									${monster_HP} / ${monster_info.monster_maxHP}</div>
    							</div>
    							<div class="progress">
									<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
  										aria-valuemin="0" aria-valuemax="100" style="width:${monster_MP_percent}%">
										${monster_MP} / ${user_info.user_maxMP}</div>
    							</div>
							</div>
						</div>
						<hr style="height:0px;width:898px;border: 1px solid skyblue;float:left;margin:0 auto"/>	
					<br>
					<c:if test="${fight.whois eq user_info.nick_name }">
						<div style="width: 750px;height: 200px;text-align: center;margin-top: 200px;
						border: 1px solid skyblue;">
							<div style="width: 30%;height:100%;background-color: white; border: 1px solid skyblue; float: left;margin:0 auto">
								<div style="margin: 70px 10px 70px 10px;width:200px ;height: 50px"><label>�������<br>�¸�!</label></div>
							</div>
							<div style="width: 70%;height:100%;background-color: white; border: 1px solid skyblue; float: right">
								<div style="margin: 45px 70px 45px 70px">
									<label>${monster_info.monster_gold } ��带 ȹ���ߴ�!</label><br>
									<label>${monster_info.monster_exp } ����ġ�� ȹ���ߴ�!</label><br>
									<label>${monster_info.monster_jobexp } ���õ��� ȹ���ߴ�!</label><br>
									<c:if test="${!empty fight.root_item }">
										<label><b>${fight.root_item }</b> �� ȹ���ߴ�!</label>
									</c:if>
								</div>
							</div>
						</div>
					</c:if>
					
					<c:if test="${fight.whois eq monster_info.monster_name }">
						<div style="width: 750px;height: 200px;text-align: center;margin-top: 150px;
						border: 1px solid skyblue">
							<div style="width: 30%;height:100%;background-color: white; border: 1px solid skyblue; float: left;margin:0 auto">
								<div style="margin: 70px 10px 70px 10px;width:200px ;height: 50px"><label>�������<br>�й�...</label></div>
							</div>
							<div style="width: 70%;height:100%;background-color: white; border: 1px solid skyblue; float: right">
								
								<div style="margin: 45px 70px 45px 70px">
									������ ����� ������ ${fight.money } ��带 �Ҿ����ϴ�.<br>
									�������� ġ���Ͻô°��� ��õ�帳�ϴ�.
								</div>
								
								
							</div>
						</div>
					</c:if>
					
					<%-- 
					<c:if test="${fight.whois eq monster_info.monster_name }">
						<div style="width: 750px;height: 200px;text-align: center;background-color: skyblue;margin-top: 20px;
						border: 1px solid skyblue">
							<div style="width: 30%;height:100%;background-color: white; border: 1px solid skyblue; float: left;">
								<div style="margin:0 auto"><label>�������<br>�й�...</label></div>
							</div>
							<div style="width: 70%;height:100%;background-color: white; border: 1px solid skyblue; float: left">
								������ ����� ������ ${fight_info.gold } ��带 �Ҿ����ϴ�.<br>
								�������� ġ���Ͻô°��� ��õ�帳�ϴ�.
								
							</div>
						</div>
					</c:if>
					 --%>
					
				</c:if>
				
				
				<br>
			</div>
			
		</c:forEach>
		
	
		<input type="checkbox" id="move_auto"><label id="move_label" name="move_label">�ڵ����� �̵��ϱ�</label><br>
		<label id="move_text"></label><br>
		<input class="btn btn-outline-secondary" type="button" value="�����ϱ�" size="20" id="butt" disabled="disabled" onclick="location.href='hunt?map_level=${map_level}&auto=false'">
		<input class="btn btn-outline-secondary" type="button" value="��������" size="20" onclick="location.href='main'">
		<input class="btn btn-outline-secondary" type="button" value="��������" size="20" onclick="location.href='motel'">
		<input type="hidden" value="${auto_check }" name="auto_check" id="auto_check">	
		<br><br>
		
		
		
		<div style="text-align: center; background-color: #DDDDDD; height: 200px;">
			<label style="margin-top:80px">����Ư���� ���α� ����12�� 15, 5��(��ö�� 13-13)           ��ǥ��ȭ: 1544-0714          �������: ������</label>
		</div>
		
	</div>
	
	
	

	
	
</body>
</html>