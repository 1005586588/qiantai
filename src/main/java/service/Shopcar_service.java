package service;

import java.util.List;

import entity.Orders;
import entity.Shopcar;
import util.SearchInfo;

public interface Shopcar_service {
	
	public List<Shopcar> select(SearchInfo info);
	
	public void delete(int id);
	
	public Shopcar getById(int id);
	
	public void insert(Shopcar s);
	
	public void deleteall(Orders o);
}
