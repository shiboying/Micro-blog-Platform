<%@ page language="java" import="com.weibo.domain.*" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%List<User> userList=(List<User>)session.getAttribute("userList"); session.removeAttribute("userList"); %>
 <%@taglib prefix="s" uri="/struts-tags" %>
 <%request.setCharacterEncoding("utf-8");%>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>home</title>
<meta name="keywords" content="free blog template, blog layout, CSS, HTML" />
<meta name="description" content="free blog website layout, blog template, blog layout which you can apply for any blog CMS" />
<link href="webpages/templatemo_style.css" rel="stylesheet" type="text/css" />
<!--  HTML CSS Template Designed by w w w . t e m p l a t e m o . c o m  --> 
<link rel="stylesheet" type="text/css" href="webpages/contentslider.css" />
<script type="text/javascript" src="webpages/contentslider.js">
/***********************************************
* Featured Content Slider- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more
***********************************************/
</script>
 <script type="text/javascript">
                    
                    featuredcontentslider.init({
                    id: "slider2",  //id of main slider DIV
                    contentsource: ["inline", ""],  //Valid values: ["inline", ""] or ["ajax", "path_to_file"]
                    toc: "markup",  //Valid values: "#increment", "markup", ["label1", "label2", etc]
                    nextprev: ["Previous", "Next"],  //labels for "prev" and "next" links. Set to "" to hide.
                    revealtype: "click", //Behavior of pagination links to reveal the slides: "click" or "mouseover"
                    enablefade: [true, 0.2],  //[true/false, fadedegree]
                    autorotate: [true, 3000],  //[true/false, pausetime]
                    onChange: function(previndex, curindex){  //event handler fired whenever script changes slide
                    //previndex holds index of last slide viewed b4 current (1=1st slide, 2nd=2nd etc)
                    //curindex holds index of currently shown slide (1=1st slide, 2nd=2nd etc)
                    }
                    })
            
           			 </script>
<script language="javascript">
function countChar(textareaName,spanName){
 document.getElementById(spanName).innerHTML=100-document.getElementById(textareaName).value.length;
 if(document.getElementById(textareaName).value.length>=100){
  window.alert("已经是最大字数了哦！")
  return false;
 }
}
</script>
<style type="text/css">
#templatemo_content_container #templatemo_content #templatemo_content_right .templatemo_right_section table tr td table tr td {
	font-size: 16px;
}
</style>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<script type="text/javascript"> 
$(document).ready(function(){
$("#pinglund").click(function(){
    $("#aa").slideToggle("slow");
	$("#aa").load('/images/content/Spring.txt');
  });
});
</script>
<script type="text/javascript"> 
$(document).ready(function(){
$("#zhuanfa").click(function(){
    $("#bb").slideToggle("slow");
  });
});
</script>

</head>
<body>
	<div id="templatemo_header_panel">
    	<div id="templatemo_header_section">
            <div id="templatemo_title_section">
                ZHI 微博
			</div>
            <div id="templatemo_search_section">
                <form method="get" action="#">
                    <input type="radio" name="search" value="thissite" />this site <input type="radio" name="search" value="theweb" checked="checked" /> the web <br />
                    <input type="text" name="q" size="10" id="searchfield" title="searchfield" />
                    <input type="submit" name="Search" value="Search" alt="Search" id="searchbutton" title="Search" />
                </form>
            </div>
        </div>
    </div> <!-- end of templatemo header panel -->
    
    <div id="templatemo_menu_panel">
    	<div id="templatemo_menu_section">
            <ul>
                <li><a href="index.html"  class="current">首页</a></li>
                <li><a href="#">个人主页</a></li>
                <li><a href="#">搜索好友</a></li>  
                <li><a href="#">照片库</a></li>
                <li><a href="#">关于我们</a></li> 
                <li><a href="#">退出</a></li>                     
            </ul> 
		</div>
    </div> <!-- end of menu -->
    
	<div id="templatemo_content_container">
        <div id="templatemo_content">
            <div id="templatemo_content_left">
				
                
                
                <div class="templatemo_post">
                  <div class="post_body">
                  <%
  					User currentuser = (User)session.getAttribute("User");
 					%>
                    <table width="100%" border="0" background="images/templatemo_right_section_bg.jpg">
					<%for(int i=0;i<userList.size();i++){ %>                  
                      <tr>
                        <td width="25%" height="137"><img src="<%=userList.get(i).getImage() %>" width="120" height="120" alt="头像" /></td>
                        <td width="30%"><p>昵称：<%=userList.get(i).getNickname() %><form name="showFans" method="post" action="ShowFans">
    										<input type="hidden" name="user.username" id="username" value="<%=userList.get(i).getUsername()%>"/>
    										<input type="hidden" name="user.userid" id="userid" value="<%=userList.get(i).getUserid()%>"/>
    										<input type="submit" name="submit" value="ta的粉丝"/>
    									</form> </p></td>
                        <td width="31%"><p>用户ID：<%=userList.get(i).getUsername() %><form name="showIdol" method="post" action="ShowIdol">
    										<input type="hidden" name="user.username" id="username" value="<%=userList.get(i).getUsername()%>"/>
    										<input type="hidden" name="user.userid" id="userid" value="<%=userList.get(i).getUserid()%>"/>
    										<input type="submit" name="submit" value="ta的关注"/>
    									</form></p></td>
                        <td width="14%"><form name="addIdol" method="post" action="AddIdol"><input type="hidden" name="user.userid" id="userid" value="<%=currentuser.getUserid()%>"/><input type="submit" name="follow" id="follow" value="加关注" /></form></td>
                      </tr>
                    <%} %>
                    </table>
</div>
                    <div class="post_comment">
                    	
                    </div>
                </div> <!-- end of post two -->

                
          </div> <!-- end of content left -->
        
            <div id="templatemo_content_right">
            
                <div class="templatemo_right_section">
                  <h2>个人信息</h2>
                  <table width="100%" border="0">
                      <tr>
                        <td width="54%"><img src="webpages/images/touxiang.jpg" alt="头像" width="125" height="112" align="absmiddle" /></td>
                        <td width="46%"><table width="100%" height="101" border="0">
                          <tr>
                            <td>粉丝：<%=session.getAttribute("fanscount") %></td>
                          </tr>
                          <tr>
                            <td>关注：<%=session.getAttribute("followcount") %></td>
                          </tr>
                          <tr>
                            <td>微博：<%=currentuser.getWcount()%></td>
                          </tr>
                        </table></td>
                      </tr>
                  </table>
              </div>
            
            	<div class="templatemo_right_section">
                	<div class="templatemo_post">
                	<h1>Recent Photos</h1>
           
                    <div id="slider2" class="sliderwrapper">
                    <div class="contentdiv"><img src="webpages/images/templatemo_image_2.jpg" alt="image" /></div>
                    <div class="contentdiv"><img src="webpages/images/templatemo_image_3.jpg" alt="image" /></div>
                    <div class="contentdiv"><img src="webpages/images/templatemo_image_4.jpg" alt="image" /></div>
                    </div>
                    
                    <div id="paginate-slider2" class="pagination">
                    
                    <a href="#" class="toc">1</a> <a href="#" class="toc anotherclass">2</a> <a href="#" class="toc">3</a>
                    </div>
                    <script type="text/javascript">
                    
                    featuredcontentslider.init({
                    id: "slider2",  //id of main slider DIV
                    contentsource: ["inline", ""],  //Valid values: ["inline", ""] or ["ajax", "path_to_file"]
                    toc: "markup",  //Valid values: "#increment", "markup", ["label1", "label2", etc]
                    nextprev: ["Previous", "Next"],  //labels for "prev" and "next" links. Set to "" to hide.
                    revealtype: "click", //Behavior of pagination links to reveal the slides: "click" or "mouseover"
                    enablefade: [true, 0.2],  //[true/false, fadedegree]
                    autorotate: [true, 3000],  //[true/false, pausetime]
                    onChange: function(previndex, curindex){  //event handler fired whenever script changes slide
                    //previndex holds index of last slide viewed b4 current (1=1st slide, 2nd=2nd etc)
                    //curindex holds index of currently shown slide (1=1st slide, 2nd=2nd etc)
                    }
                    })
            
           			 </script>
                </div> <!-- end of one post -->
            </div>
                
                <div class="templatemo_right_section">
                	<h2>Archives</h2>
					<ul>
                        <li><a href="#">January 2024</a></li>
                        <li><a href="#">December 2023</a></li>
                        <li><a href="#">November 2023</a></li>
                        <li><a href="#">October 2023</a></li>
                        <li><a href="#">September 2023</a></li>
                    </ul>  
                </div>
                
                <div class="templatemo_right_section">
	                <h2>Recent Comments</h2>
                	<ul>	
                        <li>Lorem Ipsum on <a href="#">Donec mollis aliquet</a></li>
                        <li>Consectetuer on <a href="#">Suspendisse a nibh</a></li>
                        <li>Sed on <a href="#">Pellentesque vitae magna</a></li>
                        <li>Vitae Neque on <a href="#">Nunc blandit orci sit</a></li>
                        <li>Donec Mollis on <a href="#">Maecenas adipiscing</a></li>
                    </ul>
                </div>
                
            </div> <!-- end of right content -->
	    </div> <!-- end of content -->
    </div> <!-- end of content container -->

	<div id="templatemo_bottom_panel">
    	<div id="templatemo_bottom_section">
        
	        <div class="templatemo_bottom_section_content">
                <h3>友情链接</h3>
               <ul>
                    <li><a href="http://weibo.com/u/1458313027?wvr=3.6&lf=reg" target="_parent">石博莹的微博</a></li>
                    <li><a href="http://weibo.com/bluezebra?topnav=1&wvr=3.6&topsug=1" target="_parent">张昊旻的微博</a></li>
                    <li><a href="http://weibo.com/nily0611?topnav=1&wvr=3.6&topsug=1" target="_parent">魏婧的微博</a></li>
                    <li><a href="http://weibo.com/u/1834568713">杨振崧的微博</a></li>
                      <li><a href="#">赵一粟没有微博</a></li>
              </ul>
	        </div>
          
            <div class="templatemo_bottom_section_content">
                <h3>好友博客</h3>
                <ul>
                    <li><a href="http://www.templatemo.com" target="_parent">Website Templates</a></li>
                    <li><a href="http://www.flashmo.com" target="_parent">Flash Templates</a></li>
                    <li><a href="http://www.webdesignmo.com" target="_parent">Web Design Blog</a></li>
                    <li><a href="#">Nunc blandit orci</a></li>
                    <li><a href="#">Cum sociis natoque</a></li>
                </ul>
            </div>
            
            <div class="templatemo_bottom_section_content">
                <h3>使用条款</h3>
                 <ul>
                    <li><a href="#">Terms</a></li>
                    <li><a href="#">Privacy</a></li>
                    <li><a href="#">About</a></li>                 
                    <li><a href="#">Contact</a></li> 
                </ul>
            </div>
        </div> <!-- end of templatemo bottom section -->
    </div> <!-- end of templatemo bottom panel -->
    <!--  HTML CSS Template Designed by w w w . t e m p l a t e m o . c o m  --> 
    <div id="templatemo_footer_panel">
    	<div id="templatemo_footer_section">
			Copyright © 2012 <a href="#">ZHI Weibo</a> | Designed by No.2 BUPTSSE<a title="Free CSS Templates" href="http://www.templatemo.com" target="_blank"></a>
        </div>
    </div>
</body>
</html>