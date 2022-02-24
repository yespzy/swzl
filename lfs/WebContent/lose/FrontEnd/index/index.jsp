<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%
	request.setCharacterEncoding("utf-8"); 
	response.setCharacterEncoding("utf-8"); 
%>
<%@ page language="java" import="java.sql.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 下面这句用于响应移动设备的改变布局，必须写在前面 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <title>广东石油化工学院失物招领系统</title>
    <link href="index.css" type="text/css" rel="stylesheet">
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
                    <div class="index">
                        <div class="newest">
                            <div class="row">
                                <div class="newest_lose">
                                    <table>
                                        <tr style=" background-color: bisque">
                                            <td class="col-lg-8 col-xs-8">
                                                <span class="glyphicon glyphicon-hand-right" style="color: rgb(99, 98, 90);margin-right: 0.5rem"></span>
                                                <span class="newest_lose_title">最新物品报失</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <hr style="border: #FFFFFF 1px solid;margin: 0">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="newest_lose_content">
                                                    <table>
                                                      <% 
															 String sql="";
															 sql="select top 6 id,mingcheng,addtime from baoshixinxi order by id desc";
															 String id="";
															 String mingcheng="";
															 String addtime="";
															 int i=0;
															 ResultSet RS_result=connDbBean.executeQuery(sql);
															 while(RS_result.next()){
																i=i+1;
																id=RS_result.getString("id");
																mingcheng=RS_result.getString("mingcheng");
																if(mingcheng.length() >=28){
																		mingcheng=mingcheng.substring(0,28);
																	}
																 addtime=RS_result.getString("addtime");
														%>
                                                        <tr style="border-bottom: #FFFFFF 1px dashed;margin: 0">
                                                            <td valign="bottom" class="col-lg-8 col-xs-6">
                                                                <span style="font-size: 2vw;text-align: center;display: inline">.<a href="../lose/losedetail.jsp?id=<%=id%>"><%=mingcheng%></a></span>
                                                            </td>
                                                            <td valign="bottom" class="col-lg-4 col-xs-6">
                                                                <span><% out.print(addtime.substring(0,10));%></span>
                                                            </td>
                                                        </tr>
                                                        <%}%>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="newest" style="background-color: ghostwhite">
                            <div class="row">
                                <div class="newest_claim">
                                    <table>
                                        <tr style="background-color: bisque">
                                            <td class="col-lg-8 col-xs-8">
                                                <span class="glyphicon glyphicon-hand-right" style="color: rgb(99, 98, 90);margin-right: 0.5rem"></span>
                                                <span class="newest_claim_title">最新物品招领</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <hr style="border: #FFFFFF 1px solid;margin: 0">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="newest_claim_content">
                                                 <%
												  	sql="select top 4 id,mingcheng,tupian from shiwuzhaoling where tupian<>'' and Flag='未招领' order by id desc";
													RS_result=connDbBean.executeQuery(sql);
													String xingming="";
													String touxiang="";
												    while(RS_result.next()){
														 id=RS_result.getString("id");
														 xingming=RS_result.getString("mingcheng");
														 touxiang=RS_result.getString("tupian");
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
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div style="display: none;clear: both"></div>
        <div class="qdfooter">
            <%@include file="../qdfooter/qdfooter.jsp"%>
        </div>
    </div>
</body>
</html>