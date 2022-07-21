package easymall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import easymall.po.Category;
import easymall.po.Products;

@Repository
@Mapper
public interface CategoryDao {

	public void savecate(Category category);
	public List<Category> categorylist(Map<String,Object> map);
	public void delcate(String name);
	public List<Category> allcates();
	public void updateCate(Map<String, Object> map);
	public Category findone(String name);
}
