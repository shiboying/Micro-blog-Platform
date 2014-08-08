package com.weibo.action;

import com.opensymphony.xwork2.ActionSupport;
import com.weibo.domain.User;
import com.weibo.services.IWeiboServices;
import com.weibo.domain.Weibo;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

import org.apache.struts2.ServletActionContext;
public class WeiboAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private User temp;
	Timestamp tt = new Timestamp(System.currentTimeMillis());
	private List<Weibo> weiboList;
	private IWeiboServices IWeibo;
	private Weibo weibo;
	
	   public User getUser() {
			return user;
		}
		public void setUser(User user) {
			this.user = user;
		}
	public Weibo getWeibo() {
		return weibo;
	}
	public void setWeibo(Weibo weibo) {
		this.weibo = weibo;
	}
	public List<Weibo> getWeiboList() {
		return weiboList;
	}

	public void setWeiboList(List<Weibo> weiboList) {
		this.weiboList = weiboList;
	}
	
	public IWeiboServices getIWeibo() {
		return IWeibo;
	}

	public void setIWeibo(IWeiboServices iWeibo) {
		IWeibo = iWeibo;
	}
	
	public String sendweibo(){
		String page="fail";
		boolean flag=false;
	    HttpServletRequest request=ServletActionContext.getRequest();;
		HttpSession session = request.getSession(); 
		//session.setAttribute("User",user);
		//System.out.println(user.getUsername());
		weibo.setTime(tt);
		weibo.setRefercounts(0);
		weibo.setCmttconts(0);
		temp=(User)session.getAttribute("User");
		temp.setWcount(temp.getWcount()+1);
		weibo.setUser(temp);
		weibo.setRefid(-1);
		//System.out.println(weibo.getContent());
		flag=IWeibo.sendWeibo(weibo);
		if(flag){
			page="success";
		}
		return page;
		
	}
	public String listMyWeibo(){
		//此处要从session里获取当前登录的用户，
		HttpServletRequest request=ServletActionContext.getRequest();;
		HttpSession session = request.getSession(); 
		user=(User)session.getAttribute("User");
		weiboList = IWeibo.listUserWeibo(user);
		return "success";
	   }
	public String listUserWeibo(){
		//此处要从页面获取要显示的用户的id,形式为user.userid;
		weiboList = IWeibo.listUserWeibo(user);
		HttpServletRequest request=ServletActionContext.getRequest();;
		HttpSession session = request.getSession(); 
		session.setAttribute("weiboList", weiboList);
		return "success";
	}
	public String listIdolWeibo(){
		//此处要从session里获取当前登录的用户，
		HttpServletRequest request=ServletActionContext.getRequest();;
		HttpSession session = request.getSession(); 
		user=(User)session.getAttribute("User");
		//System.out.println(user.getUsername());
		weiboList = IWeibo.listIdolWeibo(user);
		session.setAttribute("weiboList", weiboList);
		return "success";
	}
}
