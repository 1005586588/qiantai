package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Address;

@Repository
public interface Address_dao {
	

	@Select("select * from Address ")
	public List<Address> select();
	
	@Insert("insert into Address (user_id,zone,addr,name,tel,status) values(#{user_id},#{zone},#{addr},#{name},#{tel},#{status})")
	public void insert(Address a);

	@Update("update Address set name=#{name},parentid=#{parentid} where id=#{id}")
	public void update(Address a);
	
	@Delete("delete from Address where id=#{id}")
	public void delete(int id);
	
	@Select("select * from Address where id=#{id}")
	public Address getById(int id);
	
	@Select("select * from Address where user_id=#{user_id}")
	public List<Address> getById2(int id);
	
}