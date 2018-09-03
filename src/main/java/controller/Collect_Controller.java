package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	
	@RequestMapping("shoucang")
	public String insert(Collect c,HttpSession session) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		c.setDate(date);
		
		service.insert(c);
		User u= (User) session.getAttribute("user");
		return "redirect:collect?id="+u.getId();
	}

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



	
}
