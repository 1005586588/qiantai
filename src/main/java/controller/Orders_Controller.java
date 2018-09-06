package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Orders;
import entity.Orders_details;
import entity.Orders_status;
import entity.Product;
import entity.Shopcar;
import entity.User;
import service.Address_service;
import service.Orders_details_service;
import service.Orders_service;
import service.Orders_status_service;
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
	@Autowired
	Orders_status_service oservice;
	@Autowired
	Orders_details_service dservice;

	@RequestMapping("orders")
	public String orders(Integer count,String sid,String ids, ModelMap m, SearchInfo info, Integer id, Integer allcount, Integer allcount2,HttpServletRequest req) {
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
		m.put("count", count);
		return "orders";
	}
	
	@RequestMapping("orders1")
	public String orders1(Integer ids,Integer id,Integer count, ModelMap m, SearchInfo info,HttpServletRequest req) {
		req.getSession().removeAttribute("sids");
		int idsone = ids;
		req.getSession().removeAttribute("idss");
		req.getSession().setAttribute("idss", idsone);
		int countone=count;
		req.getSession().removeAttribute("countone");
		req.getSession().setAttribute("countone", countone);
		
		
		
		String where = " where id = "+ids+" ";
		info.setWhere(where);
		double nowprice2=pservice.selectproduct(info).get(0).getNowprice();
		req.getSession().removeAttribute("nowprice2");
		req.getSession().setAttribute("nowprice2", nowprice2);
		double allcount=pservice.selectproduct(info).get(0).getNowprice()*countone;
		req.getSession().removeAttribute("allcount");
		req.getSession().setAttribute("allcount", allcount);
		
		double price2=pservice.selectproduct(info).get(0).getPrice();
		req.getSession().removeAttribute("price2");
		req.getSession().setAttribute("price2", price2);
		double allcount2=pservice.selectproduct(info).get(0).getPrice()*countone;
		req.getSession().removeAttribute("allcount2");
		req.getSession().setAttribute("allcount2", allcount2);
		
		m.put("orderslist", pservice.selectproduct(info));
		m.put("addresslist", aservice.getById2(id));
		return "orders2";
	}
	@RequestMapping("orderinfo")
	public String orderinfo(Integer id,ModelMap m,SearchInfo info) {
		String where = "where Orders.user_id=" + id + "";
		info.setWhere(where);
		m.put("orderlist", service.select(info));
		return "order";
	}

	
	@RequestMapping("order")
	public String order(int id,ModelMap m,SearchInfo info,HttpSession session, HttpServletRequest req) {
		String where = "where Orders.user_id=" + id + "";
		info.setWhere(where);
		m.put("orderlist", service.select(info));
		m.put("orderlist2", dservice.select(info));
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
	public String update1(Orders_status os,Integer orders_id,double amount,String code,Orders o,HttpSession session) {
		
		o.setStatus(1);
		o.setCode(code);
		service.updatestatus(o);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		os.setDate(date);
		os.setDest_status(1);
		os.setAmount(amount);
		String a="完成付款！";
		os.setInfo(a);
		os.setOrders_id(orders_id);
		os.setNum(0);
		oservice.insert(os);
		
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
	public String update13(Orders_status os,Integer orders_id,double amount,String code,Orders o,HttpSession session) {
		
		o.setStatus(3);
		o.setCode(code);
		service.updatestatus(o);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		os.setDate(date);
		os.setDest_status(3);
		os.setAmount(amount);
		String a="完成收货！";
		os.setInfo(a);
		os.setOrders_id(orders_id);
		os.setNum(0);
		oservice.insert(os);
		
		User u= (User) session.getAttribute("user");
		return "redirect:order?id="+u.getId();
	}
	
	@RequestMapping("update14")
	public String update14(Orders_status os,Integer orders_id,double amount,String code,Orders o,HttpSession session) {
		
		o.setStatus(4);
		o.setCode(code);
		service.updatestatus(o);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		os.setDate(date);
		os.setDest_status(4);
		os.setAmount(amount);
		String a="已退货！";
		os.setInfo(a);
		os.setOrders_id(orders_id);
		os.setNum(0);
		oservice.insert(os);
		
		User u= (User) session.getAttribute("user");
		return "redirect:order?id="+u.getId();
	}
	

	@RequestMapping("sendorder")
	public @ResponseBody int sendorder(Orders_details od,Orders_status os,Orders o, HttpSession session, SearchInfo info, HttpServletRequest req) {
		
		
		
		if(session.getAttribute("sids")==null) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(new Date());
			o.setDate(date);

			SimpleDateFormat sfDate = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String strDate = sfDate.format(new Date());
			o.setCode(strDate);

			service.insertorder(o);
			
			
				int orders_id=service.select2();
	            od.setOrders_id(orders_id);
	            od.setProduct_id(o.getProductid());
	            od.setCount(o.getCount2());
	            od.setPrice(o.getPrice2());
	            od.setNowprice(o.getNowprice2());
	            dservice.insert(od);   
			
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String date2 = sdf.format(new Date());
			os.setDate(date2);
			os.setOrders_id(o.getId());
			os.setDest_status(0);
			String a="已提交订单";
			os.setInfo(a);
			os.setNum(0);
			os.setAmount(o.getNowamount());
			os.setComments(o.getComments());
			oservice.insert(os);
			
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
	
			int orders_id=service.select2();
			String idsss=o.getIds();
			List<Shopcar> list=sservice.select(new SearchInfo(" where product_id in ("+idsss+")",false));
	        for(int i=0;i<list.size();i++){
	            int product_id=list.get(i).getProduct_id();
	            List<Product> plist=pservice.select(new SearchInfo(" where product.id="+product_id, false));
	            int count=list.get(i).getCount();
	            od.setOrders_id(orders_id);
	            od.setProduct_id(product_id);
	            od.setCount(count);
	            od.setPrice(plist.get(0).getPrice());
	            od.setNowprice(plist.get(0).getNowprice());
	            dservice.insert(od);   
	        }
			
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String date2 = sdf.format(new Date());
			os.setDate(date2);
			os.setOrders_id(orders_id);
			os.setDest_status(0);
			String a="已提交订单";
			os.setInfo(a);
			os.setNum(0);
			os.setAmount(o.getNowamount());
			os.setComments(o.getComments());
			oservice.insert(os);
			
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
