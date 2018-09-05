package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.User;
import service.User_service;

@Controller
public class login_Controller {

	@Autowired
	User_service uservice;
	
	@RequestMapping("login2")
    public String login(User u,HttpSession session,HttpServletRequest req){
		session.removeAttribute("error");
			if (uservice.login(u)==null) {
				session.setAttribute("error", "用户名不存在！！");
				return "redirect:login2.jsp";
			}else {
			User sqlUser= uservice.login(u);
			 if(u.getPassword().equals(sqlUser.getPassword())) {
				req.getSession().removeAttribute("user");
				req.getSession().setAttribute("user", sqlUser);
				req.getSession().setMaxInactiveInterval(100000);
				return "redirect:index.jsp";
			}else {
				session.setAttribute("error", "密码错误！！");
				return "redirect:login2.jsp";
			}
			}
	}
	
	@RequestMapping("zhuxaio")
    public String zhuxaio(HttpSession session){
		session.removeAttribute("user");
		return "redirect:login2.jsp";
	}
	
	
}
