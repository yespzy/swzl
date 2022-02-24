<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 下面这句用于响应移动设备的改变布局，必须写在前面 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta charset="UTF-8">
    <title>广东石油化工学院失物招领系统</title>
    <link href="claim.css" type="text/css" rel="stylesheet">
    <link href="../qdtop/qdtop.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="../qdleft/qdleft.css" type="text/css">
    <link rel="stylesheet" href="../qdfooter/qdfooter.css" type="text/css">
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
    <style type="text/css">
        body{
            background-color: #F8D88A;
        }
        a,a:hover,a:visited,a:active{
            text-decoration: none;
        }
    </style>
</head>
<body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
<div class="container">
    <div class="qdtop">
         <%@include file="../qdtop/qdtop.jsp"%>
    </div>
    <div class="clear"></div>
    <table>
        <tr>
            <td>
                <div class="qdleft">
                   <%@include file="../qdleft/qdleft.jsp"%>
                </div>
            </td>
            <td>
                <div class="claim">
                    <div class="row">
                        <table>
                            <tr style="background-color: bisque">
                                <td class="col-lg-8 col-xs-8">
                                    <span class="glyphicon glyphicon-hand-right" style="color: rgb(99, 98, 90);margin-right: 0.5rem"></span>
                                    <span class="claim_title">物品认领信息</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <hr style="border: #FFFFFF 1px solid;margin: 0">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="claim_content">
                                     <%
										int curpage=1;//当前页
										int page_record=10;//每页显示的记录数
										int zgs=0;
										int zys=0;
										//用下面的方法（sql查询完成，速度快）
										String hsgnpage=request.getParameter("page");
										String fysql="select count(id) as ss from shiwuzhaoling where Flag='未招领' ";
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
										String sql;
										if (curpage==1){
											sql="select top "+page_record+" * from shiwuzhaoling where Flag='未招领' ";
										}else{
											sql="select top "+page_record+" * from shiwuzhaoling where id not in (select top "+((curpage-1)*page_record)+" id from shiwuzhaoling where Flag='未招领'  order by id desc) and Flag='未招领'  ";
										}
										ResultSet RS_result=connDbBean.executeQuery(sql);
										String xingming="";String touxiang="";String id="";
										while(RS_result.next()){
											 id=RS_result.getString("id");
											 xingming=RS_result.getString("mingcheng");touxiang=RS_result.getString("tupian");
									     %>
                                        <a href="../claim/claimdetail.jsp?id=<%=id%>">
                                              <img src="<%=touxiang%>">
                                              <p><%=xingming%></p>
                                        </a>
                                       <%}%>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <p class="claim_page" align="center">&nbsp;&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　
                          <a href="claim.jsp?page=1">首页</a>　
                          <a href="claim.jsp?page=<%= curpage-1%>">上一页</a>　
                          <a href="claim.jsp?page=<%= curpage+1%>">下一页</a>　
                          <a href="claim.jsp?page=<%=zys %>">尾页&nbsp;&nbsp;</a>当前第
                          <span><%=curpage %>&nbsp;</span>页/共
                          <span><%=zys %>&nbsp;</span>页
                       </p>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <div class="qdfooter">
         <%@include file="../qdfooter/qdfooter.jsp"%>
    </div>
</div>
</body>
</html>