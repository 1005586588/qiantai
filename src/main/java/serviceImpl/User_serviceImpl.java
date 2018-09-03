package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.User_dao;
import entity.User;
import service.User_service;
import util.SearchInfo;

@Service
public class User_serviceImpl implements User_service {

	@Autowired
	User_dao dao;

	public List<User> select() {
		return dao.select();
	}

	public void insert(User u) {
		dao.insert(u);
	}

	public void update(User u) {
		dao.update(u);
	}

	public void delete(int id) {
		dao.delete(id);
	}

	public User getById(int id) {
		return dao.getById(id);
	}

	public User login(User u) {
		return dao.login(u);
	}

	public List<User> select2(SearchInfo info) {

		return dao.select2(info);
	}

	public void updateuserpassword(User o) {
		dao.updateuserpassword(o);
	}

}
