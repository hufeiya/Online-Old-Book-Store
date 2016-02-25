package com.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javassist.expr.NewArray;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Administrator;
import com.entity.AdministratorDAO;
import com.entity.Buy;
import com.entity.BuyDAO;
import com.entity.Product;
import com.entity.ProductDAO;
import com.entity.Sell;
import com.entity.SellDAO;
import com.entity.Users;
import com.entity.UsersDAO;
import com.opensymphony.xwork2.ActionContext;

public class UserAction extends BaseAction {

	private Users user;
	public String quit() throws Exception {
		Map<String,Object >session  =  ActionContext.getContext().getSession();
		session.clear();
		return SUCCESS;
		
	}
	
	@SuppressWarnings("unchecked")
	public String login() throws Exception{
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		Map<String,Object >session  =  ActionContext.getContext().getSession();
		HttpServletRequest req = ServletActionContext.getRequest();
		String uno = req.getParameter("uno");
		String password = req.getParameter("password");
		String isAdmin = req.getParameter("admin");
		if(isAdmin != null)//管理员登陆
		{
			AdministratorDAO aDao = (AdministratorDAO)context.getBean("AdministratorDAO");
			Administrator administrator = aDao.findById(uno);
			//没登陆成功
			if(administrator == null || !administrator.getApass().equals(password))
			{
				session.put("responseError", "true");
				return INPUT;
			}
			else//登陆成功
			{	//获取可管理的信息
				UsersDAO usersDAO = (UsersDAO)context.getBean("UsersDAO");
				ProductDAO productDAO = (ProductDAO)context.getBean("ProductDAO");
				BuyDAO buyDAO = (BuyDAO)context.getBean("BuyDAO");
				List<Users>users =  usersDAO.findAll();
				List<Buy> buys = buyDAO.findAll();
				List<Product> products = productDAO.findAll();
				
				session.put("admin", administrator);//存储管理员会话信息
				session.put("users", users);
				session.put("products", products);
				session.put("boughts", buys);
				return "admin";
			}
			
		}
		else//用户登陆
		{
			UsersDAO usersDAO = (UsersDAO)context.getBean("UsersDAO");
			user = usersDAO.findById(uno);
			//没登陆成功
			if(user == null || !user.getUpass().equals(password))
			{
				session.put("responseError", "true");
				return INPUT;
			}
			else//登陆成功
			{
				Hibernate.initialize(user);
				Hibernate.initialize(user.getSells());
				session.put("user", user);//存储用户会话信息
				//session.put("buy",new HashSet<Buy>(user.getBuies()));
				//session.put("sell", new HashSet<Sell>(user.getSells()));
				return "user";
			}
		}
		
	}
	
	public String regist() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UsersDAO usersDAO = (UsersDAO)context.getBean("UsersDAO");
		HttpServletRequest req = ServletActionContext.getRequest();
		String uno = req.getParameter("uno");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		user = userService.getUser();
		user.setUno(uno);
		user.setUname(username);
		user.setUpass(password);
		int result = usersDAO.save(user);
		if(result == 1){
			Map<String,Object >session  =  ActionContext.getContext().getSession();
			session.put("user", user);
			return "success";
		}else{
			return "input";
		}
	}
	
	public String changeUser() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UsersDAO usersDAO = (UsersDAO)context.getBean("UsersDAO");
		Map<String,Object >session  =  ActionContext.getContext().getSession();
		Administrator admin = (Administrator)session.get("admin");//检查登录
		if (admin == null){
			return "fail";
		}
		HttpServletRequest req = ServletActionContext.getRequest();
		String uno = req.getParameter("uno");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		user = userService.getUser();
		user.setUno(uno);
		user.setUname(username);
		user.setUpass(password);
		try {
			Users newUser = usersDAO.merge(user);
			if(newUser != null){
				//更新user列表
				List<Users>users =  usersDAO.findAll();
				session.put("users", users);
				return SUCCESS;
			}else{
				return "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	public String deleteUser() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UsersDAO usersDAO = (UsersDAO)context.getBean("UsersDAO");
		Map<String,Object >session  =  ActionContext.getContext().getSession();
		Administrator admin = (Administrator)session.get("admin");//检查登录
		if (admin == null){
			return "fail";
		}
		HttpServletRequest req = ServletActionContext.getRequest();
		String uno = req.getParameter("deleteuno");
		user = userService.getUser();
		user.setUno(uno);
		try {
			usersDAO.delete(user);
			List<Users>users =  usersDAO.findAll();
			session.put("users", users);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	public String listProducts() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		ProductDAO productDAO = (ProductDAO)context.getBean("ProductDAO");
		SellDAO sellDAO = (SellDAO)context.getBean("SellDAO");
		Map<String,Object >session  =  ActionContext.getContext().getSession();
		try {
			
			List<Product> products = new ArrayList<>();
			Sell exampleSell = new Sell();
			exampleSell.setSstate("正在出售");
			List<Sell> sells = sellDAO.findByExample(exampleSell);//只显示正在出售的商品
			for(Sell sell : sells){
				products.add(sell.getProduct());
			}
			
			//List<Product> products = productDAO.findAll();
			session.put("products", products);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	public String refresh(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		Map<String,Object >session  =  ActionContext.getContext().getSession();
		Users user   = (Users)session.get("user");
		if(user == null){
			return "fail";
		}
		try{
			UsersDAO usersDAO = (UsersDAO)context.getBean("UsersDAO");
			user = usersDAO.findById(user.getUno());
			Hibernate.initialize(user);
			session.put("user", user);//存储用户会话信息
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}
}
