package com.weibo.domain;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

public class Comment implements java.io.Serializable {

	// Fields

	private Integer cid;
	private User userByCmtid;
	private Weibo weibo;
	private User userByCmtedid;
	private String content;
	private Timestamp cmttime;
	private Set comments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Comment() {
	}

	
	public void setSetsNull()
	{
		setComments(null);
		userByCmtid.setSetsNull();
		userByCmtedid.setSetsNull();

		weibo.setSetsNull();
	}
	
	
	/** minimal constructor */
	public Comment(User userByCmtid, Weibo weibo, Timestamp cmttime) {
		this.userByCmtid = userByCmtid;
		this.weibo = weibo;
		this.cmttime = cmttime;
	}

	/** full constructor */
	public Comment(Comment comment, User userByCmtid, Weibo weibo,
			User userByCmtedid, String content, Timestamp cmttime, Set comments) {
		this.userByCmtid = userByCmtid;
		this.weibo = weibo;
		this.userByCmtedid = userByCmtedid;
		this.content = content;
		this.cmttime = cmttime;
		this.comments = comments;
	}

	// Property accessors

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}



	public User getUserByCmtid() {
		return this.userByCmtid;
	}

	public void setUserByCmtid(User userByCmtid) {
		this.userByCmtid = userByCmtid;
	}

	public Weibo getWeibo() {
		return this.weibo;
	}

	public void setWeibo(Weibo weibo) {
		this.weibo = weibo;
	}

	public User getUserByCmtedid() {
		return this.userByCmtedid;
	}

	public void setUserByCmtedid(User userByCmtedid) {
		this.userByCmtedid = userByCmtedid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCmttime() {
		return this.cmttime;
	}

	public void setCmttime(Timestamp cmttime) {
		this.cmttime = cmttime;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}