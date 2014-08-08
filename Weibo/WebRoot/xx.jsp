<%@ page language="java" import="java.util.*" import="com.weibo.domain.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <script language="JavaScript" >

    function submitFormFan(username) {
    	document.getElementById("username").value=username;
		document.showFans.submit();
	}
	function submitFormIdol(username) {
		document.showIdol.user.username.value = username;
		document.showIdol.submit();
	}


</script>
  <body> 
    This is my JSP page. <br>
    <%User user=new User();user.setUsername("12345");user.setUserid(2); %>
    <form name="showFans" method="post" action="ShowFans">
    	<input type="hidden" name="user.username" id="username" value="<%=user.getUsername()%>"/>
    	<input type="hidden" name="user.userid" id="userid" value="<%=user.getUserid()%>"/>
    	<input type="submit" name="submit" value="粉丝"/>
    	
    </form>

  </body>
</html>
