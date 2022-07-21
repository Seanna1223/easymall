package easymall.service;

import java.util.List;

import easymall.po.User;

public interface UserService {

	public User login(String username);

	public int regist(User user);

	public List<User> alluser();

	public void change21(int id);

	public void change20(int id);

}
