package com.weibo.services.impl;

import java.util.ArrayList;
import java.util.List;
import com.weibo.dao.*;
import com.weibo.domain.*;
import com.weibo.services.IFansService;

public class FansService implements IFansService {
	
	private Fans tempFans;
	private List<Fans> fansList;
	private List<User> userList;
	private FansDAO fansDAO;
	private UserDAO userDAO;
	
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public FansDAO getFansDAO() {
		return fansDAO;
	}

	public void setFansDAO(FansDAO fansDAO) {
		this.fansDAO = fansDAO;
	}

	public Fans getTempFans() {
		return tempFans;
	}

	public void setTempFans(Fans tempFans) {
		this.tempFans = tempFans;
	}

	//根据userid返回我关注的人的列表
	public List<User> getUserIdol(User user) {
		// TODO Auto-generated method stub
		
		fansList=fansDAO.findByFlwid(user.getUserid());			
		//遍历fans列表，取得我关注的人的列表
		userList = new ArrayList<User>();int i;
		for(i = 0;i<fansList.size();i++){
		  userList.add(fansList.get(i).getUserByFlwedid());
		}
		for(i=0;i<userList.size();i++)
		{
			userList.set(i, userDAO.findById(userList.get(i).getUserid()));
		}
		return userList;
	}



	public List<User> getUserFans(User user) {
		// TODO Auto-generated method stub
		fansList=fansDAO.findByFlwedid(user.getUserid());
		//System.out.println(fansList.size());
		userList = new ArrayList<User>();int i;
		for(i = 0;i<fansList.size();i++){
		  userList.add(fansList.get(i).getUserByFlwid());
		  
		}//System.out.println(userList.size());
		for(i=0;i<userList.size();i++)
		{
			userList.set(i, userDAO.findById(userList.get(i).getUserid()));
		}
		return userList;
	}



	public void setUserIdol(User u1,User u2) {
		// TODO Auto-generated method stub
		u2=(User)userDAO.findByUsername(u2.getUsername()).get(0);
		tempFans.setUserByFlwid(u1);
		tempFans.setUserByFlwedid(u2);
		fansDAO.save(tempFans);
	}





}




