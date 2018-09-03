package service;

import java.util.List;

import entity.User;
import util.SearchInfo;

public interface User_service {

	public List<User> select();
	
	public void insert(User u);

	public void update(User u);
	
	public void delete(int id);
	
	public User getById(int id);
	
	public User login(User u);
	
	public List<User> select2(SearchInfo info);
	
	public void updateuserpassword(User o);
}
