package kr.co.controller_collection;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.DAO.DAOImple;
import kr.co.DTO.fightDTO;
import kr.co.DTO.userFightDTO;
import kr.co.DTO.userLoginDTO;
import kr.co.DTO.userMoneyDTO;
import kr.co.service_cellection.ServiceImple;

@Controller
public class MainController {
	
	@Autowired
	ServiceImple service;
	
	@Autowired
	DAOImple dao;
	
	
	
	
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login_form(Model model) {
		
		return "user_ui/login";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "login_action", method = RequestMethod.POST)
	public String login_action(@RequestParam("ID") String ID, @RequestParam("password") String password, Model model,
				HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		userLoginDTO user = new userLoginDTO();
		
		user.setID(ID);
		user.setPassword(password);
		
		
		boolean result = service.login(user);
		
		if(result == true) {
			
			session.setAttribute("memID", ID);
			
			return "true";
		}
		else {
			return "false";
		}
		
		
	}
	
	
	
	
	

	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String sign_menu() {
		return "user_ui/signup";
	}
	
	@RequestMapping(value = "signup_action", method = RequestMethod.POST)
	public String sign_action(userLoginDTO user) {
		
		service.signup(user);
		
		
		
		return "redirect:login";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "ID_overlap_check", method = RequestMethod.GET)
	public String ID_overlap_check(@RequestParam("userID") String userID) {
		//System.out.println("overlap_check insert");
		
		String result =  dao.ID_overlap_check(userID);
		
		//System.out.println("result : " + result);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "nickname_overlap_check", method = RequestMethod.GET)
	public String nickname_overlap_check(@RequestParam("nickname") String nickname) {
		//System.out.println("overlap_check insert");
		
		String result =  dao.nickname_overlap_check(nickname);
		
		//System.out.println("result : " + result);
		return result;
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main_page(HttpServletRequest request, Model model) {
		//���� ����, ��������, �α� �Ѱ��ֱ�
		
		
		System.out.println("main get session");
		HttpSession session = request.getSession();
		//System.out.println("session.getAttribute");
		String ID = (String) session.getAttribute("memID");
		
		
		
		System.out.println("sessionID : " + ID);
		
		if(ID != null) {
			userFightDTO user_info = service.user_info(ID);
			
			//���� ����
			model.addAttribute("user_info", user_info);
			model.addAttribute("money_info", service.money_info(ID));
			model.addAttribute("exp_info", service.exp_info(ID));
			
			
			model.addAttribute("user_weapon", service.item_info(user_info.getEquip_weapon()));
			model.addAttribute("user_armor", service.item_info(user_info.getEquip_armor()));
			model.addAttribute("user_acce", service.item_info(user_info.getEquip_accessory()));
			
			
			model.addAttribute("castle_info", service.get_castle_info());
			
			
			model.addAttribute("HPpercent", (int)(((float)user_info.getUser_nowHP()/(float)user_info.getUser_maxHP())*100));
			//System.out.println("HP percent : " + (int)(((float)user_info.getUser_nowHP()/(float)user_info.getUser_maxHP())*100));
			model.addAttribute("MPpercent", (int)(((float)user_info.getUser_nowMP()/(float)user_info.getUser_maxMP())*100));
			
			model.addAttribute("nickname", service.get_nickname(ID));
			model.addAttribute("img", "img/lowpepe.jpg");
			
			model.addAttribute("log", service.get_log());
		}
		
		return "user_ui/main";
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "hunt", method = RequestMethod.GET)
	public String hunt_map(@RequestParam("map_level") int map,
			@RequestParam("auto") String auto, HttpServletRequest request, Model model) {
		
		//String result = request.getAttribute("auto_check");
		
		//���ǿ��� memID �޾ƿ��� (ID)
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("memID");
		
		//������ �ο� ���� ����
		String monster_name = service.MonsterName(map);
		
		//�ٽ� ����� �� ������ ���� ���θ� ������
		model.addAttribute("map_level", map);
		model.addAttribute("auto_check", auto );
		
		
		if(ID != null) {
			//������ ���� �ο��� �� ������ ������
			ArrayList<fightDTO> fight = service.hunt_map(monster_name, ID);
			userFightDTO user_info = service.user_info(ID);
			
			//������ ������ ����... �� �ο� ���� ����
			model.addAttribute("img", "img/lowpepe.jpg");
			model.addAttribute("fight", fight);
			
			//����, ���� ���� ����
			model.addAttribute("user_info", user_info);
			model.addAttribute("monster_info", service.monster_info(monster_name));
			//model.addAttribute("nick_name",service.get_nickname(ID));
			//model.addAttribute("monster_name",monster_name);
			
			//model.addAttribute("user_now_gold", service.getGold(ID));
			//���� ���� ������
			model.addAttribute("user_weapon", service.item_info(user_info.getEquip_weapon()));
			model.addAttribute("user_armor", service.item_info(user_info.getEquip_armor()));
			model.addAttribute("user_acce", service.item_info(user_info.getEquip_accessory()));
			
			//������ now_money�� �˷��ִ°�
			model.addAttribute("user_money", service.getGold(ID));
		}
		
		
		//������ ���� nickname �Ѱ��ְ���� / ���� �Ѱ�����
		
		
		return "user_ui/hunt_map";
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "motel", method = RequestMethod.GET)
	public String motel(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("memID");
		System.out.println("motel insert ID : " + ID);
		
		if(ID != null) {
			model.addAttribute("user_gold", (service.getGold(ID)/10));
		}
		
		
		return "user_ui/motel";
	}
	
	
	
	
	@RequestMapping(value = "heal", method = RequestMethod.GET)
	public String heal(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("memID");
		

		if(ID != null) {
			service.heal(ID);
		}
		
		return "redirect:main";
	}
	
	
	
	
	
	@RequestMapping(value = "bank", method = RequestMethod.GET)
	public String bank(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("memID");
		
		
		if(ID != null) {
			userMoneyDTO money = service.money_info(ID);
			model.addAttribute("user_money", money);
		}
		
		
		
		return "user_ui/bank";
	}
	
	
	
	
	
	@RequestMapping(value = "bank_action", method = RequestMethod.POST)
	public String bank_action(int bank_menu, int want_money, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("memID");
		
		
		if(ID != null) {
			//String value = bank_menu;
			System.out.println("value : " + bank_menu);
			//int money = (Integer) request.getAttribute("want_money");
			System.out.println("money : " + want_money);
			//int money = (Integer) request.getAttribute("want_money");
			//System.out.println("request.bank_menu : " + value);
			//use_bank(int value, int money, String ID) {
			service.use_bank(bank_menu, want_money, ID);
			
		}
		
		
		return "redirect:main";
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value = "user_info", method = RequestMethod.GET)
	public String user_info(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("memID");
		
		
		
		
		if(ID != null) {
			
			userFightDTO user_info = service.user_info(ID);
			
			model.addAttribute("user_info", user_info);
			model.addAttribute("money_info", service.money_info(ID));
			model.addAttribute("exp_info", service.exp_info(ID));
			
			
			model.addAttribute("user_weapon", service.item_info(user_info.getEquip_weapon()));
			model.addAttribute("user_armor", service.item_info(user_info.getEquip_armor()));
			model.addAttribute("user_acce", service.item_info(user_info.getEquip_accessory()));
			
			
			
			model.addAttribute("nickname", service.get_nickname(ID));
			model.addAttribute("img", "img/lowpepe.jpg");
			
		}
		
		
		
		
		return "user_ui/user_info";
	}
	
	
	
	
	@RequestMapping(value = "item_shop", method = RequestMethod.GET)
	public String item_shop(@RequestParam("location") String location, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("memID");
		
		
		if(ID != null) {
			//����, ������ ������ ����Ʈ ����
			model.addAttribute("shop_list", service.shop_item_list(location));
			model.addAttribute("user_list", service.user_item_list(ID));
			//model.addAttribute("user_money", service.money_info(ID));  //�� �����ε� �׳� ajax�� �ذ�����
			
			//�ش� ������ ������� �˷���
			model.addAttribute("location", location);
		}
		
		
		
		return "user_ui/item_shop";
	}
	
	
	
	
	@RequestMapping(value = "item_shop_action", method = RequestMethod.POST)
	public String item_shop_action(HttpServletRequest request, Integer shop_item, Integer user_item) {
		
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("memID");
		
		
		if(ID != null) {
			//service.shop_action
			
			if(shop_item != null) {  //������ �������� ��
				service.shop_item_buy(ID, shop_item);
			} else if(user_item != null) {  //������ �Ǹ����� ��
				service.user_item_sell(ID, user_item);
			}
			
			//System.out.println("request.getAttribute(\"user_item\") : " + request.getAttribute("user_item"));
		}
		
		
		return "redirect:main";
	}
	
	
	
	
	//���� ������ ���� �� �������� ����� ��尡 �ִ��� ���� üũ
	@ResponseBody
	@RequestMapping(value = "shop_user_gold_check", method = RequestMethod.POST)
	public String shop_user_gold_check(@RequestParam("item_no") int item_no, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("memID");
		
		
		
		
		if(ID != null) {
			int user_money = service.getGold(ID);  //������ now_money
			int item_price = service.item_info(item_no).getPrice();  //�������� price
			
			if(user_money > item_price) {
				return "true";  //�絵 ��
			} else {
				return "false";  //�����
			}
			
			
		} else {  //�α��� �ϼ��� ����
			return "false";
		}
		
	}
	
	
	
	
	
	
	@RequestMapping(value = "inventory", method = RequestMethod.GET)
	public String inventory_view(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("memID");
		
		
		
		if(ID != null) {
			userFightDTO user_info = service.user_info(ID);
			
			//���� ���â ����
			model.addAttribute("user_weapon", service.item_info(user_info.getEquip_weapon()));
			model.addAttribute("user_armor", service.item_info(user_info.getEquip_armor()));
			model.addAttribute("user_acce", service.item_info(user_info.getEquip_accessory()));
			
			
			//���� �κ��丮 ����
			model.addAttribute("user_list", service.user_item_list(ID));
			
		}
		
		
		
		return "user_ui/inventory";
	}
	
	
	//������ ��ü�۾�
	@RequestMapping(value = "equipment_item", method = RequestMethod.POST)
	public String equipment_item(HttpServletRequest request, int user_item) {
		
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("memID");
		
		System.out.println("user_item pk_no : " + user_item);
		
		
		
		if(ID != null) {
			service.equip_item_change(user_item, ID);
		}
		
		
		return "redirect:main";
	}
	
	
	
	//�������� ������ �� �ִ°��� �Ǻ�
	@ResponseBody
	@RequestMapping(value = "item_category_check", method = RequestMethod.POST)
	public String item_category_check(@RequestParam() int pk_no, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("memID");
		
		
		if(ID != null) {
			if(service.item_category_check(pk_no) == true) {
				return "true";
			}else {
				return "false";
			}
		}
		
		
		
		
		return "";
	}
	
}
