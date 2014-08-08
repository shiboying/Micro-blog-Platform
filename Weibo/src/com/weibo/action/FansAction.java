package com.weibo.action;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.weibo.services.*;
import com.weibo.domain.*;

public class FansAction {

	IFansService fansService;
	User user;
	User temp;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public IFansService getFansService() {
		return fansService;
	}

	public void setFansService(IFansService fansService) {
		this.fansService = fansService;
	}
	
	public String addIdol() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();;
		HttpSession session = request.getSession();
		User userme=(User)session.getAttribute("User");
		fansService.setUserIdol(userme, user);
		return "success";
	}
	
	public String showFans()throws Exception{
		//System.out.println(user.getUserid());
		HttpServletRequest request=ServletActionContext.getRequest();;
		HttpSession session = request.getSession();
		List<User> userFanList=fansService.getUserFans(user);
		//System.out.println(userFanList.size());
		session.setAttribute("userList", userFanList );
		return "success";
	} 
	public String showIdol()throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();;
		HttpSession session = request.getSession();
		List<User> userIdolList=fansService.getUserIdol(user);
		session.setAttribute("userList",userIdolList );
		return "success";
	} 
	public String showCount()throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();;
		HttpSession session = request.getSession();
		temp=(User)session.getAttribute("User");
		session.setAttribute("fanscount", fansService.getUserFans(temp).size());
		session.setAttribute("followcount", fansService.getUserIdol(temp).size());
		return "success";
	}

}
