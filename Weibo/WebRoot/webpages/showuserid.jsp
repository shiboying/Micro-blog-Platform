<%@ page contentType="text/html; charset=utf-8" language="java" import="com.weibo.domain.User" errorPage="" %>
<% User cuser = (User)session.getAttribute("User"); %>
<input type="hidden" id="username" value="<%=cuser.getUsername() %>"></input>
<input type="hidden" id="userid" value="<%=cuser.getUserid() %>"></input>
<%
 	out.print("<script >var user=document.getElementById('username').value;var uid=document.getElementById('userid').value;alert('请牢记您的登录名，点击确定后将无法再显示。您的登录名为:'+user+uid);location.href='login.jsp';</script>");

%>