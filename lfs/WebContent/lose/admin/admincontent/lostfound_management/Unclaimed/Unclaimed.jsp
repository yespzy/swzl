<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="Unclaimed.css" type="text/css">
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
    <style type="text/css">
        body{
            background-color: rgb(3, 168, 246);
            padding: 0;
            margin: 0;
        }
        a,a:hover,a:visited,a:active{
            text-decoration: none;
        }
    </style>
    <script language="javascript">
        function over(picPath) {
            if (picPath=="") picPath="default.jpg";
            x = event.clientX+5;
            y = event.clientY-10;
            document.all.showpicture.style.display = "block";
            document.all.showpicture.style.top = y+'px';
            document.all.showpicture.style.left = x+'px';
            document.all.photo.src =picPath;
        }
        function out(){
            document.all.showpicture.style.display = "none";
        }
    </script>
</head>
<%String sql;ResultSet RS_result;%>
<body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <div>
        <div class="unclaimed">
            <div class="row">
                <form name="unclaimedform" id="unclaimedform" method="post" action="">
                    名称：<input name="productname" type="text" id="productname" />
                    <input type="submit" name="submit" value="查找" />
                </form>
                <table style="margin-top: 1rem">
                    <tr>
                        <td width="60">序号</td>
                        <td width="100">物品名称</td>
                        <td width="130">捡到时间</td>
                        <td width="200">捡到地点</td>
                        <td width="60">图片</td>
                        <td width="150">备注</td>
                        <td width="130">认领人姓名</td>
                        <td width="120">联系电话</td>
                        <td width="100">操作</td>
                    </tr>
                      <%
					    int curpage=1;//当前页
						int page_record=10;//每页显示的记录数
						int zgs=0;
						int zys=0;
						//用下面的方法（sql查询完成，速度快）
						String hsgnpage=request.getParameter("page");
						String fysql="select count(id) as ss from shiwurenling";
						ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
						while(RS_resultfy.next()){
							zgs=Integer.parseInt(RS_resultfy.getString("ss"));
							zys=zgs/page_record+1;
						  }
						if (hsgnpage!=null){
							curpage=Integer.parseInt(request.getParameter("page"));//获取传递的值，需要显示的页
						}else{
							curpage=1;
						}
						if (curpage==0){
							curpage=1;
						}
						if(curpage>zys){
							curpage=zys;
						}
					   sql="";
					   sql="select top "+page_record+" * from shiwurenling where id not in (select top "+((curpage-1)*page_record)+" id from shiwurenling order by id desc) ";
						if(request.getParameter("productname")=="" ||request.getParameter("productname")==null ){
							
						}else{
							sql=sql+" and mingcheng like '%"+new String(request.getParameter("productname").getBytes("ISO-8859-1"),"utf-8")+"%'";
						}
						  sql=sql+" order by id desc";
						  RS_result=connDbBean.executeQuery(sql);
						  String id="";
						  String mingcheng="";
						  String shijian="";
						  String didian="";
						  String tupian="";
						  String beizhu="";
						  String addtime="";
						  String xingming="";
						  String dianhua="";
						  int i=0;
						while(RS_result.next()){
							i=i+1;
							id=RS_result.getString("id");
							mingcheng=RS_result.getString("mingcheng");
							shijian=RS_result.getString("shijian");
							didian=RS_result.getString("didian");
							tupian=RS_result.getString("tupian");
							beizhu=RS_result.getString("beizhu");
							addtime=RS_result.getString("addtime");
							xingming=RS_result.getString("xingming");
							dianhua=RS_result.getString("dianhua");
					  %>
                    <tr class="unclaimed_content">
                        <td width="60"><%=i %></td>
                        <td width="100"><%=mingcheng %></td>
                        <td width="130"><%=shijian %></td>
                        <td width="200"><%=didian %></td>
                        <td width="60">
                            <div onmouseover = "over('<%=tupian %>')" onmouseout = "out()">查看</div>
                        </td>
                        <td width="150"><%=beizhu %></td>
                        <td width="130"><%=xingming %></td>
                        <td width="120"><%=dianhua %></td>
                        <td width="100">
                            <a href="renling.jsp?id=<%=id %>" onClick="return confirm('确定此人认领改物品吗？')">认领</a>
                            <a href="delete_unclaim.jsp?id=<%=id %>&tablename=renling" onClick="return confirm('真的要删除？')">删除</a>
                        </td>
                    </tr>
                    <%}%>
                </table>
                <div id="showpicture" style="position: absolute;display: none;border:0px;width:80px; height:80px;">
                    <table id="showpicturetable" border="0" bgcolor="#ffffee">
                        <tr align="center">
                            <td><img id="photo" src="" height="150" width="150"></td>
                        </tr>
                    </table>
                </div>
                <div style="clear: both;display:none;"></div>
                <div class="unclaimed_page">
                    <br>
                    以上数据共<%=i %>条,<a onClick="javascript:window.print();">打印本页</a>
                   <p align="center">&nbsp;&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　
                          <a href="http://localhost:8080/lfs/lose/admin/admincontent/lostfound_management/Unclaimed/Unclaimed.jsp?page=1">首页</a>　
                          <a href="http://localhost:8080/lfs/lose/admin/admincontent/lostfound_management/Unclaimed/Unclaimed.jsp?page=<%=curpage-1%>">上一页</a>　
                          <a href="http://localhost:8080/lfs/lose/admin/admincontent/lostfound_management/Unclaimed/Unclaimed.jsp?page=<%=curpage+1%>">下一页</a>　
                          <a href="http://localhost:8080/lfs/lose/admin/admincontent/lostfound_management/Unclaimed/Unclaimed.jsp?page=<%=zys %>">尾页&nbsp;&nbsp;</a>当前第
                          <span><%=curpage %>&nbsp;</span>页/共
                          <span><%=zys %>&nbsp;</span>页
                   </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>