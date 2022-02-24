<%@ page language="java"  contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
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
<%String id=request.getParameter("id");%>
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
                    <div class="claimdetail">
                        <div class="row">
                            <table>
                                <tr style="background-color: bisque">
                                    <td class="col-lg-8 col-xs-8">
                                        <span class="glyphicon glyphicon-hand-right" style="color: rgb(99, 98, 90);margin-right: 0.5rem"></span>
                                        <span class="claimdetail_title">物品认领信息详情</span>
                                    </td>
                                    <td class="col-lg-4 col-xs-4">
                                        <a href="renling.jsp?id=<%=id%>" onClick="javascript:return confirm('确定要认领此物品?');">
                                            <input value="认领" name="" type="button" >
                                        </a>
                                        <input name="back" value="返回" type="button" onClick="javascript:history.back();">
                                    </td>
                                </tr>
                                <tr style="border: #FFFFFF 1px solid;margin: 0">
                                    <td></td>
                                </tr>
                                <table>
                                	 <tr>
                                    <td>
                                        <div class="claimdetail_content">
                                            <table border="0" cellpadding="0" cellspacing="0">
	                                            <%
												  String sql="select * from shiwuzhaoling where id="+id;
												  String mingcheng="";
												  String shijian="";
												  String didian="";
												  String tupian="";
												  String beizhu="";
												  ResultSet RS_result=connDbBean.executeQuery(sql);
												  while(RS_result.next()){
													  mingcheng=RS_result.getString("mingcheng");
													  shijian=RS_result.getString("shijian");
													  didian=RS_result.getString("didian");
													  tupian=RS_result.getString("tupian");
													  beizhu=RS_result.getString("beizhu");
												 %>
                                                <tr>
                                                    <td class="col-lg-3 claimdetail_content_title">物品名称:</td>
                                                    <td class="col-lg-8 claimdetail_content_detail"><%=mingcheng%></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-lg-3 claimdetail_content_title">捡到时间:</td>
                                                    <td class="col-lg-8 claimdetail_content_detail"><%=shijian%></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-lg-3 claimdetail_content_title">捡到地点:</td>
                                                    <td class="col-lg-8 claimdetail_content_detail"><%=didian%></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-lg-3 claimdetail_content_title">物品图片:</td>
                                                    <td class="col-lg-8 claimdetail_content_detail">
                                                        <img src="<%=tupian%>">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="col-lg-3 claimdetail_content_title">备注:</td>
                                                    <td class="col-lg-8 claimdetail_content_detail"><%=beizhu%></td>
                                                </tr>
                                                <%}%>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                               </table>
                            </table>
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