package com.weibo.domain;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Weibo entity. @author MyEclipse Persistence Tools
 */

public class Weibo implements java.io.Serializable {

	// Fields

	private Integer wid;
	private User user;
	private String content;
	private Timestamp time;
	private Integer refercounts;
	private Integer cmttconts;
	private Integer refid;
	private Set comments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Weibo() {
	}

	/** minimal constructor */
	public Weibo(User user, String content, Timestamp time,
			Integer refercounts, Integer cmttconts) {
		this.user = user;
		this.content = content;
		this.time = time;
		this.refercounts = refercounts;
		this.cmttconts = cmttconts;
	}

	/** full constructor */
	public Weibo(User user, String content, Timestamp time,
			Integer refercounts, Integer cmttconts, Integer refid, Set comments) {
		this.user = user;
		this.content = content;
		this.time = time;
		this.refercounts = refercounts;
		this.cmttconts = cmttconts;
		this.refid = refid;
		this.comments = comments;
	}

	// Property accessors

	public Integer getWid() {
		return this.wid;
	}

	public void setWid(Integer wid) {
		this.wid = wid;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Integer getRefercounts() {
		return this.refercounts;
	}

	public void setRefercounts(Integer refercounts) {
		this.refercounts = refercounts;
	}

	public Integer getCmttconts() {
		return this.cmttconts;
	}

	public void setCmttconts(Integer cmttconts) {
		this.cmttconts = cmttconts;
	}

	public Integer getRefid() {
		return this.refid;
	}

	public void setRefid(Integer refid) {
		this.refid = refid;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}
	
	public void setSetsNull() {
		 setComments(null);
		 getUser().setSetsNull();
		
	}

}