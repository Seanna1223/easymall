package easymall.controller.admin;//qwe

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import easymall.controller.BaseController;
import easymall.po.OrderItem;
import easymall.po.Orders;
import easymall.po.Products;
import easymall.pojo.OrderInfo;
import easymall.service.OrderService;
import easymall.service.ProductsService;

@Controller
@RequestMapping("/admin")
public class AdminOrderController extends BaseController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private ProductsService productsService;

	@RequestMapping("/allorder")
	public String allorder(HttpSession session, Model model) {
		List<OrderInfo> orderInfoList = findAllOrderInfo();
		model.addAttribute("orderInfos", orderInfoList);
		return "/admin/manage_list";
	}

	private List<OrderInfo> findAllOrderInfo() {
		List<OrderInfo> orderInfoList = new ArrayList<OrderInfo>();
		List<Orders> orderList = orderService.findAllOrder();

		for (Orders order : orderList) {
			List<OrderItem> orderItems = orderService.orderitem(order.getId());
			Map<Products, Integer> map = new HashMap<Products, Integer>();
			for (OrderItem orderItem : orderItems) {
				Products product = productsService.oneProduct(orderItem.getProduct_id());
				map.put(product, orderItem.getBuynum());
			}
			OrderInfo orderInfo = new OrderInfo();
			orderInfo.setOrder(order);
			orderInfo.setMap(map);

			orderInfoList.add(orderInfo);
		}
		return orderInfoList;
	}

}
