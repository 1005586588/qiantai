package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Orders;
import util.SearchInfo;

@Repository
public interface Orders_dao {
	
	@Select("select Orders.* ,address.zone aname,address.addr aaddr,address.tel atel,user.email uname from Orders inner join address inner join user "
			+ "on Orders.address_id=address.id and Orders.user_id=user.id ${where} ${limit} ")
	public List<Orders> select(SearchInfo info);
	
	@Select(" SELECT @@IDENTITY AS 'Identity'")
	public int select2();
	
	@Select("select Orders.* ,address.zone aname,address.addr aaddr,address.tel atel,user.email uname from Orders inner join address inner join user "
			+ "on Orders.address_id=address.id and Orders.user_id=user.id ${where} ${limit} ")
	public List<Orders> selectall();
	
	@Insert("insert into orders (date,code,amount,nowamount,address_id,user_id,assessstatus,status,comments) "
			+ "values(#{date},#{code},#{amount},#{nowamount},#{address_id},#{user_id},#{assessstatus},#{status},#{comments})")
	public void insertorder(Orders o);
	
	@Delete("delete from Orders where id=#{id}")
	public void delete(int id);
	
	@Select("select * from Orders where id=#{id}")
	public Orders getById(int id);

	@Update("update orders set status=#{status} where code= '${code}' ")
	public void updatestatus(Orders o);
	
	@Update("update Product set salecount=salecount+#{count2} where id = #{productid} ")
	public void updatesalecount(Orders o);
	
}