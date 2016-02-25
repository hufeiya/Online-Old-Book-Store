package com.service;

import com.entity.Users;

public class UserService {

	private static Users user = new Users("deaf", "deafult", "deafult");
	
	public Users getUser(){
		return UserService.user;
	}
	
	public void saveUser(Users userbean){
		UserService.user.setUname(userbean.getUname());
		UserService.user.setAdministrators(userbean.getAdministrators());
		UserService.user.setBuies(userbean.getBuies());
		UserService.user.setSells(userbean.getSells());
		UserService.user.setUno(userbean.getUno());
		UserService.user.setUpass(userbean.getUpass());
	}
}
