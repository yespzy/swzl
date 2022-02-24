<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="Message.css" type="text/css">
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
</head>
<body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <div>
        <div class="massage">
            <div class="row">
                <p>已有留言板列表：</p>
                <table style="margin-top: 1rem">
                    <tr>
                        <td width="50">序号</td>
                        <td width="55">昵称</td>
                        <td width="85">QQ</td>
                        <td width="135">邮箱</td>
                        <td width="100">电话</td>
                        <td width="200">内容</td>
                        <td width="200">添加时间</td>
                        <td width="140">回复内容</td>
                        <td width="90">操作</td>
                    </tr>
                     <%
                     int curpage=1;//当前页
					 int page_record=10;//每页显示的记录数
					 int zgs=0;
					 int zys=0;
					 //用下面的方法（sql查询完成，速度快）
					 String hsgnpage=request.getParameter("page");
					 String fysql="select count(id) as ss from leavemessage";
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
					 String sql="";
					 sql="select top "+page_record+" * from leavemessage where id not in (select top "+((curpage-1)*page_record)+" id from leavemessage order by id desc) ";
					 sql=sql+" order by id desc";
					 ResultSet RS_result=connDbBean.executeQuery(sql);
					 String id="";
					 String cheng="";
					 String touxiang="";
					 String QQ="";
					 String youxiang="";
					 String dianhua="";
					 String neirong="";
					 String huifuneirong="";
					 String addtime="";
					 int i=0;
					 while(RS_result.next()){
						 i=i+1;
						 id=RS_result.getString("id");
						 cheng=RS_result.getString("nickname");
						 touxiang=RS_result.getString("imagename");
						 QQ=RS_result.getString("QQ");
						 youxiang=RS_result.getString("Email");
						 dianhua=RS_result.getString("phone");
						 neirong=RS_result.getString("neirong");
						 huifuneirong=RS_result.getString("replymessage");
						 addtime=RS_result.getString("addtime");
					%>
                    <tr class="massage_content">
                        <td width="50"><%=i %></td>
                        <td width="55"><%=cheng %></td>
                        <td width="85"><%=QQ %></td>
                        <td width="135"><%=youxiang %></td>
                        <td width="100"><%=dianhua %></td>
                        <td width="200"><%=neirong %></td>
                        <td width="200"><%=addtime %></td>
                        <td width="140"><%=huifuneirong %></td>
                        <td width="90">
                            <a href="http://localhost:8080/lfs/lose/admin/admincontent/message_management/ReplyMessage.jsp?id=<%=id%>" target="adminleftcontent">回复</a>
                            <a href="delete_message.jsp?id=<%=id %>&tablename=leavemessage" onClick="return confirm('真的要删除？')">删除</a>
                        </td>
                    </tr>
                    <%}%>
                </table>
                <div style="clear: both;display:none;"></div>
                <div class="massage_page">
                    <br>
                   以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
                    <p align="center">&nbsp;&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　
                          <a href="http://localhost:8080/lfs/lose/admin/admincontent/message_management/Message.jsp?page=1">首页</a>　
                          <a href="http://localhost:8080/lfs/lose/admin/admincontent/message_management/Message.jsp?page=<%=curpage-1%>">上一页</a>　
                          <a href="http://localhost:8080/lfs/lose/admin/admincontent/message_management/Message.jsp?page=<%=curpage+1%>">下一页</a>　
                          <a href="http://localhost:8080/lfs/lose/admin/admincontent/message_management/Message.jsp?page=<%=zys %>">尾页&nbsp;&nbsp;</a>当前第
                          <span><%=curpage %>&nbsp;</span>页/共
                          <span><%=zys %>&nbsp;</span>页
                   </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>