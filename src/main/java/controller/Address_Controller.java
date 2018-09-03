package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Address;
import service.Address_service;

@Controller
public class Address_Controller {

	@Autowired
	Address_service service;
	
	@RequestMapping("editaddr")
	public @ResponseBody int insert(Address a) {
		service.insert(a);
		return 1;
	}

//	@RequestMapping("update")
//	public @ResponseBody jsonInfo update(Operator o) {
//		service.update(o);
//		return new jsonInfo(1, "");
//	}
//	

//	@RequestMapping("delete")
//	public String delete(int id) {
//		service.delete(id);
//		return "redirect:index";
//	}
//	

//	@RequestMapping("deleteall")
//	public  @ResponseBody Ids deleteall(Ids i) {
//		// SqlHelper.executeUpdate("delete from quesbal where id in ("+ids+") ");
//		service.deleteall(i);
//		return new Ids(null);
//	}



//	@RequestMapping("")
//	public  @ResponseBody int editaddr(int id, ModelMap m) {
//		m.put("addresslist", service.getById(id));
//		return 1;
//	}
	
}
