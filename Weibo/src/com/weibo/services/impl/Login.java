package com.weibo.services.impl;
import org.apache.struts2.ServletActionContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.weibo.dao.UserDAO;
import com.weibo.domain.User;
import com.weibo.services.ILoginServices;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class Login implements ILoginServices{

	@SuppressWarnings("unchecked")
	private UserDAO userDAO;

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public boolean checkUser(String userName,String userPassword){
/*	   boolean flag = false;
	   String hql = "from User as user where user.username = '"+userName+"' and user.password = '"+userPassword+"'";
	   List<User> userList = this.getHibernateTemplate().find(hql);
	   if(userList.size()>0){
	    flag = true;
	   }
	   return flag;*/
		
		@SuppressWarnings("unchecked")
		List<User> list = (List<User>)userDAO.findByUsername(userName);
		for(int i=0;i<list.size();i++)
			if(list.get(i).getUsername().equals(userName))
				if(list.get(i).getPassword().equals(userPassword))
				{   HttpServletRequest request=ServletActionContext.getRequest();;
					HttpSession session = request.getSession(); 
					session.setAttribute("User",list.get(i));
					return true;}
		return false;
		
	}

}