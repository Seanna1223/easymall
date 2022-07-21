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
			model.addAttribute("message", "��������û������ˣ�");
			return "login";
		} else if (user1.getPassword().equals(user.getPassword())) {
			session.setAttribute("user", user1);
			return "redirect:/index.jsp";
		} else {
			model.addAttribute("message", "���������������ˣ�");
			return "login";
		}
	}

	// /user/checkUser
	@RequestMapping("/checkUser")
	public void checkUser(String username, HttpServletResponse response) throws IOException {
		if (userService.login(username) != null) {
			response.getWriter().print("��������û����ѱ�ע��");
		} else {
			response.getWriter().print("��ϲ������������û�������ʹ�ã�");
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
			model.addAttribute("msg", "�û�������Ϊ�գ�");
			return "regist";
		}
		if ("".equals(user.getPassword()) || user.getPassword() == null) {
			model.addAttribute("msg", "���벻��Ϊ�գ�");
			return "regist";
		}
		if (!valistr.equalsIgnoreCase(session.getAttribute("code").toString())) {
			model.addAttribute("msg", "��֤�벻һ�£�");
			return "regist";
		}
		
		
		if (userService.login(user.getUsername()) != null) {
			model.addAttribute("msg", "��������ע�ᣡ");
			return "regist";
		}
		if (userService.regist(user) > 0) {
			user.setPassword((user.getPassword()));
			model.addAttribute("msg", "ע��ɹ���");
		} else {
			model.addAttribute("msg", "ע��ʧ�ܣ�");
		}
		return "regist";
	}

}
