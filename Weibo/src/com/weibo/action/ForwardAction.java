package com.weibo.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.weibo.services.IForwardWeibo;
import com.weibo.dao.UserDAO;
import com.weibo.domain.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.io.IOException;
import net.sf.json.JSONArray;
import org.apache.*;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import net.sf.json.util.JSONUtils;
import com.opensymphony.*;
import com.opensymphony.xwork2.ActionSupport;

public class ForwardAction extends ActionSupport{
	
	
	/**
	 * 
	 */

	IForwardWeibo iForwardWeibo;
	UserDAO userDAO;
	
	private Weibo newWeibo;	
	private Weibo oldWeibo;
	private String newCommentString;
	private String oldCommentString;
	private String refWeiboContent;
	int oldWeibowid;
	
	public int getOldWeibowid() {
		return oldWeibowid;
	}

	public void setOldWeibowid(int oldWeibowid) {
		this.oldWeibowid = oldWeibowid;
	}

	public String getOldCommentString() {
		return oldCommentString;
	}

	public void setOldCommentString(String oldCommentString) {
		this.oldCommentString = oldCommentString;
	}

	public String getRefWeiboContent() {
		return refWeiboContent;
	}

	public void setRefWeiboContent(String refWeiboContent) {
		this.refWeiboContent = refWeiboContent;
	}

	public String getNewCommentString() {
		return newCommentString;
	}

	public void setNewCommentString(String newCommentString) {
		this.newCommentString = newCommentString;
	}

	
	public Weibo getNewWeibo() {
		return newWeibo;
	}

	public void setNewWeibo(Weibo newWeibo) {
		this.newWeibo = newWeibo;
	}

	
	public Weibo getOldWeibo() {
		return oldWeibo;
	}


	public void setOldWeibo(Weibo oldWeibo) {
		this.oldWeibo = oldWeibo;
	}

	@JSON(serialize=false)
	public IForwardWeibo getiForwardWeibo() {
		return iForwardWeibo;
	}


	public void setiForwardWeibo(IForwardWeibo iForwardWeibo) {
		this.iForwardWeibo = iForwardWeibo;
	}
	
	@JSON(serialize=false)
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	public String sendForwardWeibo()
	{
		HttpServletRequest request=ServletActionContext.getRequest();;
		HttpSession session = request.getSession(); 
		newWeibo=new Weibo();			
		newWeibo.setUser((User)session.getAttribute("User"));	
			
			oldWeibo=(Weibo)iForwardWeibo.getOldWeibo(oldWeibowid);	
			oldWeibo.setUser(userDAO.findById(oldWeibo.getUser().getUserid()));
			
					


			
			newWeibo.setContent(newCommentString);
			newWeibo.setRefid(oldWeibo.getWid());
			Timestamp tt = new Timestamp(System.currentTimeMillis());
			newWeibo.setTime(tt);
			

			newWeibo.setUser((User)userDAO.findById(oldWeibo.getUser().getUserid()));
			newWeibo.setRefercounts(0);
			newWeibo.setCmttconts(0);
			
			iForwardWeibo.saveWeibo(newWeibo);
	
			iForwardWeibo.renewOldWeibo(oldWeibo);
			
			oldWeibo.setSetsNull();
			newWeibo.setSetsNull();
			
			return "success";		


	}
	
	
	
	
	public String getShowString()
	{
		//System.out.println(oldWeibo.getWid());
		
		//oldWeibo.setWid(7);
		System.out.println(oldWeibowid);
		oldWeibo=(Weibo)iForwardWeibo.getOldWeibo(oldWeibowid);	
		oldWeibo.setUser(userDAO.findById(oldWeibo.getUser().getUserid()));
		
		newWeibo=new Weibo();			
		newWeibo.setUser(userDAO.findById(oldWeibo.getUser().getUserid()));
		
		if(oldWeibo.getRefid()==-1)
		{
			
			refWeiboContent=oldWeibo.getUser().getNickname()+":"+oldWeibo.getContent();
			oldCommentString="";
			
		}else{
			Weibo temp=new Weibo();
			temp=(Weibo)iForwardWeibo.getOldWeibo(oldWeibo.getRefid());
			temp.setUser(userDAO.findById(temp.getUser().getUserid()));
			refWeiboContent=temp.getUser().getNickname()
			+":"+temp.getContent();
			
			oldCommentString="  ||"+oldWeibo.getUser().getNickname()
			+":"+oldWeibo.getContent();
		}
		
		oldWeibo.setSetsNull();
		newWeibo.setSetsNull();
		
		return "success";
	}


	







}
