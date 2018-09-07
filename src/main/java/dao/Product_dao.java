package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Product;
import util.SearchInfo;

@Repository
public interface Product_dao {
	
	@Select("select product.*,type.name tname,type.parentid pid from product inner join type on product.type_id=type.id ${where} ${limit} ")
	public List<Product> select(SearchInfo info);
	
	@Select("select product.*,shopcar.count scount,shopcar.id sid from product inner  join shopcar  inner join user on shopcar.product_id=product.id and shopcar.user_id=user.id ${where} ${limit} ")
	public List<Product> selectcshopcar(SearchInfo info);
	
	@Select("select * from product ${where} ${limit} ")
	public List<Product> selectproduct(SearchInfo info);
	
	
	@Delete("delete from product where id=#{id}")
	public void delete(int id);
	
	@Select("select * from product where id=#{id}")
	public Product getById(int id);

	@Update("update Product set salecount=salecount+#{count} where id=#{product_id} ")
	public void updatesalecount(Product p);
	
	
	
	
	
}