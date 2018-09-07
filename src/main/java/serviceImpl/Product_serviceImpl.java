package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Product_dao;
import entity.Product;
import service.Product_service;
import util.SearchInfo;

@Service
public class Product_serviceImpl implements Product_service{

	@Autowired
	Product_dao dao;
	
	
	public List<Product> select(SearchInfo info) {
		return dao.select(info);
	}

	public void delete(int id) {
		dao.delete(id); 
	}

	public Product getById(int id) {
		return dao.getById(id);
	}

	public List<Product> selectcshopcar(SearchInfo info) {
		return dao.selectcshopcar(info);
	}



	public List<Product> selectproduct(SearchInfo info) {
		return dao.selectproduct(info);
	}

	public void updatesalecount(Product p) {
		dao.updatesalecount(p);
	}


	
}
