package easymall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import easymall.po.User;

@Repository
@Mapper
public interface UserDao {

	public User login(String username);

	public int regist(User user);

	public List<User> alluser();

	public void change21(int id);

	public void change20(int id);

}
