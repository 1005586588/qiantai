package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Orders;
import entity.Shopcar;
import util.SearchInfo;

@Repository
public interface Shopcar_dao {
	
	@Select("select shopcar.* ,product.fullname pname,user.email uname from shopcar inner join product inner join user "
			+ "on shopcar.product_id=product.id and shopcar.user_id=user.id ${where} ${limit} ")
	public List<Shopcar> select(SearchInfo info);
	
	@Delete("delete from shopcar where id=#{id}")
	public void delete(int id);
	
	@Delete("delete from shopcar where id in (${sids})")
	public void deleteall(Orders o);
	
	@Delete("delete from shopcar where id=#{id}")
	public void shopcardelet(String id);
	
	@Select("select * from shopcar where id=#{id}")
	public Shopcar getById(int id);
	
	@Insert("insert into shopcar (product_id,user_id,count) values(#{product_id},#{user_id},#{count})")
	public void insert(Shopcar s);
	
	@Update("update shopcar set count=#{count} where user_id=#{user_id} and product_id=#{product_id} ")
	public void updatecount(Shopcar s);
	
}