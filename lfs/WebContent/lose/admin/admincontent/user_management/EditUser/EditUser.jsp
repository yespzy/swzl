<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<%
	request.setCharacterEncoding("utf-8"); 
	response.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><link rel="stylesheet" href="Edituser.css" type="text/css">
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
        <div class="edituser">
            <div class="row">
                <form name="edituserform" id="edituserform" method="post" action="">
                    用户名：<input name="username" type="text" id="username" />
                    姓名：<input name="name" type="text" id="name" />
                    <input type="submit" name="submit" value="查找" />
                </form>
                <table style="margin-top: 1rem">
                    <tr>
                        <td width="45">序号</td>
                        <td width="50">用户名</td>
                        <td width="70">密码</td>
                        <td width="55">姓名</td>
                        <td width="45">性别</td>
                        <td width="90">出生时间</td>
                        <td width="85">QQ</td>
                        <td width="145">邮箱</td>
                        <td width="95">电话</td>
                        <td width="50">学院</td>
                        <td width="90">专业</td>
                        <td width="110">班级</td>
                        <td width="70">审核状态</td>
                        <td width="50">操作</td>
                    </tr>
                     <%
					    int curpage=1;//当前页
						int page_record=10;//每页显示的记录数
						int zgs=0;
						int zys=0;
						//用下面的方法（sql查询完成，速度快）
						String hsgnpage=request.getParameter("page");
						String fysql="select count(id) as ss from yonghuzhuce";
						ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
					    while(RS_resultfy.next()){
						  zgs=Integer.parseInt(RS_resultfy.getString("ss"));
						  zys=zgs/page_record+1;
					    }
						if (hsgnpage!=null){
							curpage=Integer.parseInt(request.getParameter("page"));//获取传递的值，需要显示的页
						}else{
							curpage=1;
						}if (curpage==0){
							curpage=1;
						}if(curpage>zys){
							curpage=zys;
						}
					    String sql="";
						sql="select top "+page_record+" * from yonghuzhuce where id not in (select top "+((curpage-1)*page_record)+" id from yonghuzhuce order by id desc) ";
					   if(request.getParameter("username")=="" ||request.getParameter("username")==null ){
						   
					   }else{
						   sql=sql+" and yonghuming like '%"+request.getParameter("username")+"%'";
						   }
					   if(request.getParameter("name")=="" ||request.getParameter("name")==null ){
						   
					   }else{
						   sql=sql+" and xingming like '%"+request.getParameter("name")+"%'";
						   }
					  sql=sql+" order by id desc";
					  ResultSet RS_result=connDbBean.executeQuery(sql);
					  String id="";
					  String yonghuming="";
					  String mima="";
					  String xingming="";
					  String xingbie="";
					  String chushengnianyue="";
					  String QQ="";
					  String youxiang="";
					  String dianhua="";
					  String xueyuan="";
					  String zhuanye="";
					  String banji="";
					  String addtime="";
					  String issh="";
					  int i=0;
					  while(RS_result.next()){
						  i=i+1;
						  id=RS_result.getString("id");
						  yonghuming=RS_result.getString("yonghuming");
						  mima=RS_result.getString("mima");
						  xingming=RS_result.getString("xingming");
						  xingbie=RS_result.getString("xingbie");
						  chushengnianyue=RS_result.getString("chushengnianyue");
						  QQ=RS_result.getString("QQ");
						  youxiang=RS_result.getString("youxiang");
						  dianhua=RS_result.getString("dianhua");
						  xueyuan=RS_result.getString("xueyuan");
						  zhuanye=RS_result.getString("zhuanye");
						  banji=RS_result.getString("banji");
						  addtime=RS_result.getString("addtime");
						  issh=RS_result.getString("issh");
					 %>
                    <tr>
                        <td width="45"><%=i %></td>
                        <td width="50"><%=yonghuming %></td>
                        <td width="70"><%=mima %></td>
                        <td width="55"><%=xingming %></td>
                        <td width="45"><%=xingbie %></td>
                        <td width="90"><%=chushengnianyue %></td>
                        <td width="85"><%=QQ %></td>
                        <td width="145"><%=youxiang %></td>
                        <td width="95"><%=dianhua %></td>
                        <td width="50"><%=xueyuan %></td>
                        <td width="90"><%=zhuanye %></td>
                        <td width="110"><%=banji %></td>
                        <td width="70">
                            <a href="shi_user.jsp?id=<%=id%>&yuan=<%=issh%>&tablename=yonghuzhuce" onClick="return confirm('确定要执行此操作？');"><%=issh%></a>
                        </td>
                        <td width="50">
                            <a href="delete_user.jsp?id=<%=id %>&tablename=yonghuzhuce" onClick="return confirm('真的要删除？')">
                                删除
                            </a>
                        </td>
                    </tr>
                    <%}%>
                </table>
                <div class="edituser_page">
                    <br>
                    以上数据共<%=i %>条,<a onClick="javascript:window.print();">打印本页</a>
                   <p align="center">&nbsp;&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　
                          <a href="http://localhost:8080/lfs/lose/admin/admincontent/user_management/EditUser/EditUser.jsp?page=1">首页</a>　
                          <a href="http://localhost:8080/lfs/lose/admin/admincontent/user_management/EditUser/EditUser.jsp?page=<%= curpage-1%>">上一页</a>　
                          <a href="http://localhost:8080/lfs/lose/admin/admincontent/user_management/EditUser/EditUser.jsp?page=<%= curpage+1%>">下一页</a>　
                          <a href="http://localhost:8080/lfs/lose/admin/admincontent/user_management/EditUser/EditUser.jsp?page=<%=zys %>">尾页&nbsp;&nbsp;</a>当前第
                          <span><%=curpage %>&nbsp;</span>页/共
                          <span><%=zys %>&nbsp;</span>页
                   </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>