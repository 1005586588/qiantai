package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Shopcar;
import entity.User;
import service.Product_service;
import service.Shopcar_service;
import util.SearchInfo;

@Controller
public class Shopcar_Controller {

	@Autowired
	Shopcar_service service;
	@Autowired
	Product_service pservice;

	
	@RequestMapping(value="shop", method = RequestMethod.GET)
	public String shopping(Integer id, SearchInfo info, ModelMap m) {
		String where = "where user.id=" + id + "";
		info.setWhere(where);
		m.put("carlist", pservice.selectcshopcar(info));
		return "shopping";
	}

	@RequestMapping("changercount")
	public @ResponseBody int changercount(Shopcar s,HttpSession session) {
		
		User u= (User) session.getAttribute("user");
		s.setUser_id(u.getId());
		service.updatecount(s);
		return 1;
		
	}
	
	@RequestMapping("addcar")
	public String addcar(Shopcar s) {
		service.insert(s);
		int id = s.getUser_id();
		return "redirect:shop?id="+id;
	}
	
	@RequestMapping("confirm")
	public @ResponseBody int confirm(int user_id,int product_id,SearchInfo info) {
		
		String where=" where user_id="+user_id+" and product_id="+product_id+"";
		info.setWhere(where);
		if(service.select(info).size()!=0) {
			return 1;
		}else{
			return 0;
		}
	}
	@RequestMapping("shopcardelet")
	public @ResponseBody int shopcardelet(Integer id) {
		
		service.delete(id);
		
		return 1;
	}

}
