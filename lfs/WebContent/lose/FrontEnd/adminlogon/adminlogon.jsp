<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 下面这句用于响应移动设备的改变布局，必须写在前面 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta charset="UTF-8">
    <title>广东石油化工学院失物招领系统</title>
    <link href="adminlogon.css" type="text/css" rel="stylesheet">
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
    <style type="text/css">
        body{
            background-color: #F8D88A;
        }
        a,a:hover,a:visited,a:active{
            text-decoration: none;
        }
    </style>
     <script language="javascript">
        function check(){
            if(document.adminlogonform.username.value==""){
                alert("请输入账号");
                document.adminlogonform.username.focus();
                return false;
            }if(document.adminlogonform.password.value==""){
                alert("请输入密码");
                document.adminlogonform.password.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <div class="container">
        <div class="adminlogon">
            <div class="row">
                <table>
                    <tr>
                        <td class="adminlogon_image01">
                            <h3>校园失物招领系统</h3>
                        </td>
                        <td class="adminlogon_image02">
                            <div style="height: 20vh;"></div>
                            <div class="adminlogon_content">
                                <form name="adminlogonform" id="adminlogonform" method="post" action="adminlogon_post.jsp">
                                    <table>
                                        <tr class="welcom">
                                            <td>
                                                <img src="images/welcom.png">
                                                <span>欢迎登录！</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span>账号</span>
                                                <input name="username" id="username" type="text">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span>密码</span>
                                                <input name="password" id="password" type="password">
                                            </td>
                                        </tr>
                                        <tr style="display:none">
                                            <td>
                                                <span>权限</span>
                                                <select name="power" id="power">
                                                    <option value="管理员">管理员</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr class="button">
                                            <td style="margin-right: 1rem">
                                                <input type="submit" name="submit" value="登录" onClick="return check();">
                                            </td>
                                            <td style="float: right">
                                                <input type="reset" name="cancel" value="取消">
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </td>
                        <td class="adminlogon_image03"></td>
                    </tr>
                    <tr class="adminlogon_image04">
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>