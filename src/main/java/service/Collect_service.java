package service;

import java.util.List;

import entity.Collect;
import util.SearchInfo;

public interface Collect_service {

	public List<Collect> select(SearchInfo info);
	
	public void insert(Collect o);
	
	public void delete(int id);

	public Collect getById(int id);
}
