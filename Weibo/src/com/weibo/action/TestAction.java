package com.weibo.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.io.IOException;

import net.sf.json.JSONArray;
import org.apache.*;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts2.ServletActionContext;
import net.sf.json.util.JSONUtils;



import com.opensymphony.*;
import com.opensymphony.xwork2.ActionSupport;

import com.weibo.domain.*;



public class TestAction extends ActionSupport{
	
	private int wid;
	private List<Comment> comments;
	
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public int getWid() {
		return wid;
	}
	public void setWid(int wid) {
		this.wid = wid;
	}
	public String test(){
		try {
			System.out.println("TestAction.execute()");
			System.out.println(wid);
			
			comments=new ArrayList<Comment>();
			
			Comment c1=new Comment();
			c1.setCid(0);
			c1.setContent("di 1 gepinglun");
			//c1.setCmttime(time);
			//(new SimpleDateFormat("yyyy-MM dd hh-mm-ss").format(new Date()));
			
			Comment c2=new Comment();
			c2.setCid(1);
			c2.setContent("di 2 gepinglun");
			
			comments.add(c1);
			comments.add(c2);
	
			return "success";
			
		} catch (Exception e) {
			// TODO: handle exception
			return "fail";
		}
		

	}

}
