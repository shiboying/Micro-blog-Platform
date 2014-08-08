package com.weibo.services;
import com.weibo.domain.*;
import java.util.List;
public interface IFansService {

	
	public List<User> getUserFans(User user);//查找关注我的人
	public void setUserIdol(User u1,User u2);//+关注
	public List<User> getUserIdol(User user);//查找我关注的人
}

