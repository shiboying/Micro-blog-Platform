<%@ page language="java" import="com.weibo.domain.*" import="java.util.*" pageEncoding="UTF-8"%>  
<%   
String username = (String)session.getAttribute("user");   
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <title>Struts2 Person Login Result</title>  
  </head>  
     
  <body>  
     <%List<User> userFanList=(List<User>)session.getAttribute("userFanList");  %>
     <table>  
     <tr><td>昵称</td><td>ID号</td></tr>
     			<%for(int i=0;i<userFanList.size();i++){ %>
     	<tr>
     		<td>
     			<%=userFanList.get(i).getNickname() %>
     		</td>
     		<td>
     		<%=userFanList.get(i).getUsername() %>
     		</td>
     	</tr>
     			<%} %>
     </table>
  </body>  
</html>  
