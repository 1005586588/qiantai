package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Product;
import entity.Type;
import util.SearchInfo;

@Repository
public interface Product_dao {
	
	@Select("select product.*,type.name tname,type.parentid pid from product inner join type on product.type_id=type.id ${where} ${limit} ")
	public List<Product> select(SearchInfo info);
	
	@Delete("delete from product where id=#{id}")
	public void delete(int id);
	
	@Select("select * from product where id=#{id}")
	public Product getById(int id);

	
	
	
	
	
	
}