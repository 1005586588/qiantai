package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entity.Shopcar;
import service.Product_service;
import service.Shopcar_service;
import service.User_service;
import util.SearchInfo;

@Controller
public class Shopcar_Controller {

	@Autowired
	Shopcar_service service;
	@Autowired
	Product_service pservice;
	@Autowired
	User_service sservice;
	
	@RequestMapping(value="shop", method = RequestMethod.GET)
	public String shopping(Integer id, SearchInfo info, ModelMap m) {
		String where = "where user.id=" + id + "";
		info.setWhere(where);
		m.put("carlist", pservice.selectcshopcar(info));
		return "shopping";
	}


	@RequestMapping("addcar")
	public String addcar(Shopcar s) {
		service.insert(s);
		int id = s.getUser_id();
		return "redirect:shop?id="+id;
	}
//
//	@RequestMapping("deleteall")
//	public String deleteall(String ids) {
//		// SqlHelper.executeUpdate("delete from quesbal where id in ("+ids+") ");
//		return "redirect:index";
//	}

}
