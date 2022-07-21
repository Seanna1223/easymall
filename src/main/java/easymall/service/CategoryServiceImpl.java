package easymall.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import easymall.dao.CategoryDao;
import easymall.po.Category;
import easymall.pojo.MyCategory;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;

	@Override
	public String savecate(MyCategory mycategory, HttpServletRequest request) {
		Category category = new Category();
		category.setName(mycategory.getName());
		category.setDescription(mycategory.getDescription());
		categoryDao.savecate(category);
		return "商品类别添加成功";
	}

	@Override
	public void delcate(String name) {
		categoryDao.delcate(name);

	}

	@Override
	public List<Category> categorylist(Map<String, Object> map) {
		return categoryDao.categorylist(map);
	}

	@Override
	public List<Category> allcates() {
		return categoryDao.allcates();
	}


	@Override
	public void updateCate(Map<String, Object> map) {
		categoryDao.updateCate(map);
		
	}

	@Override
	public Category findone(String name) {
		return categoryDao.findone(name);
	}



}
