<%@ page language="java" pageEncoding="utf-8"%>

<!-- 导入struts2标签库 -->
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


	<script language="JavaScript" type="text/javascript" src="./webpages/jquery.js"></script>
	<script language="JavaScript" type="text/javascript" src="./webpages/jquery.corner.js"></script>
	<script language="JavaScript" type="text/javascript" src="./webpages/jVal.js"></script>
	<link rel="stylesheet" type="text/css" href="./webpages/jVal.css">
    
    
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
    
    <script> 
    function getXMLHTTPRequest(){  
     var xmlHttp;  
     if(window.XMLHttpRequest){  
         xmlHttp=new XMLHttpRequest();  //非IE浏览器，用xmlhttprequest对象创建  
      }else if(window.ActiveXObject){  
         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");  //IE浏览器用activexobject对象创建  
      }  
       
    return xmlHttp;  
   
 }  
   
 var http;  
 function checkUser(){  
    var username=document.getElementById("user.username").value;  
    http=getXMLHTTPRequest();  
    var url="duplicate?user.username="+username;  
    if(http){  //成功创建XMLHTTPRequest对象  
      http.open("GET",url,true);//与服务端建立连接(请求方式post或get，地址,true表示异步)  
      http.onreadystatechange=callback;  //指定回调函数　　   
      http.send(null);  //发送请求  
    }  
      
      
 }  
 function callback(){  
   if(http.readyState==4){  
     if(http.status==200){  
        processResponse();  
     }  
     
   }  
    
 }  
 //处理服务器端响应  
 function processResponse(){  
    var text=http.responseText;  
    if(text=="yes"){  
        //document.getElementById("error").innerHTML="用户名已经存在";  
        alert("duplicate");
     }else{  
        //document.getElementById("error").innerHTML="";  
        alert("good");
     }  
 }  
</script>  

<style type="text/css">
#templatemo_content_container #templatemo_content #templatemo_content_right .templatemo_right_section table tr td table tr td {
	font-size: 16px;
}
</style>
</head>
<body>
	<div id="templatemo_header_panel">
    	<div id="templatemo_header_section">
            <div id="templatemo_title_section">
                ZHI 微博
			</div>
            <div id="templatemo_search_section">
                <form method="get" action="">
                    <input type="radio" name="search" value="thissite" />this site <input type="radio" name="search" value="theweb" checked="checked" /> the web <br />
                    <input type="text" name="q" size="10" id="searchfield" title="searchfield" />
                    <input type="submit" name="Search" value="Search" alt="Search" id="searchbutton" title="Search" />
                </form>
            </div>
        </div>
    </div> <!-- end of templatemo header panel -->
    
    <div id="templatemo_menu_panel">
    	<div id="templatemo_menu_section">
                                 
            </ul> 
	      <p>&nbsp; </p>
	      <p>----------------------------做一个用知识来织微博的智者</p>
    	</div>
    </div> <!-- end of menu -->
    
	<div id="templatemo_content_container">
        <div id="templatemo_content">
			<form  method = "post" action="registerAction">
              <table width="424" border="0" align="center">
                <tr>
                  <td >*昵称：</td>
                  <td colspan="3" ><label for="昵称3"></label>
                    <input type="text" name="user.nickname" id="user.nickname" jVal="{valid:function (val) { if (val.length < 2) return false; else return true; }, message:'请输入大于2个字符', styleType:'cover'}" /></td>
                </tr>
                <tr>
                  <td >*密码：</td>
                  <td colspan="3" ><label for="密码3"></label>
                    <input type="password" name="user.password" id="password1" onchange="check()" jVal="{valid:function (val) { if (val.length < 4) return false; else return true; }, message:'密码至少4位', styleType:'cover'}"/>
                    <label for="密码3"></label></td>
                </tr>
                <tr>
                  <td >*重复密码：</td>
                  <td colspan="3"><label for="重复3"></label>
                    <input type="password" name="password2" id="password2" onchange="check()" jVal="{valid:function (val) { if ( val != eval('$(\'#password1\').val()') ) return false; else return true; }, message:'与之前输入密码不匹配', styleType:'cover'}"/></td>
                </tr>
                <tr>
                  <td >*邮箱：</td>
                  <td colspan="3"><label for="邮箱3"></label>
                    <input type="text" name="user.email" id="user.email" jVal="{valid:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/, message:'邮箱格式不正确', styleType:'cover'}"
					jValKey="{valid:/[a-zA-Z0-9._%+-@]/, cFunc:'alert', cArgs:['Email Address: '+$(this).val()]}"/></td>
                </tr>
                <tr>
                  <td >性别：</td>
                  <td colspan="3"><p>
                    <label>
                      <input type="radio" name="user.man" value="user.man" id="gender_0" />
                      male</label>
                    <label>
                      <input type="radio" name="user.woman" value="user.man" id="gender_1" />
                      female</label>
                    <br />
                  </p></td>
                </tr>
                <tr>
                  <td >生日：</td>
                  <td colspan="3"  ><label for="生日3"></label>
                    <label for="year3">年</label>
                    <input type="text" name="user.year" id="user.year" size = "4" />
                    <label for="month3">月</label>
                    <input type="text" name="user.month" id="user.month" size ="4"/>
                    <label for="月3"></label>
                    <label for="day3">日</label>
                    <input type="text" name="user.day" id="user.day" size ="4"/>
                    <label for="日3"></label></td>
                </tr>
                <tr>
                  <td>所在地：</td>
                  <td colspan="3"><label for="地址3"></label>
                    <input type="text" name="user.address" id="user.address" /></td>
                </tr>
                <tr>
                  <td >联系方式：</td>
                  <td colspan="3" ><input type="text" name="user.phonenum" id="user.phonenum" /></td>
                </tr>
                <tr>
                  <td>*为必填项</td>
                  <td width="58"><label for="联系方式3"></label></td>
                  <td width="47" ><input type="submit" name="submit" id="submit" value="提交" /></td>
                  <td width="141" ><input type="reset" name="submit" id="reset" value="重置" /></td>
                </tr>
              </table>
              </form>
              <!-- end of post two -->

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