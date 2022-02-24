<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="PersonalLoseList.css" type="text/css">
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
<%String sql;ResultSet RS_result;%>
<body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <div>
        <div class="personalloselist">
            <div class="row">
                <p>我的报失信息列表</p>
                <form name="personalloselistform" id="personalloselistform" method="post" action="">
                    名称：<input name="productname" type="text" id="productname" />
                    <input type="submit" name="submit" value="查找" />
                </form>
                <table style="margin-top: 2rem">
                    <tr>
                        <td width="100">序号</td>
                        <td width="200">物品名称</td>
                        <td width="100">丢失日期</td>
                        <td width="200">丢失地点</td>
                        <td width="150">备注</td>
                        <td width="200">报失时间</td>
                        <td width="100">操作</td>
                    </tr>
                     <%
					    int curpage=1;//当前页
						int page_record=10;//每页显示的记录数
						int zgs=0;
						int zys=0;
						//用下面的方法（sql查询完成，速度快）
						String hsgnpage=request.getParameter("page");
						String fysql="select count(id) as ss from baoshixinxi where username='"+request.getSession().getAttribute("username")+"'";
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
					  sql="select top "+page_record+" * from baoshixinxi where id not in (select top "+((curpage-1)*page_record)+" id from shiwuzhaoling  where username='"+request.getSession().getAttribute("username")+"'order by id desc)  and username='"+request.getSession().getAttribute("username")+"'";
					  if(request.getParameter("productname")=="" || request.getParameter("productname")==null ){
						  
					  }else{
						 	 sql=sql+" and mingcheng like '%"+new String(request.getParameter("productname").getBytes("ISO-8859-1"),"utf-8")+"%'";
						  }
					 sql=sql+" order by id desc";
					 RS_result=connDbBean.executeQuery(sql);
					 String id="";
					 String mingcheng="";
					 String shijian="";
					 String didian="";
					 String beizhu="";
					 String addtime="";
					 int i=0;
					 while(RS_result.next()){
					 i=i+1;
					 id=RS_result.getString("id");
					 mingcheng=RS_result.getString("mingcheng");
					 shijian=RS_result.getString("shijian");
					 didian=RS_result.getString("didian");
					 beizhu=RS_result.getString("beizhu");
					 addtime=RS_result.getString("addtime");
					%>
                    <tr class="personalloselist_content">
                        <td width="100"><%=i %></td>
                        <td width="200"><%=mingcheng %></td>
                        <td width="100"><%=shijian %></td>
                        <td width="200"><%=didian %></td>
                        <td width="150"><%=beizhu %></td>
                        <td width="200"><%=addtime %></td>
                        <td width="100">
                            <a href="http://localhost:8080/lfs/lose/user/usercontent/personallose_management/Editpersonallose/EditPersonalLose.jsp?id=<%=id%>" target="userleftcontent">修改</a>
                            <a  href="delete_mylose.jsp?id=<%=id %>&tablename=baoshixinxi" onClick="return confirm('真的要删除？')">删除</a>
                        </td>
                    </tr>
                   <%} %>
                </table>
                <div style="clear:both;display: none"></div>
                <div class="personalloselist_page">
                <br>
                       以上数据共<%=i %>条,<a onClick="javascript:window.print();">打印本页</a>
                   <p align="center">&nbsp;&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　
                          <a href="http://localhost:8080/lfs/lose/user/usercontent/personallose_management/PersonalLoseList/PersonalLoseList.jsp?page=1">首页</a>　
                          <a href="http://localhost:8080/lfs/lose/user/usercontent/personallose_management/PersonalLoseList/PersonalLoseList.jsp?page=<%=curpage-1%>">上一页</a>　
                          <a href="http://localhost:8080/lfs/lose/user/usercontent/personallose_management/PersonalLoseList/PersonalLoseList.jsp?page=<%=curpage+1%>">下一页</a>　
                          <a href="http://localhost:8080/lfs/lose/user/usercontent/personallose_management/PersonalLoseList/PersonalLoseList.jsp?page=<%=zys %>">尾页&nbsp;&nbsp;</a>当前第
                          <span><%=curpage %>&nbsp;</span>页/共
                          <span><%=zys %>&nbsp;</span>页
                   </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>