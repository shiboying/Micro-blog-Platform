package com.weibo.domain;

/**
 * Fans entity. @author MyEclipse Persistence Tools
 */

public class Fans implements java.io.Serializable {

	// Fields

	private Integer fid;
	private User userByFlwedid;
	private User userByFlwid;

	// Constructors

	/** default constructor */
	public Fans() {
	}

	/** full constructor */
	public Fans(User userByFlwedid, User userByFlwid) {
		this.userByFlwedid = userByFlwedid;
		this.userByFlwid = userByFlwid;
	}

	// Property accessors

	public Integer getFid() {
		return this.fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public User getUserByFlwedid() {
		return this.userByFlwedid;
	}

	public void setUserByFlwedid(User userByFlwedid) {
		this.userByFlwedid = userByFlwedid;
	}

	public User getUserByFlwid() {
		return this.userByFlwid;
	}

	public void setUserByFlwid(User userByFlwid) {
		this.userByFlwid = userByFlwid;
	}

}