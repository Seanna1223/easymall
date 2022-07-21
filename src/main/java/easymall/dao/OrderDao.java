package easymall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import easymall.po.Orders;

@Repository("orderDao")
@Mapper
public interface OrderDao {
//	添加订单
	public void addOrder(Orders myOrder);
//	显示订单
	List<Orders> findOrderByUserId(Integer user_id);
	public void delorder(String id);
	public void payorder(String id);
	public List<Orders> findAllOrder();//qwe
	public void  deliever(String id);
	public void  received(String id);
}
