package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Collect;
import entity.User;
import service.Collect_service;
import util.SearchInfo;

@Controller
public class Collect_Controller {

	@Autowired
	Collect_service service;
	
	@RequestMapping("collect")
	public String collect(int id,ModelMap m,SearchInfo info) {
		
		String where = " where user.id = " + id + " ";
		info.setWhere(where);
		m.put("list", service.select(info));

		return "Collect";
	}
	
	@RequestMapping("collectconfirm")
	public @ResponseBody int collectconfirm(int user_id,int product_id,SearchInfo info) {
		
		String where=" where user_id="+user_id+" and product_id="+product_id+"";
		info.setWhere(where);
		if(service.select(info).size()!=0) {
			return 1;
		}else{
			return 0;
		}
	}
	
	@RequestMapping("shoucang")
	public String insert(Collect c,HttpSession session) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		c.setDate(date);
		
		service.insert(c);
		User u= (User) session.getAttribute("user");
		return "redirect:collect?id="+u.getId();
	}

	@RequestMapping("collectdelet")
	public @ResponseBody int collectdelet(Integer id) {
		service.delete(id);
		return 1;
	}

	
}
