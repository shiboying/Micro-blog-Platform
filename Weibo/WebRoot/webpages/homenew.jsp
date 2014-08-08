<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="com.weibo.domain.*" import="java.util.List" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
  User currentuser = (User)session.getAttribute("User");int i=0;
 %>
 <%@taglib prefix="s" uri="/struts-tags" %>
<s:action name="ListIdolWeibo" executeResult="false"></s:action>
 <%List<Weibo> weibolist=(List<Weibo>)session.getAttribute("weiboList");session.removeAttribute("weiboList"); %>
 
 <%request.setCharacterEncoding("utf-8");%>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>home</title>
<meta name="keywords" content="free blog template, blog layout, CSS, HTML" />
<meta name="description" content="free blog website layout, blog template, blog layout which you can apply for any blog CMS" />
<link href="./webpages/templatemo_style.css" rel="stylesheet" type="text/css" />
<!--  HTML CSS Template Designed by w w w . t e m p l a t e m o . c o m  --> 
<link rel="stylesheet" type="text/css" href="./webpages/contentslider.css" />
<script type="text/javascript" src="./webpages/contentslider.js">
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

var  myAjaxObject;
var wid;

	function getListBean(i,getwid)
	{
		if (window.XMLHttpRequest)
  		{// code for IE7+, Firefox, Chrome, Opera, Safari
 			 myAjaxObject=new XMLHttpRequest();
  		}
		else
  		{// code for IE6, IE5
  			myAjaxObject=new ActiveXObject("Microsoft.XMLHTTP");
 		}
 		//wid=document.getElementById("wid").value;
 		wid=getwid;
 		var tempi;
 		tempi=i;
		var url="forwardAction_getShowString?oldWeibowid="+wid;
		//alert("i"+i);
				
		myAjaxObject.open("POST",url,true);  
		myAjaxObject.onreadystatechange=function()
	{
		if(myAjaxObject.readyState==4)
		{
			if(myAjaxObject.status==200)
			{
			//alert("2");
			//alert(i);	
				var returnJsonString =myAjaxObject.responseText;
				var returnJSON=JSON.parse(returnJsonString);			
				var node = document.getElementById("ss"+i);
				node.innerHTML="";
  					//newNode.innerHTML = returnJSON.comments[i].content;
				node.innerHTML=returnJSON.refWeiboContent;
					//node.appendChild(txt2);
				var node2 = document.getElementById("zfmsg"+i);
				node2.innerHTML="";
  					//newNode.innerHTML = returnJSON.comments[i].content;
				node2.innerHTML=returnJSON.oldCommentString;
				$("#bb"+i).slideToggle("slow");
		
			}
		}
	}
myAjaxObject.send();

	}
	
	
	
	function getListBeanpl(i,getwid,uid)
	{
		if (window.XMLHttpRequest)
  		{// code for IE7+, Firefox, Chrome, Opera, Safari
 			 myAjaxObject=new XMLHttpRequest();
  		}
		else
  		{// code for IE6, IE5
  			myAjaxObject=new ActiveXObject("Microsoft.XMLHTTP");
 		}
 		//wid=document.getElementById("wid").value;
 		wid=getwid;
 		var tempi;
 		tempi=i;
		var url="ListComment?oldWeibowid="+wid;
		//alert("i"+i);
				
		myAjaxObject.open("POST",url,true);  
		myAjaxObject.onreadystatechange=function()
	{
		if(myAjaxObject.readyState==4)
		{
			if(myAjaxObject.status==200)
			{
			//alert("2");
			//alert(i);	
				var returnJsonString =myAjaxObject.responseText;
				var returnJSON=JSON.parse(returnJsonString);			
				var node = document.getElementById("oldpl"+i);
				node.innerHTML="";
  					//newNode.innerHTML = returnJSON.comments[i].content;
  					for(var j=0;j<returnJSON.ListComment.size();j++){
  					
  						node.innerHTML=node.innerHTML+"<p>"+returnJSON.ListComment.get(i).getUserByCmtedid().getNickname()+":"
							+returnJSON.ListComment.get(i).getContent()+"</p>";
  					}

					//node.appendChild(txt2);
				var node2 = document.getElementById("newpl"+i);
				node2.innerHTML="";
  					//newNode.innerHTML = returnJSON.comments[i].content;
				
				$("#aa"+i).slideToggle("slow");
		
			}
		}
	}
myAjaxObject.send();

	}




function countChar(textareaName,spanName){
 document.getElementById(spanName).innerHTML=100-document.getElementById(textareaName).value.length;
 if(document.getElementById(textareaName).value.length>=100){
  window.alert("已经是最大字数了哦！")
  return false;
 }
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
    </script>
<style type="text/css">
#templatemo_content_container #templatemo_content #templatemo_content_right .templatemo_right_section table tr td table tr td {
	font-size: 16px;
}
</style>

<!--转发评论按钮-->

<script type="text/javascript" src="webpages/js/jquery.min.js"></script>

<!--<script type="text/javascript"> 
$(document).ready(function(){
$("#pinglun").click(function(){
    $("#aa").slideToggle("slow");
	
  });
});
</script>
--><!--<script type="text/javascript"> 
$(document).ready(function(){
$("#zf").click(function(){
    $("#bb").slideToggle("slow");
  });
});
</script>


--><script type="text/javascript" src="webpages/js/jquery.min.js"></script>
<script type="text/javascript" src="webpages/js/thickbox_plus.js"></script>
<link rel="stylesheet" type="text/css" href="webpages/css/thickbox.css"/>
</head>
<body>
	<div id="templatemo_header_panel">
    	<div id="templatemo_header_section">
            <div id="templatemo_title_section">
                ZHI 微博
			</div>
           <div id="templatemo_search_section">
                <form method="post" action="AddIdol">
                <p>找你可能认识的人</p>
                    <input type="text" name="user.username" size="10" id="searchfield" title="searchfield" />
                    <input type="submit" name="Search" value="Search" alt="Search" id="searchbutton" title="Search" />
                </form>
            </div>
        </div>
    </div> <!-- end of templatemo header panel -->
    
   <div id="templatemo_menu_panel">
    	<div id="templatemo_menu_section">
            <ul>
                <li><a href="/login.jsp"  class="current">首页</a></li>
                <li><a href="./webpages/homenew.jsp">个人主页</a></li>
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
                    <div class="post_title">
                    	<p>请输入您的新鲜事：                    	</p>
                    	<div class="post_info">
                    	<form id="form1" name="form1" method="post" action="weiboAction" >
      <table width="497" height="122" border="0" align="center" position = "absolute">
        <tr>
          <td colspan="4"><label for="输入"></label>
            <textarea name="weibo.content" id='msg' cols="70" rows="5"onkeydown='countChar("msg","counter");' onkeyup="countChar('msg','counter');"></textarea></td>
            
        </tr>
        <tr>
          <td width="84">可以输入<span id="counter">100</span>字<br></td>
          <td width="282">&nbsp;</td>
          <td width="50">No. <span id="count">1</span></td>
         
          <td width="63"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('./webpages/Image15','','./webpages/images/2.jpg',1)"><input type="image" src="./webpages/images/1.jpg" name="Image15" width="61" height="20" border="0" id="Image15";/></a></td>
        </tr>
      </table>
    </form></td>
                      </div>
                      
                </div>
      <div class="post_body">
             <table  id='bianyanse' width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#35234B">  
    			<%for( i=0;i<weibolist.size();i++){ %>
    			<tr>
					<td width="100" height="100">
					<img src="<%=weibolist.get(i).getUser().getImage() %>" width="100" height="100" alt="ZHIID:<%=weibolist.get(i).getUser().getUsername() %>"/>
					</td>
					<td align="left" valign="middle"><%=weibolist.get(i).getContent() %></td>
				</tr>
				<tr>
					<td align="center"><%if(weibolist.get(i).getUser().getUsertype()==true){%><font color="red"><%=weibolist.get(i).getUser().getNickname() %></font><%} else{%><%=weibolist.get(i).getUser().getNickname()%><%} %>
					</td>
					<td align="right"><%=weibolist.get(i).getTime() %></td>
				</tr>
    			<tr>
      				<td width="100" height="27">
      					<table width="87%" border="0" bgcolor="#35234B">
        					<tr>
          						<td width="13%" height="23">
          						<input id= "pinglun<%=i %>" name="dis" type="button" value="评论" onclick="getListBeanpl(<%=i %>,<%=weibolist.get(i).getWid() %>,<%=currentuser.getUserid()%>)";/></td>
          <td width="87%"><input id= "zf<%=i %>" name="zf" type="button" value="转发" onclick="getListBean(<%=i %>,<%=weibolist.get(i).getWid() %>)"/></td>

          					</tr>
      					</table>
      				</td>
					<td></td>
    			</tr>
    			
    			
    			
    			<tr>
    				<td height="31" colspan="4" bgcolor="#35234B">
    					<div id='aa<%=i %>'style=" background:url(1.png); background-color:#f1f1f1; display:none;  width:350px; height:150px; ">	
    
    <form  action="AddComment">
    <table border="0" align="left" cellpadding="0" cellspacing="0" id="loginbox" >
            <tr style="height:30px">
              <td colspan="4" class="bfont">
                <textarea name="plo" id="oldpl<%=i %>" cols="40" rows="5" style="background-color:#F5F5F5"disabled="disabled" readonly="readonly"></textarea>
              </td>
            </tr>
            <tr style="height:30px">
                <td colspan="4" class="bfont">
                  <textarea name="comment.content" cols="40" rows="5" id="newpl<%=i %>" onkeydown='countChar("newpl<%=i %>","zfcounter1");' onkeyup="countChar('newpl<%=i %>','zfcounter1');"></textarea>
                </td>
              
            </tr>
            <tr>
                <td width="91" class="bfont">可以输入<span id="zfcounter1">100</span>字<br/></td>
                <td width="42" class="bfont">&nbsp;</td>
                <td width="107" class="bfont">&nbsp;</td>
                <td width="57" class="bfont">
                <input type="hidden" name="commentUser.userid" id='msg2' value=<%=currentuser.getUserid()%>/>
                <input type="hidden" name="weibo.wid" id='msg3' value=<%=weibolist.get(i).getWid() %>/>
                  <input type="submit" name="pl" id="pl" value="评论" onclick="getListBeanpl(<%=i %>,<%=weibolist.get(i).getWid() %>,<%=currentuser.getUserid()%>)";/>
                </td>
            
            </tr>
          
        </table></form>						</div>
       
        <div id='bb<%=i %>'style=" background:url(1.png); background-color:#f1f1f1; display:none;  width:350px; height:200px; ">	
    <form name="first" action="forwardAction_sendForwardWeibo">
    <table border="0" align="left" cellpadding="0" cellspacing="0" id="loginbox" >
            <tr style="height:30px">
              <td colspan="4" class="bfont">
                <textarea name="ss" id="ss<%=i %>" cols="40" rows="5" style="background-color:#F5F5F5"disabled="disabled" readonly="readonly"></textarea>
              </td>
            </tr>
            
            <tr style="height:30px">           
                <td colspan="4" class="bfont">      
                  <textarea name="newCommentString" cols="40" rows="4" id="zfmsg<%=i %>" onkeydown='countChar("zfmsg","zfcounter");' onkeyup="countChar('zfmsg','zfcounter');"></textarea>
                </td>
              
            </tr>
            <tr>
                <td width="91" class="bfont">可以输入<span id="zfcounter">100</span>字<br/></td>
                <td width="42" class="bfont">&nbsp;</td>
                <td width="107" class="bfont">&nbsp;</td>
                <td width="57" class="bfont">
                  <input type="submit" name="zhuanfa" id="zhuanfa<%=i %>" value="转发" onclick="getListBean(<%=i %>,<%=weibolist.get(i).getWid() %>)";/>
                </td>
            
            </tr>
          
        </table></form>						</div>

   					</td>
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
                  <h2><%=currentuser.getNickname() %></h2>
                  <s:action name="ShowCount" executeResult="false"></s:action>
                  <table width="100%" border="0">
                      <tr>
                        <td width="54%"><a href="./webpages/uploadimage.jsp"><img src="./webpages/images/touxiang.jpg" alt="头像" width="125" height="112" align="absmiddle" /></td>
                        <td width="46%"><table width="100%" height="101" border="0">
                          <tr>
                            <td><form name="showFans" method="post" action="ShowFans">
    										<input type="hidden" name="user.username" id="username" value="<%=currentuser.getUsername()%>"/>
    										<input type="hidden" name="user.userid" id="userid" value="<%=currentuser.getUserid()%>"/>
    										<input type="submit" name="submit" value="粉丝：<%=session.getAttribute("fanscount") %>"/>
    									</form>
                            </td>
                          </tr>
                          <tr>
                            <td><form name="showIdol" method="post" action="ShowIdol">
    										<input type="hidden" name="user.username" id="username" value="<%=currentuser.getUsername()%>"/>
    										<input type="hidden" name="user.userid" id="userid" value="<%=currentuser.getUserid()%>"/>
    										<input type="submit" name="submit" value="关注：<%=session.getAttribute("followcount") %>"/>
    									</form></td>
                          </tr>
                          <tr>
                            <td>微博：<%=currentuser.getWcount() %></td>
                          </tr>
                        </table></td>
                      </tr>
                      <%session.removeAttribute("fanscount");session.removeAttribute("followcount"); %>
                  </table>
              </div>
            
            	<div class="templatemo_right_section">
                	<div class="templatemo_post">
                	<h1>Recent Photos</h1>
           
                    <div id="slider2" class="sliderwrapper">
                    <div class="contentdiv"><img src="./webpages/images/templatemo_image_2.jpg" alt="image" /></div>
                    <div class="contentdiv"><img src="./webpages/images/templatemo_image_3.jpg" alt="image" /></div>
                    <div class="contentdiv"><img src="./webpages/images/templatemo_image_4.jpg" alt="image" /></div>
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