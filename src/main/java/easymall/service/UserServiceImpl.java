package easymall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import easymall.dao.UserDao;
import easymall.po.User;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public User login(String username) {
		return userDao.login(username);
	}

	@Override
	public int regist(User user) {
		return userDao.regist(user);
	}

	@Override
	public List<User> alluser() {
		return userDao.alluser();
	}

	@Override
	public void change21(int id) {
		userDao.change21(id);
	}

	@Override
	public void change20(int id) {
		userDao.change20(id);
	}

}
