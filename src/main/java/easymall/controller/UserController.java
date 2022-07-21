package easymall.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import easymall.controller.mail.CodeUtil;
import easymall.controller.mail.MailUtil;
import easymall.po.User;
import easymall.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	public String login(User user, HttpSession session, Model model) {
		User user1 = userService.login(user.getUsername());
		if (user1 == null) {
			model.addAttribute("message", "您输入的用户名错了！");
			return "login";
		} else if (user1.getPassword().equals(user.getPassword())) {
			session.setAttribute("user", user1);
			return "redirect:/index.jsp";
		} else {
			model.addAttribute("message", "您输入的密码输错了！");
			return "login";
		}
	}

	// /user/checkUser
	@RequestMapping("/checkUser")
	public void checkUser(String username, HttpServletResponse response) throws IOException {
		if (userService.login(username) != null) {
			response.getWriter().print("您输入的用户名已被注册");
		} else {
			response.getWriter().print("恭喜您，您输入的用户名可以使用！");
		}
	}
	
	@RequestMapping("/getcode")
	public void getcode(String email,HttpSession session){
		String emcode=CodeUtil.generateUniqueCode();
		session.setAttribute("emcode", emcode);
		System.out.println(email);
		new Thread(new MailUtil(email, emcode)).start();;
		System.out.println(emcode);
	}

	// /user/regist
	@RequestMapping("/regist")
	public String regist(User user, String valistr, HttpSession session, Model model) {
		if ("".equals(user.getUsername()) || user.getUsername() == null) {
			model.addAttribute("msg", "用户名不能为空！");
			return "regist";
		}
		if ("".equals(user.getPassword()) || user.getPassword() == null) {
			model.addAttribute("msg", "密码不能为空！");
			return "regist";
		}
		if (!valistr.equalsIgnoreCase(session.getAttribute("code").toString())) {
			model.addAttribute("msg", "验证码不一致！");
			return "regist";
		}
		
		
		if (userService.login(user.getUsername()) != null) {
			model.addAttribute("msg", "不能重新注册！");
			return "regist";
		}
		if (userService.regist(user) > 0) {
			user.setPassword((user.getPassword()));
			model.addAttribute("msg", "注册成功！");
		} else {
			model.addAttribute("msg", "注册失败！");
		}
		return "regist";
	}

}
