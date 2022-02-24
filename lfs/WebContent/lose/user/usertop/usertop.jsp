<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="usertop.css" type="text/css">
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
        <div class="admintop">
            <div class="row">
                <table>
                    <tr>
                        <td class="col-lg-2">
                            <h1>管理平台</h1>
                        </td>
                        <td class="col-lg-4">
                            <table>
                                <tr>
                                    <td>
                                        <img src="admintopclose.jpg" width="15" height="15">
                                    </td>
                                    <td class="admintoptitle">
                                        <h2>
                                            校园失物招领系统
                                        </h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="backindex">
                                        <a href="http://localhost:8080/lfs/lose/FrontEnd/index/index.jsp" target="_parent">
                                            返回首页
                                        </a>
                                    </td>
                                    <td class="outsystem">
                                        <a href="http://localhost:8080/lfs/lose/FrontEnd/adminlogon/adminlogon_out.jsp" target="_top">
                                            退出系统
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td class="col-lg-3 admintoprow">
                            <span>
                                当前用户：<%=request.getSession().getAttribute("username")%> 权限：<%=request.getSession().getAttribute("cx")%>
                            </span>
                        </td>
                        <td class="col-lg-2 admintopdate" style="width:20vw;">
					                            当前时间：<span id="nowtime"></span>
								<script>
									setInterval(function(){
										document.getElementById("nowtime").innerHTML = new Date().toLocaleString();
									},1000)
								</script>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="clear:both;display: none"></div>
    </div>
</body>
</html>