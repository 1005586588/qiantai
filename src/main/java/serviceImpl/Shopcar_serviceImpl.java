package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Shopcar_dao;
import entity.Orders;
import entity.Shopcar;
import service.Shopcar_service;
import util.SearchInfo;

@Service
public class Shopcar_serviceImpl implements Shopcar_service {

	@Autowired
	Shopcar_dao dao;

	public List<Shopcar> select(SearchInfo info) {
		return dao.select(info);
	}

	public void delete(int id) {
		dao.delete(id);

	}

	public Shopcar getById(int id) {
		return dao.getById(id);
	}

	public void insert(Shopcar s) {
		dao.insert(s);
	}

	public void deleteall(Orders o) {
		dao.deleteall(o);
	}

	public void updatecount(Shopcar s) {
		dao.updatecount(s);
	}

}
