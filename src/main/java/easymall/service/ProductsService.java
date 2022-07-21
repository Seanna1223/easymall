package easymall.service;

import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.apache.tools.ant.taskdefs.condition.Http;

import easymall.po.Products;
import easymall.pojo.MyProducts;

public interface ProductsService {

	public List<String> allcategories();
	public List<Products> prodlist(Map<String,Object> map);
	public Products proInfo(String pid);
	public Products oneProduct(String product_id);
	public String save(MyProducts myproducts, HttpServletRequest request);
	public List<Products> allprods();
	public void updateSaleStatus(Map<String, Object> map);
	public List<Products> toprods();//qaz
	public String updateProd(MyProducts myProduct,HttpServletRequest request, String id);
	
}
