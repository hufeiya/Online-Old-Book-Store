package com.test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Product;
import com.entity.ProductDAO;
import com.entity.Users;
import com.entity.UsersDAO;

public class Test {

	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		//查找产品
		ProductDAO productDAO = (ProductDAO)applicationContext.getBean("ProductDAO");
		Product product = productDAO.findById("P02");
		System.out.print(product.getPbrand());
		System.out.print(product.getPdate());
		System.out.print(product.getPintroducer());
		System.out.print(product.getPname());
		System.out.print(product.getPphoto());
		//添加用户
		UsersDAO usersDAO = (UsersDAO)applicationContext.getBean("UsersDAO");
		Users user  = new Users("f4d","uname", "upass");
		int result = usersDAO.save(user);
		if (result == 1){
			System.out.print("插入成功");
		}
		//更改用户名
		user.setUname("changeed");
		usersDAO.merge(user);
		//删除用户
		usersDAO.delete(user);
	}

}
