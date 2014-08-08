package com.weibo.action;

import java.util.List;
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
import com.opensymphony.xwork2.ActionSupport;
import com.weibo.dao.*;
import com.weibo.domain.Comment;
import com.weibo.domain.User;
import com.weibo.domain.Weibo;
import com.weibo.services.ICommentService;


@SuppressWarnings("serial")
public class CommentAction extends ActionSupport{
	private Comment comment;

	private User commentUser;
	private ICommentService commentService;
	
	private List<Comment> commentList;
	private UserDAO userDAO;
	private WeiboDAO weiboDAO;


	public int userid;
	public int oldWeibowid;
	
/*	public UserDAO getUserDAO() {
		return userDAO;
	}*/
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getOldWeibowid() {
		return oldWeibowid;
	}

	public void setOldWeibowid(int oldWeibowid) {
		this.oldWeibowid = oldWeibowid;
	}


	
	
/*  public UserDAO getUserDAO() {
		return userDAO;
	}*/

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	//添加评论
	public String addComment(){

		//commentUser=new User();
		commentUser.setUserid(userid);
		
		commentService.addComment(oldWeibowid, comment, commentUser);
		
		return "success";
	}
	
	//显示评论列表
	public String listComment(){
		

		System.out.println(oldWeibowid);
		commentList=commentService.listComment(oldWeibowid);
	    System.out.println("1");
	    int i;
	    if(commentList.size()==0) return "success";
	    for( i=0;i<commentList.size();i++)
	    {System.out.println("2");
	    	commentList.get(i).setUserByCmtid(userDAO.findById(commentList.get(i).getUserByCmtid().getUserid())); 
	    	//commentList.get(i).getUserByCmtid().setSetsNull();
	    	commentList.get(i).setUserByCmtedid(userDAO.findById(commentList.get(i).getUserByCmtid().getUserid()));	    	
	    	commentList.get(i).setWeibo(weiboDAO.findById(oldWeibowid));
	    	commentList.get(i).setSetsNull();
	    }
	    comment=new Comment();
	    comment.setUserByCmtid(userDAO.findById(1));    	
    	comment.setUserByCmtedid(userDAO.findById(1));

	    comment.setSetsNull();
	
	    commentUser.setSetsNull();
	    System.out.println("3");
		return "success";
	}
	
public WeiboDAO getWeiboDAO() {
		return weiboDAO;
	}

	public void setWeiboDAO(WeiboDAO weiboDAO) {
		this.weiboDAO = weiboDAO;
	}

	/*	public Comment getComment() {
		return comment;
	}*/
	public void setComment(Comment comment) {
		this.comment = comment;
	}



	public void setCommentUser(User commentUser) {
		this.commentUser = commentUser;
	}
/*	public User getCommentUser() {
		return commentUser;
	}*/

	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}

/*	public ICommentService getCommentService() {
		return commentService;
	}*/

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	public List<Comment> getCommentList() {
		return commentList;
	}




}
