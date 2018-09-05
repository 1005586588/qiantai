package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Orders;
import entity.User;
import service.Address_service;
import service.Orders_service;
import service.Product_service;
import service.Shopcar_service;
import service.User_service;
import util.SearchInfo;

@Controller
public class Orders_Controller {

	@Autowired
	Orders_service service;
	@Autowired
	User_service uservice;
	@Autowired
	Shopcar_service sservice;
	@Autowired
	Product_service pservice;
	@Autowired
	Address_service aservice;

	@RequestMapping("orders")
	public String orders(String sid,String ids, ModelMap m, SearchInfo info, Integer id, Integer allcount, Integer allcount2,HttpServletRequest req) {
		String idss = ids;
		String sids = sid;
		
		req.getSession().removeAttribute("sids");
		req.getSession().setAttribute("sids", sids);
		
		req.getSession().removeAttribute("idss");
		req.getSession().setAttribute("idss", idss);
		
		req.getSession().removeAttribute("allcount2");
		req.getSession().setAttribute("allcount2", allcount2);
		String where = " where user.id = " + id + " && product.id in (" + ids + ") ";
		info.setWhere(where);
		m.put("orderslist", pservice.selectcshopcar(info));
		m.put("addresslist", aservice.getById2(id));
		m.put("allcount", allcount);

		return "orders";
	}
	
	@RequestMapping("orders1")
	public String orders1(String ids, ModelMap m, SearchInfo info, Integer id, Integer allcount, Integer allcount2,HttpServletRequest req) {
		String idss = ids;
		req.getSession().removeAttribute("idss");
		req.getSession().setAttribute("idss", idss);
		req.getSession().removeAttribute("allcount2");
		req.getSession().setAttribute("allcount2", allcount2);
		String where = " where id in (" + ids + ") ";
		info.setWhere(where);
		m.put("orderslist", pservice.selectproduct(info));
		m.put("addresslist", aservice.getById2(id));
		m.put("allcount", allcount);

		return "orders";
	}
	
	
	@RequestMapping("order")
	public String order(int id,ModelMap m,SearchInfo info,HttpSession session, HttpServletRequest req) {
		String where = "where Orders.user_id=" + id + "";
		info.setWhere(where);
		m.put("orderlist", service.select(info));
		return "order";
	}

	@RequestMapping("delete")
	public String delete(int id) {
		service.delete(id);
		return "redirect:index";
	}

	@RequestMapping("deleteall")
	public String deleteall(String ids) {
		// SqlHelper.executeUpdate("delete from quesbal where id in ("+ids+") ");
		return "redirect:index";
	}

	@RequestMapping("updatestatus")
	public String updatestatus(int id, ModelMap m) {
		m.put("info", service.getById(id));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		m.put("date", date);
		return "orders/edit";
	}

	@RequestMapping("update1")
	public String update1(String code,Orders o,HttpSession session) {
		
		o.setStatus(1);
		o.setCode(code);
		service.updatestatus(o);
		User u= (User) session.getAttribute("user");
		return "redirect:order?id="+u.getId();
	}
	@RequestMapping("update11")
	public String update11(String code,Orders o,HttpSession session) {
		
		o.setStatus(1);
		o.setCode(code);
		service.updatestatus(o);
		User u= (User) session.getAttribute("user");
		return "redirect:order?id="+u.getId();
	}
	@RequestMapping("update13")
	public String update13(String code,Orders o,HttpSession session) {
		
		o.setStatus(3);
		o.setCode(code);
		service.updatestatus(o);
		User u= (User) session.getAttribute("user");
		return "redirect:order?id="+u.getId();
	}

	@RequestMapping("sendorder")
	public @ResponseBody int sendorder(Orders o, HttpSession session, SearchInfo info, HttpServletRequest req) {
		if(session.getAttribute("sids")==null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(new Date());
			o.setDate(date);

			SimpleDateFormat sfDate = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String strDate = sfDate.format(new Date());
			o.setCode(strDate);

			service.insertorder(o);
			
			req.getSession().removeAttribute("code");
			req.getSession().setAttribute("code", strDate);
			req.getSession().removeAttribute("allcount");
			req.getSession().setAttribute("allcount", o.getNowamount());
			return 1;
		}else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(new Date());
			o.setDate(date);

			SimpleDateFormat sfDate = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String strDate = sfDate.format(new Date());
			o.setCode(strDate);

			service.insertorder(o);
			String idss=(String) session.getAttribute("sids");
			
			o.setSids(idss);
			sservice.deleteall(o);
			
			req.getSession().removeAttribute("code");
			req.getSession().setAttribute("code", strDate);
			req.getSession().removeAttribute("allcount");
			req.getSession().setAttribute("allcount", o.getNowamount());
			return 1;
		}
		
		
	}
}
