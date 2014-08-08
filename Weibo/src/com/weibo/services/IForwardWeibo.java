/**
 * 
 */
package com.weibo.services;

import com.weibo.dao.WeiboDAO;
import com.weibo.domain.Weibo;

/**
 * @author JasonYang
 *
 */
public interface IForwardWeibo {

	public boolean saveWeibo(Weibo weibo);
	public boolean renewOldWeibo(Weibo weibo);
	public Weibo getOldWeibo(int wid);
	
}
