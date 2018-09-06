package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Orders_details_dao;
import entity.Orders_details;
import service.Orders_details_service;
import util.SearchInfo;

@Service
public class Orders_details_serviceImpl implements Orders_details_service{

	@Autowired
	Orders_details_dao dao;

	public List<Orders_details> select(SearchInfo info) {
		return dao.select(info);
	}

	public void insert(Orders_details o) {
		dao.insert(o);
	}

}
