package easymall.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import easymall.po.Category;
import easymall.po.Products;
import easymall.pojo.MyCategory;

public interface CategoryService {

	public String savecate(MyCategory mycategory, HttpServletRequest request);
	public void delcate(String name);
	public List<Category> categorylist(Map<String,Object> map);
	public List<Category> allcates();
	public Category findone(String name);
	public void updateCate(Map<String, Object> map);
}
