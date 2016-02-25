package com.action;

import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;

public class BaseAction extends ActionSupport {
	protected UserService userService;
	
	public UserService getUserService(){
		return userService;
	}
	
	public void setUserService(UserService userService){
		this.userService = userService;
	}
}
