package com.weibo.services;

import java.util.List;

import com.weibo.domain.Comment;
import com.weibo.domain.User;
import com.weibo.domain.Weibo;

public interface ICommentService {
	public void addComment(int weibo,Comment comment,User user);
	public List<Comment> listComment(int weibo);
}
