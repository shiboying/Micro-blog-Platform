package com.weibo.action;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


import com.weibo.services.IRegisterServices;
import com.weibo.domain.User;



public class RegisterAction extends ActionSupport{
private static final long serialVersionUID =2L;
	
private IRegisterServices IRegister;
private User user;
Timestamp tt = new Timestamp(System.currentTimeMillis());

public User getUser() {
	return user;
}

public void setUser(User user) {
	this.user = user;
}


public IRegisterServices getIRegister() {
	return IRegister;
}

public void setIRegister(IRegisterServices iRegister) {
	IRegister = iRegister;
}

public String execute(){
	   String page = "fail";
	   boolean flag = false;
	   int n = (int) (Math.random()   *   9000000)   +   1000000;
	   user.setUsername(""+n);
	   user.setRegtime(tt);
	   user.setUsertype(false);
	   user.setImage("./webpages/images/touxiang.jpg");
	   user.setWcount(0);
	   user.setFcount(0);
	   user.setCcount(0);
	   flag = IRegister.addUser(user);
	   if(flag){
	    page = "success";
	    HttpServletRequest request=ServletActionContext.getRequest();;
	    HttpSession session = request.getSession(); 
	    session.setAttribute("User",user);
	   }
	   return page;
	}

}
