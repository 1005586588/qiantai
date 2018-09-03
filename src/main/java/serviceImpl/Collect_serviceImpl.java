package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Collect_dao;
import entity.Collect;
import service.Collect_service;
import util.SearchInfo;

@Service
public class Collect_serviceImpl implements Collect_service{

	@Autowired
	Collect_dao dao;

	public List<Collect> select(SearchInfo info) {
		return dao.select(info);
	}

	public void insert(Collect o) {
		dao.insert(o);
	}

	public void delete(int id) {
		dao.delete(id);
	}

	public Collect getById(int id) {
		return dao.getById(id);
	}
	
	
}
