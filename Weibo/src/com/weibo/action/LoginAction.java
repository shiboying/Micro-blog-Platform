package com.weibo.action;


import com.weibo.dao.*;

import com.opensymphony.xwork2.ActionSupport;

import com.weibo.services.ILoginServices;

import com.weibo.action.*;

import com.weibo.domain.User;



public class LoginAction extends ActionSupport{

/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
//private User user;
private ILoginServices Ilogin;
private User user;
private UserDAO userdao;


public UserDAO getUserdao() {
	return userdao;
}
public void setUserdao(UserDAO userdao) {
	this.userdao = userdao;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}



public ILoginServices getLogin() {
	return Ilogin;
}
public void setLogin(ILoginServices login) {
	this.Ilogin = login;
}
public String execute(){
   String page = "fail";
   boolean flag = false;
   //System.out.println(user.getUsername()+user.getPassword());
   flag = Ilogin.checkUser(user.getUsername(), user.getPassword());
   if(flag){
    page = "success";
	//user=(User) userdao.findByUsername(user.getUsername()).get(0);
   }
   return page;
}
}

