package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javassist.expr.NewArray;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Buy;
import com.entity.BuyDAO;
import com.entity.Product;
import com.entity.ProductDAO;
import com.entity.Sell;
import com.entity.SellDAO;
import com.entity.Users;
import com.entity.UsersDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProductAction extends BaseAction{

	private Product product;
	private List< Product> products;
	
	public String productDetails()  {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		ProductDAO productDAO = (ProductDAO)context.getBean("ProductDAO");
		HttpServletRequest req = ServletActionContext.getRequest();
		String pno = req.getParameter("pno");
		try {
			product = productDAO.findById(pno);
			if(product == null){
				return "fail";
			}
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	public String publishProduct(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		ProductDAO productDAO = (ProductDAO)context.getBean("ProductDAO");
		SellDAO sellDAO = (SellDAO)context.getBean("SellDAO");
		Map<String,Object >session  =  ActionContext.getContext().getSession();
		Users user = (Users) session.get("user");
		if(user  == null){
			return "relogin";
		}
			
		try {
			Sell sell   = new Sell();
			sell.setProduct(product);
			sell.setUsers(user);
			sell.setId(Integer.toString(sellDAO.getCount()+10000));
			sell.setSstate("正在出售");
			product.setPno("P"+Integer.toString(productDAO.getCount()+1001));
			SimpleDateFormat myFm1=new SimpleDateFormat("yy/MM/dd HH:mm"); 
			sell.setSdate(myFm1.format(new Date()));
			//不用级联保存
			productDAO.save(product);
			sellDAO.save(sell);
			//更新用户信息
			UsersDAO usersDAO = (UsersDAO)context.getBean("UsersDAO");
			user = usersDAO.findById(((Users)session.get("user")).getUno());
			Hibernate.initialize(user.getSells());
			session.put("user", user);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	public String buyProduct()  {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		ProductDAO productDAO = (ProductDAO)context.getBean("ProductDAO");
		UsersDAO usersDAO = (UsersDAO)context.getBean("UsersDAO");
		BuyDAO buyDAO = (BuyDAO)context.getBean("BuyDAO");
		SellDAO sellDAO = (SellDAO)context.getBean("SellDAO");
		Map<String,Object >session  =  ActionContext.getContext().getSession();
		HttpServletRequest req = ServletActionContext.getRequest();
		String pno = req.getParameter("pno");
		try {
			Users user = (Users)session.get("user");
			product = productDAO.findById(pno);
			if(user == null){
				return "nologin";
			}else if(product == null){
				session.put("errorMsg", "对不起,此商品不存在.");
				return "fail";
			}
			Set<Sell> sells = product.getSells();
			Sell sell = null;
			for(Sell s : sells){//找到最新的卖单
				if(sell == null){
					sell = s;
				}else{
					if(s.getId().compareTo(sell.getId())==1){
						sell = s;
					}
				}
			}
			if(sell == null){
				session.put("errorMsg", "对不起,此商品已下架.");
				return "fail";
			}
			if( ! sell.getSstate().equals("正在出售")){
				session.put("errorMsg", "对不起,此商品已出售.");
				return "fail";
			}
			if(sell.getUsers() != null && sell.getUsers().getUno().equals(user.getUno())){
				session.put("errorMsg", "不能购买自己发布的商品哦.");
				return "fail";
			}
			SimpleDateFormat myFm1=new SimpleDateFormat("yy/MM/dd HH:mm"); 
			sell.setSstate("等待付款");
			sell.setSdate(myFm1.format(new Date()));
			
			Buy buy = new Buy();
			buy.setId("" + 1000 + buyDAO.getCount());
			
			buy.setBdate(sell.getSdate());
			buy.setBstate("未付款");
			buy.setUsers(user);
			buy.setProduct(product);
			buyDAO.save(buy);
			sellDAO.merge(sell);
			user = usersDAO.findById(user.getUno());//更新USER
			session.put("user", user);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	public String removeProduct(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		ProductDAO productDAO = (ProductDAO)context.getBean("ProductDAO");
		UsersDAO usersDAO = (UsersDAO)context.getBean("UsersDAO");
		SellDAO sellDAO = (SellDAO)context.getBean("SellDAO");
		Map<String,Object >session  =  ActionContext.getContext().getSession();
		HttpServletRequest req = ServletActionContext.getRequest();
		String pno = req.getParameter("pno");
		try {
			Users user = (Users)session.get("user");
			product = productDAO.findById(pno);
			if(user == null){
				return "nologin";
			}else if(product == null){
				session.put("errorMsg", "对不起,此商品不存在.");
				return "fail";
			}else if( ! (product.getBuies() == null || product.getBuies().size() == 0)){
				session.put("errorMsg", "对不起,此商品已经有人购买，不能删除.");
				return "fail";
			}
			Product noProduct = productDAO.findById("0");//删除后的商品的卖单一律指向这个空商品
			Set<Sell> sells = product.getSells();
			for(Sell s : sells){
				s.setSstate("已作废");
				s.setProduct(noProduct);
				sellDAO.merge(s);
			}
			productDAO.delete(product);
			user = usersDAO.findById(user.getUno());//更新USER
			session.put("user", user);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
}
