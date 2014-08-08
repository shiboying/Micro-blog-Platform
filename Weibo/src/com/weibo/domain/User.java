package com.weibo.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userid;
	private String username;
	private String password;
	private Timestamp regtime;
	private Boolean usertype;
	private String nickname;
	private String gender;
	private String email;
	private Date birth;
	private String location;
	private String image;
	private Integer wcount;
	private Integer ccount;
	private Integer fcount;
	private Set fansesForFlwid = new HashSet(0);
	private Set fansesForFlwedid = new HashSet(0);
	private Set commentsForCmtedid = new HashSet(0);
	private Set commentsForCmtid = new HashSet(0);
	private Set weibos = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String username, String password, Timestamp regtime,
			Boolean usertype, String image) {
		this.username = username;
		this.password = password;
		this.regtime = regtime;
		this.usertype = usertype;
		this.image = image;
	}

	/** full constructor */
	public User(String username, String password, Timestamp regtime,
			Boolean usertype, String nickname, String gender, String email,
			Date birth, String location, String image, Integer wcount,
			Integer ccount, Integer fcount, Set fansesForFlwid,
			Set fansesForFlwedid, Set commentsForCmtedid, Set commentsForCmtid,
			Set weibos) {
		this.username = username;
		this.password = password;
		this.regtime = regtime;
		this.usertype = usertype;
		this.nickname = nickname;
		this.gender = gender;
		this.email = email;
		this.birth = birth;
		this.location = location;
		this.image = image;
		this.wcount = wcount;
		this.ccount = ccount;
		this.fcount = fcount;
		this.fansesForFlwid = fansesForFlwid;
		this.fansesForFlwedid = fansesForFlwedid;
		this.commentsForCmtedid = commentsForCmtedid;
		this.commentsForCmtid = commentsForCmtid;
		this.weibos = weibos;
	}

	// Property accessors

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Timestamp getRegtime() {
		return this.regtime;
	}

	public void setRegtime(Timestamp regtime) {
		this.regtime = regtime;
	}

	public Boolean getUsertype() {
		return this.usertype;
	}

	public void setUsertype(Boolean usertype) {
		this.usertype = usertype;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirth() {
		return this.birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getWcount() {
		return this.wcount;
	}

	public void setWcount(Integer wcount) {
		this.wcount = wcount;
	}

	public Integer getCcount() {
		return this.ccount;
	}

	public void setCcount(Integer ccount) {
		this.ccount = ccount;
	}

	public Integer getFcount() {
		return this.fcount;
	}

	public void setFcount(Integer fcount) {
		this.fcount = fcount;
	}

	public Set getFansesForFlwid() {
		return this.fansesForFlwid;
	}

	public void setFansesForFlwid(Set fansesForFlwid) {
		this.fansesForFlwid = fansesForFlwid;
	}

	public Set getFansesForFlwedid() {
		return this.fansesForFlwedid;
	}

	public void setFansesForFlwedid(Set fansesForFlwedid) {
		this.fansesForFlwedid = fansesForFlwedid;
	}

	public Set getCommentsForCmtedid() {
		return this.commentsForCmtedid;
	}

	public void setCommentsForCmtedid(Set commentsForCmtedid) {
		this.commentsForCmtedid = commentsForCmtedid;
	}

	public Set getCommentsForCmtid() {
		return this.commentsForCmtid;
	}

	public void setCommentsForCmtid(Set commentsForCmtid) {
		this.commentsForCmtid = commentsForCmtid;
	}

	public Set getWeibos() {
		return this.weibos;
	}

	public void setWeibos(Set weibos) {
		this.weibos = weibos;
	}
	
	
	public void setSetsNull() {	
		
		  setCommentsForCmtedid(null);
		  setCommentsForCmtid(null);
		  setWeibos(null);
		  setFansesForFlwedid(null);
		  setFansesForFlwid(null);		
	}



}