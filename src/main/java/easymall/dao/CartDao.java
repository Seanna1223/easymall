package easymall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import easymall.po.Cart;
import easymall.pojo.MyCart;

@Repository
@Mapper
public interface CartDao {
	public Cart findCart(Cart cart);

	public void addCart(Cart cart);

	public void updateCart(Cart cart);

	public List<MyCart> showcart(Integer user_id);
//	修改数量
	public void updateBuyNum(Cart cart);
//  删除指定商品
	public void delCart(Integer cartID);
//  根据cartID查找购物车
	public MyCart findByCartID(Integer cartID);
	
}
