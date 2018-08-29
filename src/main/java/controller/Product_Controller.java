package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Product;
import entity.Type;
import service.Product_service;
import service.Type_service;
import util.SearchInfo;

@Controller

public class Product_Controller {

	@Autowired
	Product_service service;
	@Autowired
	Type_service tservice;
	
	@RequestMapping("typelist")
	public String typlist(ModelMap m) {
		m.put("typelist", tservice.select(new SearchInfo("",false)));
		return "index";
	}
	@RequestMapping("getalltype")
	public @ResponseBody List<List<Type>> getalltype(int id) {
		
		ArrayList<List<Type>> data = new ArrayList<List<Type>>();
		Type s= tservice.getById(id);
		List<Type> slist=tservice.select(new SearchInfo(" where type.parentid="+s.getParentid(),false));
		for(int i=0;i<slist.size();i++)if(slist.get(i).getId()==id) {
			slist.get(i).setParent_name("1");
		}
		data.add(slist);
		while(s.getParentid()>0) {
			s=tservice.getById(s.getParentid());
			slist=tservice.select(new SearchInfo(" where type.parentid="+s.getParentid(),false));
			for(int i=0;i<slist.size();i++)if(slist.get(i).getId()==s.getId()) {
				slist.get(i).setParent_name("1");
			}
			data.add(0,slist);
		}
		return data;
	}
	
	
	@RequestMapping("index")
	public void index(Integer select, String txt, SearchInfo info, ModelMap m) {

		if (select == null) select = 0;
		String where = "";
		if (txt != null && txt.length() > 0) {
			switch (select) {
			case 1:
				where = "where Product.type_id = " + txt + " ";
				break;
			default:
				where = "where Product.fullname like  '%" + txt + "%' ";
			}
		}
		m.put("select", select);
		m.put("txt", select == 0 ? "'" + txt + "'" : txt);
	
		m.put("productstatus", Product.productstatus);
		 m.put("typerow", tservice.select2());
		 
		info.setWhere(where);
		m.put("search", info);
//		info.setCanPage(false);
		m.put("list", service.select(info));
		m.put("typelist", tservice.select(new SearchInfo("",false)));
	}
	
	@RequestMapping("select")
	public String  select(Integer select, String txt, SearchInfo info, ModelMap m) {

		if (select == null) select = 0;
		String where = "";
		if (txt != null && txt.length() > 0) {
			switch (select) {
			default:
				where = "where Product.fullname like  '%" + txt + "%' ";
			}
		}
		m.put("select", select);
		m.put("txt", select == 0 ? "'" + txt + "'" : txt);
	
		m.put("productstatus", Product.productstatus);
		m.put("typerow", tservice.select2());
		 
		info.setWhere(where);
		m.put("search", info);
//		info.setCanPage(false);
		m.put("list", service.select(info));
		m.put("typelist", tservice.select(new SearchInfo("",false)));
	
		return "fruit"; 
	}
	@RequestMapping("info")
	public String info(int id,ModelMap m) {
		m.put("product",service.getById(id));
		return "product";
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

	@RequestMapping("add")
	public String add(ModelMap m) {
		m.put("productstatus", Product.productstatus);
		m.put("typerow", tservice.select2());
		return "product/edit";
	}

	@RequestMapping("edit")
	public String edit(int id, ModelMap m) {
		m.put("info", service.getById(id));
		return add(m);
	}
	

}
