package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Operator;
import entity.User;
import service.User_service;
import util.JsonUtil.jsonInfo;

@Controller
public class User_Controller {

	@Autowired
	User_service service;

	
	@RequestMapping("userzuce")
	public @ResponseBody int  userzuce(User u) {
		service.insert(u);
		return 1;
	}
	
	@RequestMapping("userinfo")
	public String userinfo(Integer id, ModelMap m) {
		m.put("info", service.getById(id));
		return adduserinfo(m);
	}

	@RequestMapping("adduserinfo")
	public String adduserinfo(ModelMap m) {
		m.put("levelstatus", User.levelstatus);
		m.put("userstatus", User.userstatus);
		return "membercenter";
	}
	
	@RequestMapping("updateuser")
	public @ResponseBody jsonInfo updateuser(User u) {
		
		service.update(u);
		return new jsonInfo(1, "");
	}
	
	
	@RequestMapping("updateuserpassword")
	public  @ResponseBody int updateuserpassword(User o,Integer id,HttpServletRequest req) {
		User opass= service.getById(id);
		if(o.getPassword().equals(opass.getPassword())) {
			service.updateuserpassword(o);
			User opass2= service.getById(id);
			req.getSession().removeAttribute("user");
			req.getSession().setAttribute("user", opass2);
			return 1;
		}else {
			return 0;
		}
	}
}
