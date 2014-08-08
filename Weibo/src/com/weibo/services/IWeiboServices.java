package com.weibo.services;
import java.util.List;

import com.weibo.domain.*;

public interface IWeiboServices {
	public boolean sendWeibo(Weibo weibo);
	 public List<Weibo> listUserWeibo(User currentUser);
	    public List<Weibo> listIdolWeibo(User user);
}
