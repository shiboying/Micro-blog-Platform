package com.weibo.services.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.weibo.dao.UserDAO;
import com.weibo.domain.User;
import com.weibo.services.IRegisterServices;

import java.util.*;

public class Register implements IRegisterServices{

	@SuppressWarnings("unchecked")
	private UserDAO userDAO;

	public UserDAO getUser() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	public boolean addUser(User user){
		//System.out.println(user.getNickname());
		List<User> list=(List<User>)userDAO.findByUsername(user.getUsername());
		if(list.isEmpty()){
			userDAO.save(user); 
			list=userDAO.findByUsername(user.getUsername());
			list.get(0).setUsername(list.get(0).getUsername()+list.get(0).getUserid());
			userDAO.merge(list.get(0));
			return true;
			}else{
			return false;
		}
		
	}

}
