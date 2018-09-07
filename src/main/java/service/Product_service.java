package service;

import java.util.List;

import entity.Product;
import util.SearchInfo;

public interface Product_service {
	
	public List<Product> select(SearchInfo info);
	
	public void delete(int id);
	
	public Product getById(int id);
	
	public List<Product> selectcshopcar(SearchInfo info);
	
	public List<Product> selectproduct(SearchInfo info);
	
	public void updatesalecount(Product p);
}
