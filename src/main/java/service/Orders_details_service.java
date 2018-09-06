package service;

import java.util.List;

import entity.Orders_details;
import util.SearchInfo;

public interface Orders_details_service {
	
	public List<Orders_details> select(SearchInfo info);
	
	public void insert(Orders_details o);
}
