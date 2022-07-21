package easymall.controller.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class MailUtil implements Runnable {
	private String email;// 收件人邮�?
	private String code;// 验证�?

	public MailUtil(String email, String code) {
		this.email = email;
		this.code = code;
	}

	public void run() {
		// 1.创建连接对象javax.mail.Session
		// 2.创建邮件对象 javax.mail.Message
		// 3.发�?�一封激活邮�?
		String from = "1097794352@qq.com";// 发件人电子邮�?
		String host = "smtp.qq.com"; // 指定发邮件的主机smtp.qq.com(QQ)|smtp.163.com(网易)

		Properties properties = System.getProperties();// 获取系统属�??

		properties.setProperty("mail.smtp.host", host);// 设置邮件服务�??
		properties.setProperty("mail.smtp.auth", "true");// 打开认证

		try {
			// QQ邮箱�?要下面这段代码，163邮箱不需�?
			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.ssl.socketFactory", sf);

			// 1.获取默认session对象
			Session session = Session.getDefaultInstance(properties, new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("1097794352@qq.com", "qnjhflfebukjgdia"); // 发件人邮箱账号授权码
				}
			});

			// 2.创建邮件对象
			Message message = new MimeMessage(session);
			// 2.1设置发件
			message.setFrom(new InternetAddress(from));
			// 2.2设置接收
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 2.3设置邮件主题
			message.setSubject("【EasyMall】账号激活码");
			// 2.4设置邮件内容 //这是一封来自EasyMall的激活码邮件,请您进行填写激活码操作
			String content = "<html><head></head><body><h1>您的注册激活码如下，如需注册请填写激活码，请勿泄露于他人！</h1><h3>" + code
					+ "</h3></body></html>";
			message.setContent(content, "text/html;charset=UTF-8");
			// 3.发邮�?
			Transport.send(message);
			System.out.println("邮件发送成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
