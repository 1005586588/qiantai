package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.User;
import util.SearchInfo;

@Repository
public interface User_dao {
	
	@Select("select * from user ")
	public List<User> select();
	
	@Insert("insert into user (email,password,tel,level,amount,status,comments) values(#{email},#{password},#{tel},#{level},#{amount},#{status},#{comments})")
	public void insert(User u);

	@Update("update user set email=#{email},password=#{password},tel=#{tel},amount=#{amount},status=#{status},comments=#{comments} where id=#{id}")
	public void update(User u);
	
	@Delete("delete from user where id=#{id}")
	public void delete(int id);
	
	@Select("select * from user where id=#{id}")
	public User getById(int id);
	
	@Select("select * from user where email=#{email}")
	public User login(User u);
	
	@Select("select * from user ${where} ${limit} ")
	public List<User> select2(SearchInfo info);
	
	@Update("update user set password=#{newpassword} where id=#{id}")
	public void updateuserpassword(User o);
	
}