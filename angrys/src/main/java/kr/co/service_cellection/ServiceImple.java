package kr.co.service_cellection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.DAO.DAOImple;
import kr.co.DTO.castleInfoDTO;
import kr.co.DTO.fightDTO;
import kr.co.DTO.fightEndDTO;
import kr.co.DTO.itemInfoDTO;
import kr.co.DTO.logDataDTO;
import kr.co.DTO.monsterDTO;
import kr.co.DTO.userExpDTO;
import kr.co.DTO.userFightDTO;
import kr.co.DTO.userLoginDTO;
import kr.co.DTO.userMoneyDTO;

@Repository
public class ServiceImple {
	
	@Autowired
	DAOImple dao;
	
	
	
	//������
	public List<userLoginDTO> select_user(){
		
		
		return dao.select_user();
	}
	
	
	
	
	//ȸ������ ó��
	public void signup(userLoginDTO user) {
		//������ �� ���̺� - user_table, user_info, user_money, user_exp
		dao.signup_user_table(user);  //user_table, �⺻ �α��� ���̺�
		
		dao.signup_user_info(user);
		
		dao.signup_user_money(user);
		
		dao.signup_user_exp(user);
		
		dao.set_log(dao.get_nickname(user.getID()) + "�Բ��� angry ���迡 �¾�̽��ϴ�!");
		
	}
	
	
	
	//�α��� ���̵�, ��й�ȣ üũ
	public boolean login(userLoginDTO user) {
		userLoginDTO me = dao.login(user);
		
		
		if(me != null) {
			//���̵�, ��й�ȣ�� ��ġ�� ��
			dao.set_log(dao.get_nickname(user.getID()) + "�Բ��� angry ����� ���ƿ��̽��ϴ�!");
			return true;
		}else {
			//���̵�, ��й�ȣ�� ��ġ���� ���� ��
			return false;
		}
		
	}
	
	
	
	
	
	
	
	
	
	public String get_nickname(String ID) {
		
		
		return dao.get_nickname(ID);
	}
	
	
	
	public userFightDTO user_info(String ID) {
		return dao.user_info(ID);
	}
	
	public monsterDTO monster_info(String monster_name) {
		return dao.monster_info(monster_name);
	}
	
	
	
	public userMoneyDTO money_info(String ID) {
		return dao.money_info(ID);
	}
	
	
	public userExpDTO exp_info(String ID) {
		return dao.exp_info(ID);
	}
	
	
	
	
	
	
	
	
	public ArrayList<fightDTO> hunt_map(String monster_name, String userID) {
		//���� ������ ���� ���� �Ѱ��־����
		
		//String monster_name = MonsterName(map);
		userFightDTO user = dao.user_info(userID);
		monsterDTO mon = dao.monster_info(monster_name);
		
		int user_HP = user.getUser_nowHP();
		int mon_HP = mon.getMonster_maxHP();
		int user_MP = user.getUser_nowMP();
		int mon_MP = mon.getMonster_maxMP();
		
		ArrayList<fightDTO> fight = new ArrayList<fightDTO>();
		//System.out.println("user.getEquip_weapon() : " + user.getEquip_weapon());
		//System.out.println("item_info(user.getEquip_weapon()).getItem_att() : " + item_info(user.getEquip_weapon()).getItem_att());
		
		int user_waepon_att = item_info(user.getEquip_weapon()).getItem_att();
		int user_armor_att = item_info(user.getEquip_armor()).getItem_att();
		int user_accessory_att = item_info(user.getEquip_accessory()).getItem_att();
		
		
		
		while(true) {
			
			
			if((user.getUser_spe()-mon.getMonster_spe()) >= 0) {  //������ �ӵ��� �� ������ ���
				
				//�ο� ������ ���� DTO ����
				fightDTO user_dto = new fightDTO();
				fightDTO mon_dto = new fightDTO();
				
				ArrayList<Integer> user_dmgList = new ArrayList<Integer>();
				ArrayList<Integer> monster_dmgList = new ArrayList<Integer>();
				
				
				
				
				for(int i=0; i<=user.getUser_spe()+user_accessory_att; i += 100) {
					//������ ����
					int result = (int)(Math.random() * user.getUser_spe()) + (((user.getUser_att()/2)+user_waepon_att) - (mon.getMonster_def()/4));
					if(result <=0) result = 1;
					
					user_dmgList.add(result);  //������ ��� ����
					mon_HP -= result;  //������ ����
				}
				
				user_dto.setNowHP(mon_HP);
				user_dto.setDmg(user_dmgList);  //fightDTO �� ������ ����Ʈ�� ����
				user_dto.setWhois(user.getNick_name());  //user�� ���������� �˸�
				
				
				
				//���� ����
				if(mon_HP <= 0) {  //���Ͱ� �׾��ٸ�
					user_dto.setNowHP(0);
					user_dto.setWin(true);
					user_dto.setRoot_item(fight_win(user_HP, user_MP, mon, userID));
					fight.add(user_dto);
					break;
				}
				
				fight.add(user_dto);  //�ش� dto�� List�� ���մ�.
				
				
				
				
				
				
				for(int i=0; i<=mon.getMonster_spe(); i += 100) {
					int result = (int)(Math.random() * user.getUser_spe()) + ((mon.getMonster_att()/2) - ((user.getUser_def() + user_armor_att)/4));
					if(result <=0) result = 1;
					monster_dmgList.add(result);
					user_HP -= result;
				}
				
				mon_dto.setNowHP(user_HP);
				mon_dto.setDmg(monster_dmgList);  //fightDTO �� ������ ����Ʈ�� ����
				mon_dto.setWhois(mon.getMonster_name()); //monster�� ���������� �˸�
				
				
				//System.out.println("user_HP : " + user_HP);
				//���� ����
				if(user_HP <= 0) {  //������ �׾��ٸ�
					mon_dto.setNowHP(0);
					mon_dto.setWin(true);
					mon_dto.setMoney(fight_lose(user_HP, user_MP, userID));
					fight.add(mon_dto);
					break;
				}
				fight.add(mon_dto);  //�ش� dto�� List�� ���մ�.
				
				
				
				
				
				
			} else {  //������ �ӵ��� �� ������ ���
				ArrayList<Integer> user_dmgList = new ArrayList<Integer>();
				ArrayList<Integer> monster_dmgList = new ArrayList<Integer>();
				
				fightDTO user_dto = new fightDTO();
				fightDTO mon_dto = new fightDTO();
				
				
				for(int i=0; i<=mon.getMonster_spe(); i += 100) {
					int result = (int)(Math.random() * user.getUser_spe()) + ((mon.getMonster_att()/2) - ((user.getUser_def() + user_armor_att)/4));
					if(result <=0) result = 1;
					monster_dmgList.add(result);
					user_HP -= result;
				}
				
				mon_dto.setNowHP(user_HP);
				mon_dto.setDmg(monster_dmgList);  //fightDTO �� ������ ����Ʈ�� ����
				mon_dto.setWhois(mon.getMonster_name()); //monster�� ���������� �˸�
				
				
				
				//���� ����
				if(user_HP <= 0) {  //������ �׾��ٸ�
					mon_dto.setNowHP(0);
					mon_dto.setWin(true);
					mon_dto.setMoney(fight_lose(user_HP, user_MP, userID));
					fight.add(mon_dto);
					break;
				}
				fight.add(mon_dto);  //�ش� dto�� List�� ���մ�.
				
				
				
				
				
				
				for(int i=0; i<=user.getUser_spe()+user_accessory_att; i += 100) {
					int result = (int)(Math.random() * user.getUser_spe()) + (((user.getUser_att()/2)+user_waepon_att) - (mon.getMonster_def()/4));
					if(result <=0) result = 1;
					user_dmgList.add(result);
					mon_HP -= result;
				}
				
				user_dto.setNowHP(mon_HP);
				user_dto.setDmg(user_dmgList);  //fightDTO �� ������ ����Ʈ�� ����
				user_dto.setWhois(user.getNick_name()); //user�� ���������� �˸�
				
				
				//���� ����
				if(mon_HP <= 0) {  //���Ͱ� �׾��ٸ� 
					user_dto.setNowHP(0);
					user_dto.setWin(true);
					user_dto.setRoot_item(fight_win(user_HP, user_MP, mon, userID));
					fight.add(user_dto);
					break;
				}
				
				fight.add(user_dto);  //�ش� dto�� List�� ���մ�.
			}
			
			
		}
		
		
		
		return fight;
	}
	
	
	
	public String MonsterName(int map) {
		
		Random ran = new Random(); 
		int monsterRan = ran.nextInt(2);
		String monster_name = null;
		
		//System.out.println("moster_random_number : " + monsterRan);
		
		if(map == 1) {
			if(monsterRan == 1) {
				monster_name = "����";
			} else {
				monster_name = "����";
			}
		}
		
		else if(map == 2) {
			if(monsterRan == 1) {
				monster_name = "����";
			} else {
				monster_name = "�����";
			}
		}
		
		else if(map == 3) {
			if(monsterRan == 1) {
				monster_name = "�赿ȣ";
			} else {
				monster_name = "���߾�";
			}
		}
		
		//System.out.println("service monster_name : " + monster_name);
		
		return monster_name;
	}
	
	
	
	
	
	
	public itemInfoDTO item_info(int item_no) {
		
		itemInfoDTO item = dao.item_info(item_no);
		
		return item;
	}
	
	
	
	
	
	
	
	public String fight_win(int HP, int MP, monsterDTO monster, String userID) {
		
		fightEndDTO result = new fightEndDTO();
		itemInfoDTO item_result = get_item(userID);
		String item_name = item_result.getItem_name();
		
		//���̵� ����
		result.setUser_name(userID);
		
		//��Ʈ ������ ����
		result.setItem_result(item_result.getItem_no());
		
		
		//������ ����
		item_result.setItem_name(userID);
		if(item_result.getItem_no() != 0) {
			dao.root_item(item_result);
		}
		dao.set_log(dao.get_nickname(userID) + "�Բ��� " + item_name + "�� �����̽��ϴ�!");
		
		
		
		//HP,MP ����
		result.setHP(HP);
		result.setMP(MP);
		
		dao.set_HPMP(result);
		
		
		//���, ����ġ, ���õ� ȹ��
		result.setMoney(monster.getMonster_gold());
		dao.set_gold(result);
		
		
		result.setExp(monster.getMonster_exp());
		result.setJobexp(monster.getMonster_jobexp());
		dao.set_exp(result);
		
		
		if(item_result.getItem_no() != 0 && item_result.getItem_category() != "potion") {
			return item_name;
		} else {
			return "";
		}
	}
	
	
	
	
	public int fight_lose(int HP, int MP, String userID) {
		
		fightEndDTO result = new fightEndDTO();
		
		
		result.setHP(HP);
		result.setHP(MP);
		
		result.setUser_name(userID);
		
		
		dao.set_HPMP(result);
		
		
		result.setMoney(getGold(userID)/2);
		
		dao.hunt_lose_set_gold(result);
		
		
		return result.getMoney();
	}
	
	
	
	
	//������ ��Ʈ ȹ��
	public itemInfoDTO get_item(String ID) {
		//int result = 0;
		itemInfoDTO item = new itemInfoDTO();
		
		Random ran = new Random(); 
		int monsterRan = ran.nextInt(2);
		
		if(dao.user_item_count(ID) <= 20) {
			
			
			if(((int)(Math.random() * 100 )+1) < 100) {
				List<itemInfoDTO> item_list =  dao.get_item_list();
				
				item = item_list.get(ran.nextInt(item_list.size()));
				//result = item.getItem_no();
				
				System.out.println("item random no : " + ran.nextInt(item_list.size()));
				//System.out.println("item no : " + result);
			}
		}
		
		
		
		return item;
		
	}
	
	
	
	
	
	
	
	
	
	//nowMoney�� �˷��ִ� �޼ҵ�
	public int getGold(String ID) {
		
		int result = dao.getGold(ID);
		
		System.out.println("result : " + result);
		
		return result;
	}
	
	
	public void heal(String ID) {
		userMoneyDTO money = new userMoneyDTO();
		
		int nowMoney = getGold(ID) / 10;
		money.setNow_money(nowMoney);
		money.setUser_name(ID);
		
		dao.heal(money);
	}
	
	
	
	
	
	
	
	
	//���� �� ó��
	public void use_bank(int value, int money, String ID) {
		userMoneyDTO moneyDTO = new userMoneyDTO();
		
		moneyDTO.setUser_name(ID);
		moneyDTO.setNow_money(money);
		
		
		if(value==1) {  //���� ����
			dao.all_save_money(ID);
		} else if(value==2) {  //�κ� ����
			dao.part_save_money(moneyDTO);
		} else if(value==3) {  //���� ���
			dao.all_out_money(ID);
		} else if(value==4) {  //�κ� ���
			dao.part_out_money(moneyDTO);
		}
	}
	
	
	
	
	
	
	//���� �κ��丮�� �ִ� ������ ����Ʈ
	public List<itemInfoDTO> user_item_list(String ID){
		/*
		List<itemInfoDTO> item_list = new ArrayList<itemInfoDTO>();
		List<Integer> item_num_list = dao.get_item_no(ID);
		*/
		List<itemInfoDTO> item_list = dao.get_item_no(ID);
		
		
		//for(int i=0; i<item_num_list.size(); i++) {
		for(int i=0; i<item_list.size(); i++) {
			//item_list.add(dao.get_user_item(item_num_list.get(i)));
			itemInfoDTO item = dao.get_user_item(item_list.get(i).getItem_no());
			
			item_list.get(i).setItem_name(item.getItem_name());
			item_list.get(i).setItem_att(item.getItem_att());
			item_list.get(i).setItem_wei(item.getItem_wei());
			item_list.get(i).setPrice(item.getPrice()/2);
			
			
			//System.out.println("item_list.get : " + item_list.get(i));
			//System.out.println("item_name : " + item_list.get(i).getItem_name());
			//System.out.println("item_price : " + item_list.get(i).getPrice());
		}
		
		
		
		return item_list;
	}
	
	
	
	
	//���� ������ ��� ���
	public List<itemInfoDTO> shop_item_list(String location){
		
		List<itemInfoDTO> item_list = new ArrayList<itemInfoDTO>();
		item_list = dao.shop_item_list(location);
		
		
		return item_list;
	}
	
	
	
	
	
	
	//buy_item_gold, buy_item_add, sell_item_gold, sell_item_del
	
	//�������� ��ǰ ����
	public void shop_item_buy(String ID, int item_no) {
		//��� ���� - ���, ID
		userMoneyDTO money = new userMoneyDTO();
		money.setNow_money(dao.item_info(item_no).getPrice());
		money.setUser_name(ID);
		dao.buy_item_gold(money);
		
		
		//������ ��� - ���� �̸�(������ �̸��� �ֱ�), ������ ��ȣ
		itemInfoDTO item = new itemInfoDTO();
		/*
		item.setItem_name(ID);
		item.setItem_no(item_no);//������ ������ ��ȣ
		item.setItem_category(dao.item_info(item_no).getItem_category());
		*/
		//�̷��Ÿ� �׳� item_info�� ������ ���� �� �� �ܾ���°� �����ʳ�?
		//item_name�� user_name���� �ٲ��ְ�
		item = dao.item_info(item_no);
		item.setItem_name(ID);
		System.out.println("item.getItemCategory : " + item.getItem_category());
		//dao.item_info(item_no);
		dao.buy_item_add(item);
	}
	
	
	//�������� ������ �Ǹ�
	public void user_item_sell(String ID, int pk_no) {
		//��� ���� - ���, ID
		userMoneyDTO money = new userMoneyDTO();
		money.setNow_money(dao.item_info(dao.pk_item_info(pk_no).getItem_no()).getPrice()/2);
		money.setUser_name(ID);
		dao.sell_item_gold(money);
		
		
		//������ �ȱ� - pk_no
		dao.sell_item_del(pk_no);
	}
	
	
	
	//�� ������ ����
	public castleInfoDTO get_castle_info() {
		
		return dao.get_castle_info();
	}
	
	
	
	
	
	
	
	
	
	//������ ��ü
	public void equip_item_change(int pk_no, String user_name) {
		
		//pk_no�� �����ͼ� �ش� �������� ī�װ��� �ҷ��� ��ü�� equip item�� ���� ������ (equip_item�� info = item_no, pk_no)
		
		itemInfoDTO inventory_item_info = dao.pk_item_info(pk_no);  //�κ��丮 ������
		inventory_item_info.setUser_name(user_name);
		inventory_item_info.setPk_no(pk_no);
		
		
		itemInfoDTO equipment_item_info = dao.category_equip_item_check(inventory_item_info);  //������ ������
		equipment_item_info.setUser_name(user_name);
		
		equipment_item_info.setItem_category(inventory_item_info.getItem_category());
		
		
		//�κ��丮�� �ִ� ������ �����ϱ�
		dao.equipment_on(inventory_item_info);
		System.out.println("inventory_item_info.getPk_no : " + inventory_item_info.getPk_no());
		System.out.println("item pk_no : " + pk_no);
		//������ ������ �κ��丮���� ����
		dao.equip_item_delete(pk_no);
		
		
		//������ �̸� ���� �� ������ �̸� ��������... �ʹ� ��ȿ�����ε� �����ϰ�ʹ�
		equipment_item_info.setItem_name(dao.get_item_name(equipment_item_info.getItem_no()));
		//��� �����ִٸ�? (��� ���� ����, none ����)
		if(!equipment_item_info.getItem_name().equals("none")) {
			//����� ������ �κ��丮�� �ű��
			dao.equipment_off(equipment_item_info);
		}
		
		
		
		//���� pk_no �� category�� weapon�̶�� user_info���� equip_weapon�� weapon_pk_no�� �ҷ��´�.
		//
		
		//������ e
		
	}
	
	
	
	
	
	//������ ī�װ� Ȯ��
	public boolean item_category_check(int pk_no) {
		
		
		if(!dao.item_category_check(pk_no).equals("potion")) {
			//������ �� �ִ� ������ (weapon, armor, accessory)
			return true;
		}else {
			//������ �� ���� ������ (����, �ֹ��� ���)
			return false;
		}
		
		//return true;
	}
	
	
	public List<logDataDTO> get_log() {
		return dao.get_log();
	}
	
}
