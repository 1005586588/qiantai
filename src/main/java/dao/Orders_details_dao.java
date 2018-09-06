package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Orders_details;
import util.SearchInfo;

@Repository
public interface Orders_details_dao {
	
	@Select("select orders.*,orders_details.*, product.* from Orders inner join address inner join user inner join orders_details inner join product "
			+ "on orders.id=orders_details.orders_id and Orders.address_id=address.id and Orders.user_id=user.id and orders_details.product_id=product.id "
			+ "${where} ${limit} ")
	public List<Orders_details> select(SearchInfo info);
	
	
	@Insert("insert into Orders_details (orders_id,product_id,count,price,nowprice,comments) "
			+ "values(#{orders_id},#{product_id},#{count},#{price},#{nowprice},#{comments})")
	public void insert(Orders_details o);
}