package easymall.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import easymall.controller.BaseController;
import easymall.po.Category;
import easymall.po.Orders;
import easymall.po.Products;
import easymall.pojo.MyProducts;
import easymall.service.CategoryService;
import easymall.service.OrderService;
import easymall.service.ProductsService;

@Controller
@RequestMapping("/admin")
public class ProductsControllerAdmin extends BaseController {
	@Autowired
	private ProductsService productsService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private OrderService orderService;

	@RequestMapping("/prodlist")
	public String prodlist(Model model) {
		List<Products> products = productsService.allprods();
		// 查询结果暴露给前端
		model.addAttribute("products", products);
		return "/admin/prod_list";
	}

	@RequestMapping("/addprod")
	public String addprod(Model model) {
		List<String> categories = productsService.allcategories();
		model.addAttribute("categories", categories);
		model.addAttribute("myproducts", new MyProducts());
		return "/admin/add_prod";
	}

	@RequestMapping("/save")
	public String save(@Valid @ModelAttribute MyProducts myproducts, HttpServletRequest request, Model model)
			throws Exception {
		String msg = productsService.save(myproducts, request);
		model.addAttribute("msg", msg);
		return "redirect:/admin/addprod";
	}

	@RequestMapping("/OnSale")
	public String OnSale(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("status", 1);
		productsService.updateSaleStatus(map);
		return "redirect:/admin/prodlist";
	}

	@RequestMapping("/OffSale")
	public String OffSale(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("status", 0);
		productsService.updateSaleStatus(map);
		return "redirect:/admin/prodlist";
	}

	@RequestMapping("/topsales") // qaz
	public String topsales(Model model) {
		List<Products> topsales_products = productsService.toprods();
		// 查询结果暴露给前端
		model.addAttribute("products", topsales_products);
		return "/admin/top_sales";
	}

	@RequestMapping("/showecharts") // qaz
	public String showecharts(Model model) {
		List<Products> products = productsService.allprods();
		List<String> categories = productsService.allcategories();
		List<Orders> orders = orderService.findAllOrder();
		int[] cate = new int[4];
		int[][] arr = new int[categories.size()][4];
		Map<String, Integer> map = new TreeMap<String, Integer>();

		for (Products prod : products) {
			int value = prod.getSoldnum();
			if (map.containsKey(prod.getCategory())) {
				value += map.get(prod.getCategory());
			}
			map.put(prod.getCategory(), value);

			int index = categories.indexOf(prod.getCategory());// 获取下标
			if (prod.getPrice() > 0 && prod.getPrice() <= 100)
				arr[index][0]++;
			else if (prod.getPrice() > 100 && prod.getPrice() <= 1000)
				arr[index][1]++;
			else if (prod.getPrice() > 1000 && prod.getPrice() <= 5000)
				arr[index][2]++;
			else
				arr[index][3]++;
		}
		for (Orders order : orders) {
			cate[order.getPaystate()]++;
		}

		model.addAttribute("entryset", map.entrySet());// 品类-》销量
		model.addAttribute("categories", categories);// 品类-》序号
		model.addAttribute("arr", arr);// 品类-》价格区间
		model.addAttribute("cate", cate);// 订单状态

		return "/admin/show_echarts";
	}

	@RequestMapping("/modifyprod")
	public String modifyprod(String id, Model model) {

		List<String> categories = productsService.allcategories();
		model.addAttribute("categories", categories);
		Products prod = productsService.proInfo(id);
		model.addAttribute("prod", prod);

		return "/admin/modify_prod";
	}

	@RequestMapping("/updateprod")
	public String update(@ModelAttribute MyProducts myProducts, String id, HttpServletRequest request, Model model) {

		System.out.println("in update");
		System.out.println(myProducts);
		productsService.updateProd(myProducts, request, id);

		return "forward:/admin/prodlist";
	}

	@RequestMapping("/modifyCategory")
	public String modifyCategory(String name, Model model) {
		System.out.println("in modify cate");
		Category category = categoryService.findone(name);
		System.out.println("this cate:" + category);
		model.addAttribute("c", category);
		return "/admin/modify_category";
	}

	@RequestMapping("/updatecategory")
	public String updatecategory(String id, String name, String description) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		map.put("description", description);
		System.out.println(id + ',' + description + ',' + name);
		categoryService.updateCate(map);
		return "forward:/admin/categorylist";
	}

}
