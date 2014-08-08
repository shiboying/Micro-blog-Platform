/**
 * 
 */
package com.weibo.services.impl;

import java.util.ArrayList;
import java.util.List;

import com.weibo.domain.Weibo;
import com.weibo.services.IForwardWeibo;
import com.weibo.dao.*;
/**
 * @author JasonYang
 *
 */
public class ForwardWeibo implements IForwardWeibo {

	/* (non-Javadoc)
	 * @see com.weibo.services.IForwardWeibo#forwardWeibo(com.weibo.domain.Weibo)
	 */

	private WeiboDAO weiboDAO;
	
	
	
	public WeiboDAO getWeiboDAO() {
		return weiboDAO;
	}

	public void setWeiboDAO(WeiboDAO weiboDAO) {
		this.weiboDAO = weiboDAO;
	}

	public boolean saveWeibo(Weibo weibo) {
		// TODO Auto-generated method stub
		
			weiboDAO.save(weibo);
			return true;
			

		
	}


	public boolean renewOldWeibo(Weibo weibo)
	{
	
			int temp=weibo.getRefercounts()+1;
			weibo.setRefercounts(temp);
			weiboDAO.attachDirty(weibo);			
			return true;

		
	
	}
	public Weibo getOldWeibo(int wid)
	{
/*		Weibo oldWeibo=new Weibo();
		
		oldWeibo=weiboDAO.findById(wid);*/
		
		List<Weibo> list=new ArrayList<Weibo>();
		list=weiboDAO.findAll();
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i).getWid().equals(wid))
				return list.get(i);
		}
		
		return null;
		
		
/*		String hqlString="from Weibo as aa where aa.wid="+wid;
		
		return weiboDAO.findById(wid);*/
	}
	


}
