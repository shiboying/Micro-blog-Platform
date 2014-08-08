package com.weibo.services.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.weibo.dao.UserDAO;
import com.weibo.dao.WeiboDAO;
import com.weibo.domain.User;
import com.weibo.domain.Weibo;
import com.weibo.services.IWeiboServices;

public class WeiboService implements IWeiboServices {
	private WeiboDAO weiboDAO;
	private UserDAO userDAO;
	private Weibo tempWeibo;
	private List<Weibo> weiboList;
	private List<User> userList;
	private FansService fansService;
	
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}	
	public WeiboDAO getWeiboDAO() {
		return weiboDAO;
	}

	public void setWeiboDAO(WeiboDAO weiboDAO) {
		this.weiboDAO = weiboDAO;
	}

	public Weibo getTempWeibo() {
		return tempWeibo;
	}

	public void setTempWeibo(Weibo tempWeibo) {
		this.tempWeibo = tempWeibo;
	}

	public List<Weibo> getWeiboList() {
		return weiboList;
	}

	public void setWeiboList(List<Weibo> weiboList) {
		this.weiboList = weiboList;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public FansService getFansService() {
		return fansService;
	}

	public void setFansService(FansService fansService) {
		this.fansService = fansService;
	}

	public boolean sendWeibo(Weibo weibo){
		userDAO.merge(weibo.getUser());
		weiboDAO.save(weibo);
		return true;
	}
	//返回用户的微博
	public List<Weibo> listUserWeibo(User currentUser) {
		// TODO Auto-generated method stub
		tempWeibo = new Weibo();
		tempWeibo.setUser(currentUser);
		//测试
//		System.out.println(currentUser.getUserid().toString());
		
		return weiboDAO.findByAuthorid(currentUser.getUserid());
	}
    //返回关注的人和自己的微博
	public List<Weibo> listIdolWeibo(User user) {
		// TODO Auto-generated method stub
		//取得关注的人的列表
		userList = fansService.getUserIdol(user);
		//加上user自己
		userList.add(user);
		//从数据库取出这些user的微博
		weiboList = new ArrayList<Weibo>();
		for(int i = 0;i<userList.size();i++){
			weiboList.addAll(weiboDAO.findByAuthorid(userList.get(i).getUserid()));	    
		}
		//根据时间排序
		Comparator c=new MyComparator();
		Collections.sort(weiboList, c);
		return weiboList;
	}

}

class MyComparator implements Comparator<Weibo> {  
	  
    public int compare(Weibo s1, Weibo s2) {  
        if(s1.getTime().before(s2.getTime())){  
            return 1;  
        } else if(s1.getTime().after(s2.getTime())) {  
            return -1;  
        }  
        return 0;  
    }  
  
}   

