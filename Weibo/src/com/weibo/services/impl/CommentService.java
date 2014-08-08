package com.weibo.services.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.weibo.dao.CommentDAO;
import com.weibo.dao.UserDAO;
import com.weibo.dao.WeiboDAO;
import com.weibo.domain.Comment;
import com.weibo.domain.User;
import com.weibo.domain.Weibo;
import com.weibo.services.ICommentService;

public class CommentService implements ICommentService {

	private CommentDAO commentDAO;
	private WeiboDAO weiboDAO;
	private UserDAO userDAO;
    private List<Comment> commentList;

	//添加评论
	public void addComment(int weibo, Comment comment,
			User commentUser) {
		// TODO Auto-generated method stub
				
		//添加评论时间
		Timestamp tt = new Timestamp(System.currentTimeMillis());
		comment.setCmttime(tt);		
		//添加评论的微博 
		comment.setWeibo(weiboDAO.findById(weibo));
		//添加评论的评论者
		comment.setUserByCmtid(userDAO.findById(commentUser.getUserid()));
		
		//添加评论到数据库
		commentDAO.save(comment);
		//增加微博的评论数
		Weibo cmtedWeibo = getWeiboDAO().findById(weibo);
		Integer CommentConuts = cmtedWeibo.getCmttconts();
		CommentConuts = CommentConuts+1;
		cmtedWeibo.setCmttconts(CommentConuts);
		//cmtedWeibo.getComments().add(comment);
		
		//更新原微博
		weiboDAO.merge(cmtedWeibo);
		
	}
	
	//根据weibo的id查找对应评论
	@SuppressWarnings("unchecked")
	public List<Comment> listComment(int weibo) {
		System.out.println("3");
		commentList=new ArrayList<Comment>();
		System.out.println("4");
		commentList = (ArrayList<Comment>)commentDAO.findByWeiboid(weibo);
		System.out.println("5");System.out.println("length"+commentList.size());
		return commentList;
	}
	
	
	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}
	public CommentDAO getCommentDAO() {
		return commentDAO;
	}
	public void setWeiboDAO(WeiboDAO weiboDAO) {
		this.weiboDAO = weiboDAO;
	}
	public WeiboDAO getWeiboDAO() {
		return weiboDAO;
	}
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	public UserDAO getUserDAO() {
		return userDAO;
	}


}
