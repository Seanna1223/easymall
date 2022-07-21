package easymall.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import easymall.po.Category;
import easymall.pojo.MyCategory;
import easymall.service.CategoryService;
import easymall.service.ProductsService;

@Controller
@RequestMapping("/admin")
public class AdminCategoryController {
	@Autowired
	private ProductsService productsService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping("/categorylist")
	public String categorylist(Model model) {// zz
		List<Category> category = categoryService.allcates();
		// 查询结果暴露给前端
		model.addAttribute("category", category);
		return "/admin/category_list";
	}

	@RequestMapping("/addcate")
	public String addcate(Model model) {
		List<String> categories = productsService.allcategories();
		model.addAttribute("categories", categories);
		model.addAttribute("mycategory", new MyCategory());
		return "/admin/add_cate";
	}

	@RequestMapping("/savecate")
	public String savecate(@Valid @ModelAttribute MyCategory mycategory, HttpServletRequest request, Model model)
			throws Exception {
		String msg1 = categoryService.savecate(mycategory, request);
		model.addAttribute("msg1", msg1);
		return "redirect:/admin/addcate";
	}

	@RequestMapping("/delcate")
	public String delcate(String name) {
		categoryService.delcate(name);
		return "redirect:/admin/categorylist";
	}
}
