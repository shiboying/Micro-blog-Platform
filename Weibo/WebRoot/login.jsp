<%@ page language="java" pageEncoding="utf-8"%>

<!-- 导入struts2标签库 -->
<%@taglib uri="/struts-tags" prefix="s"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>home</title>

<meta name="keywords" content="free blog template, blog layout, CSS, HTML" />

<meta name="description" content="free blog website layout, blog template, blog layout which you can apply for any blog CMS" />

<link href="./webpages/templatemo_style.css" rel="stylesheet" type="text/css" />

<!--  HTML CSS Template Designed by w w w . t e m p l a t e m o . c o m  --> 

<link href="./webpages/css/css.css" rel="stylesheet" type="text/css">

<SCRIPT src="./webpages/js/jquery.js" type=text/javascript></SCRIPT>

<SCRIPT type=text/javascript>

//搜索

var ntype = 0; 

var stype = new Array("音乐","伴奏","图片","视频","用户","圈子");



function Offset(e)

//取标签的绝对位置

{

	var t = e.offsetTop;

	var l = e.offsetLeft;

	var w = e.offsetWidth;

	var h = e.offsetHeight-2;



	while(e=e.offsetParent)

	{

		t+=e.offsetTop;

		l+=e.offsetLeft;

	}

	return {

		top : t,

		left : l,

		width : w,

		height : h

	}

}



function setMenuBind(obj,mobj,cname,xt,yt)

{

	$(obj).hover(

		function(){

			setMenuShow(this,mobj.get(0),xt,yt);

			obj.addClass(cname);

		},

		function(){

		    obj.removeClass(cname);

			mobj.hide();

		}

	);

	

	$(mobj).hover(

		function(){

			obj.addClass(cname);

			mobj.show();

		},

		function()

		{

			obj.removeClass(cname);

			mobj.hide();

		}

	);

}



function setMenuShow(obj,mobj,xt,yt)//xt top位移 yt居左位移

{

	var offset=Offset(obj);

	mobj.style.position = "absolute";

	mobj.style.height = offset.height + "px";

	mobj.style.top = (offset.top + xt) + "px";

	mobj.style.left = (offset.left + yt) + "px";

	mobj.style.display = "block";

}



function setLiOver(obj,cname)

{//obj=jquery obj



    obj.hover(

		function(){

			$(this).addClass(cname);

		},

		function()

		{

			$(this).removeClass(cname);

		}

	);

}



function loadImages()

{

    var url = "./webpages/images/";

    var d=document; if(d.images)

    {

         if(!d.MM_p) d.MM_p=new Array();

         var i,j=d.MM_p.length,a=loadImages.arguments; 

         for(i=0; i<a.length; i++)

         {

            if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=url+a[i];}

         }

    }

}



function ChangeTab()

{

    $("#fen_music_0").eq(0).show();

    

    $(".musicbut li").hover(

        function(){

            $(".musicbut li").removeClass("on");

            $(this).addClass("on");

            $(".musictab").hide();

            $("#fen_music" + this.id.substr(this.id.lastIndexOf("_"))).show();

        },

	    function(){

	        //$(this).removeClass("on");

	    }

    );

    

    $(".musictab").mouseover(function(){

        $("#tab_music" + this.id.substr(this.id.lastIndexOf("_"))).addClass("on");

    });

}



//头像信息

function BindHead()

{

    var mobj = $("#user_msg").get(0);

    var mcon = $(".uright").eq(0);

    var mtxt = "";

    

    $(".face").hover(

        function(){

            var offset=Offset(this);

            ShowTip(mobj,offset);

            if (mtxt != undefined)

            {

                mtxt = $(this).attr("title");

            }

            $(this).attr("title","");

            ChangeTitle(mcon,mtxt);

        },

        function(){

            HideTip(mobj);

            $(this).attr("title",mtxt);

        }

    );

}



function ShowTip(obj,offset)

{

    obj.style.position = "absolute";

    obj.style.height = offset.height + "px";

    if($.browser.msie)

    {

        obj.style.top = (offset.top + 0) + "px";

    }

    else

    {

        obj.style.top = (offset.top + -60) + "px";

    }

    obj.style.left = offset.left + 66 + "px";

    obj.style.display = "block";

}



function HideTip(obj)

{

    obj.style.display = "none";

}



function ChangeTitle(obj,txt)

{

    var s = txt.split(",");

    var t = "";

    

    //alert(s.length);

    

    if(s.length == 4)

    {

        t = "<strong class=\"red\">"+s[0]+"</strong><br/> (" + s[2] + "岁" + s[1] +"生) <br/>来自:" + s[3] + " ";

    }

    else

    {

        t = "hi,快来看看我是谁:)";

    }

        

    obj.html(t);

}

</SCRIPT>

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

                <p>还没有ZHI微博的帐号吗？请您注册！</p>

                <p>

                  <A href="./register.jsp"><input type="submit" name="register" value="注册" alt="注册帐号" id="searchbutton" title="register" src="./webpages/register.html"/></A>

                  <br />

                </p>

              </form>

            </div>

        </div>

    </div> <!-- end of templatemo header panel -->

    

    <div id="templatemo_menu_panel">

    	<div id="templatemo_menu_section">



		</div>

    </div> <!-- end of menu -->

    

	<div id="templatemo_content_container">

        <div id="templatemo_content">

            <div id="templatemo_content_left">

				

                

                

                <div class="templatemo_post">

                    <div class="post_titlespring">

                    	  <p>&nbsp;</p>

                    	  <p>&nbsp;</p>

                    	  <DIV class=middle>

  <DIV class=navigatebox></DIV>

<DIV class=broadcastbox>

<DIV class=newstitle01><IMG 

src="./webpages/images/angle_05.gif"></DIV>

<DIV class="broadcastcont lrline friendheight"><STRONG class=red>找朋友:</STRONG> 

&nbsp;性别: <SELECT class=drp id=drp_sex> <OPTION value=0 selected>女</OPTION> 

  <OPTION value=1>男</OPTION></SELECT> &nbsp;地区: <SELECT class=drp id=drp_pro> 

  <OPTION value=全部 selected>全部</OPTION> <OPTION value=北京>北京</OPTION> <OPTION 

  value=上海>上海</OPTION> <OPTION value=天津>天津</OPTION> <OPTION value=重庆>重庆</OPTION> 

  <OPTION value=四川>四川</OPTION> <OPTION value=吉林>吉林</OPTION> <OPTION 

  value=辽宁>辽宁</OPTION> <OPTION value=黑龙江>黑龙江</OPTION> <OPTION 

  value=青海>青海</OPTION> <OPTION value=内蒙古>内蒙古</OPTION> <OPTION 

  value=新疆>新疆</OPTION> <OPTION value=宁夏>宁夏</OPTION> <OPTION value=甘肃>甘肃</OPTION> 

  <OPTION value=陕西>陕西</OPTION> <OPTION value=河北>河北</OPTION> <OPTION 

  value=河南>河南</OPTION> <OPTION value=贵州>贵州</OPTION> <OPTION value=云南>云南</OPTION> 

  <OPTION value=贵州>贵州</OPTION> <OPTION value=浙江>浙江</OPTION> <OPTION 

  value=江苏>江苏</OPTION> <OPTION value=山东>山东</OPTION> <OPTION value=山西>山西</OPTION> 

  <OPTION value=江西>江西</OPTION> <OPTION value=安徽>安徽</OPTION> <OPTION 

  value=西藏>西藏</OPTION> <OPTION value=湖北>湖北</OPTION> <OPTION value=湖南>湖南</OPTION> 

  <OPTION value=广西>广西</OPTION> <OPTION value=广东>广东</OPTION> <OPTION 

  value=福建>福建</OPTION> <OPTION value=海南岛>海南岛</OPTION> <OPTION 

  value=香港>香港</OPTION> <OPTION value=澳门>澳门</OPTION> <OPTION value=台湾>台湾</OPTION> 

  <OPTION value=海外>海外</OPTION></SELECT> &nbsp;年龄: <INPUT id=txt_age1 

style="PADDING-RIGHT: 1px; PADDING-LEFT: 1px; FONT-SIZE: 11px; PADDING-BOTTOM: 1px; WIDTH: 20px; COLOR: #000; PADDING-TOP: 1px; HEIGHT: 16px" 

value=18> 到 <INPUT id=txt_age2 onKeyDown="if(event.keyCode==13) goFriend();" 

style="PADDING-RIGHT: 1px; PADDING-LEFT: 1px; FONT-SIZE: 11px; PADDING-BOTTOM: 1px; WIDTH: 20px; COLOR: #000; PADDING-TOP: 1px; HEIGHT: 16px" 

onclick=this.focus(); value=25> <IMG class="btnBg btnSearchF" style="CURSOR: pointer" src="./webpages/images/over.gif" align=absMiddle> <STRONG 

class=red><A href="http://www.68design.net/" 

target=_blank>有谁在线?</A></STRONG> 

<DIV class=line></DIV></DIV>

<DIV class="friendcont lrline" 

style="MARGIN-TOP: 0px; DISPLAY: block; MARGIN-BOTTOM: -15px">

<DIV style="TEXT-ALIGN: center"><IMG 

src="./webpages/images/loading02.gif"></DIV></DIV>﻿ 

<DIV class="friendcont  lrline">

<UL>

  <LI>

  <DIV><A class=face title=o0┈希望有①天o0,女,21,香港 

  href="http://www.68design.net/" target=_blank><IMG height=68 

  src="./webpages/images/51973924516607.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=o0┈希望有①天o0 href="http://www.68design.net/" 

  target=_blank>o0┈...</A></H6></LI>

  <LI>

  <DIV><A class=face title=NECCOZZANG,女,16,重庆 

  href="http://www.68design.net/" target=_blank><IMG height=68 

  src="./webpages/images/70625611801530.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=NECCOZZANG href="http://www.68design.net/" 

  target=_blank>NECCO...</A></H6></LI>

  <LI>

  <DIV><A class=face title="KISS MY AS,男,4,吉林" 

  href="http://www.68design.net/" target=_blank><IMG height=68 

  src="./webpages/images/62013722829000.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title="KISS MY AS" href="http://www.68design.net/" 

  target=_blank>KISS MY...</A></H6></LI>

  <LI>

  <DIV><A class=face title=随机访问 

  href="http://www.68design.net/" target=_blank><IMG 

  height=68 src="images/girl.gif" width=68 

  border=0></A></DIV>

  <H6><A title=随机访问 href="http://www.68design.net/" 

  target=_blank ?>随机访问</A></H6></LI>

  <LI>

  <DIV><A class=face title=小彰P,女,18,海外 href="http://www.68design.net/" 

  target=_blank><IMG height=68 

  src="./webpages/images/48480550352340.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=小彰P href="http://www.68design.net/" 

  target=_blank>小彰P</A></H6></LI>

  <LI>

  <DIV><A class=face title=k歌军团**小猪,女,18,江西 

  href="http://www.68design.net/" target=_blank><IMG height=68 

  src="./webpages/images/68824075231077.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=k歌军团**小猪 href="http://www.68design.net/" 

  target=_blank>k歌军团...</A></H6></LI></UL></DIV>

<DIV class="friendcont  lrline">

<UL>

  <LI>

  <DIV><A class=face title=赖赖唱^0^,女,20,上海 href="http://www.68design.net/" 

  target=_blank><IMG height=68 

  src="./webpages/images/61989020109107.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=赖赖唱^0^ href="http://www.68design.net/" 

  target=_blank>赖赖唱^...</A></H6></LI>

  <LI>

  <DIV><A class=face title=￡ＡDほiＬ￡,男,16,新疆 href="http://www.68design.net/" 

  target=_blank><IMG height=68 

  src="./webpages/images/57739124817327.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=￡ＡDほiＬ￡ href="http://www.68design.net/" 

  target=_blank>￡ＡDほ...</A></H6></LI>

  <LI>

  <DIV><A class=face title="『 STAR 』,女,21,新疆" 

  href="http://www.68design.net/" target=_blank><IMG height=68 

  src="./webpages/images/58653773953700.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title="『 STAR 』" href="http://www.68design.net/" target=_blank>『 

  STAR...</A></H6></LI>

  <LI>

  <DIV><A class=face title=惩罚者￥,男,23,新疆 href="http://www.68design.net/" 

  target=_blank><IMG height=68 

  src="./webpages/images/54499964144110.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=惩罚者￥ href="http://www.68design.net/" 

  target=_blank>惩罚者￥</A></H6></LI>

  <LI>

  <DIV><A class=face title=xamuh621,女,24,新疆 

  href="http://www.68design.net/" target=_blank><IMG height=68 

  src="./webpages/images/69007483650920.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=xamuh621 href="http://www.68design.net/" 

  target=_blank>xamuh6...</A></H6></LI>

  <LI>

  <DIV><A class=face title=yayah917,女,14,香港 

  href="http://www.68design.net/" target=_blank><IMG height=68 

  src="./webpages/images/73243811548060.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=yayah917 href="http://www.68design.net/" 

  target=_blank>yayah917</A></H6></LI></UL></DIV>

<DIV class="friendcont  lrline">

<UL>

  <LI>

  <DIV><A class=face title=蓝韵ai,女,14,河南 href="http://www.68design.net/" 

  target=_blank><IMG height=68 

  src="./webpages/images/49619272121233.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=蓝韵ai href="http://www.68design.net/" 

  target=_blank>蓝韵ai</A></H6></LI>

  <LI>

  <DIV><A class=face title=女玩家！！,女,72,海外 href="http://www.68design.net/" 

  target=_blank><IMG height=68 

  src="./webpages/images/71582540621077.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=女玩家！！ href="http://www.68design.net/" 

  target=_blank>女玩家...</A></H6></LI>

  <LI>

  <DIV><A class=face title=诸葛湘枫,女,13,福建 href="http://www.68design.net/" 

  target=_blank><IMG height=68 

  src="./webpages/images/56862952928890.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=诸葛湘枫 href="http://www.68design.net/" 

  target=_blank>诸葛湘枫</A></H6></LI>

  <LI>

  <DIV><A class=face title=ＰＡＤＡ,男,19,新疆 

  href="http://www.68design.net/" target=_blank><IMG height=68 

  src="./webpages/images/61089143529200.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=ＰＡＤＥＱＩＢＡＬＡ href="http://www.68design.net/" 

  target=_blank>ＰＡＤ...</A></H6></LI>

  <LI>

  <DIV><A class=face title=k歌军团**素素,女,19,广东 

  href="http://www.68design.net/" target=_blank><IMG height=68 

  src="./webpages/images/66363482638217.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=k歌军团**素素 href="http://www.68design.net/" 

  target=_blank>k歌军团...</A></H6></LI>

  <LI>

  <DIV><A class=face title=abigail千年石,女,22,江苏 

  href="http://www.68design.net/" target=_blank><IMG height=68 

  src="./webpages/images/69130271532310.jpg_142.jpg" width=68 

  border=0></A></DIV>

  <H6><A title=abigail千年石 href="http://www.68design.net/" 

  target=_blank>abigail...</A></H6></LI></UL></DIV><!-- userinfo -->

<DIV id=user_msg>

<DIV class=uleft></DIV>

<DIV class=uright></DIV>

<DIV class=clear></DIV></DIV>

<SCRIPT type=text/javascript>

			    BindHead();

			                           

                $(".friendcont").eq(0).hide();

                $(".friendcont").eq(Math.floor(Math.random()*10%3)+1).show(0);

			</SCRIPT>



<DIV class=newstitle01><IMG 

src="./webpages/images/angle_09.gif"></DIV></DIV>

</DIV>

</div>

                    

                  <div class="post_body">

                  

                  </div>

                </div> <!-- end of post two -->



                

          </div> <!-- end of content left -->

        

            <div id="templatemo_content_right">

            

                <div class="templatemo_right_section">

                  <h2>请您登录：</h2>

                  <form id="form1" name="form1" method="post" action="loginAction">

                    <table width="100%" border="0">

                      <tr>

                        <td width="31%" height="59">登录名：</td>

                        <td width="69%" colspan="-1"><label for="loginname"></label>

                        <input type="text" name="user.username" id="userName" /></td>

                      </tr>

                      <tr>

                        <td height="48">密码：</td>

                        <td colspan="-1"><label for="password">

                          <input type="password" name="user.password" id="userPassword" />

                        </label></td>

                      </tr>

                      <tr>

                        <td height="48" colspan="2"><table width="100%" border="0" align="center">

                          <tr>

                            <td width="9%">&nbsp;</td>

                            <td width="45%">&nbsp;</td>

                            <td width="19%"><input type="submit" name="submit" id="submit" value="提交" /></td>

                            <td width="27%"><input type="submit" name="redo" id="redo" value="重置" /></td>

                          </tr>

                        </table></td>

                      </tr>

                     

                    </table>

                    <p>&nbsp;</p>

<p>&nbsp;</p>

                  </form>

                  <p>&nbsp;</p>

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