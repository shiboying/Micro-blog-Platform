
<%@ page language="java" import="java.util.*"  import="com.weibo.domain.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%User user=new User();
    user.setUserid(2);%>
<% session.setAttribute("user",user);%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <s:form action="AddComment">
    <s:textfield name="comment.content" label="comment.content"></s:textfield>
   <s:textfield name="weibo.wid" label="weibo.id"></s:textfield>
    <s:textfield name="commentUser.userid" label="commentUser.userid"></s:textfield> 
    
    <s:submit></s:submit>
    </s:form>  
    
  </body>
</html>

