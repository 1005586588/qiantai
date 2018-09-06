package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import entity.Collect;
import util.SearchInfo;

@Repository
public interface Collect_dao {
	
	@Select("select collect.*,product.* from collect inner join product inner join user on collect.user_id=user.id and collect.product_id=product.id ${where} ${limit} ")
	public List<Collect> select(SearchInfo info);
	
	@Insert("insert into collect (user_id,product_id,date) values(#{user_id},#{product_id},#{date})")
	public void insert(Collect o);
	
	@Delete("delete from collect where id=#{id}")
	public void delete(int id);

	@Select("select * from collect where id=#{id}")
	public Collect getById(int id);

}