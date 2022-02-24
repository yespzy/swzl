<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 下面这句用于响应移动设备的改变布局，必须写在前面 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta charset="UTF-8">
    <title>广东石油化工学院失物招领系统</title>
    <link href="leave.css" type="text/css" rel="stylesheet">
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
<script src="form.js" type="text/javascript"></script>
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
                    <div class="addleave">
                        <div class="row">
                            <form name="addleave" id="addleave" method="post" action="leave_add_post.jsp">
                                <table>
                                    <tr style="background-color: bisque">
                                        <td class="col-lg-12">
                                            <span class="glyphicon glyphicon-hand-right" style="color: rgb(99, 98, 90);margin-right: 0.5rem"></span>
                                            <span class="leave_title">留言板</span>
                                            <a style="color: #FFFFFF;float: right" href="leave.jsp"> 查看已有留言</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <hr style="border: #FFFFFF 1px solid;clear: both;margin: 0">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="addleave_content">
                                                <table>
                                                    <tr>
                                                        <td class="col-lg-2 addleave_content_title">昵称</td>
                                                        <td class="col-lg-4">
                                                            <input name="nickname" id="nickname" type="text" onkeyup="checkNickname()">
                                                        </td>
                                                         <td class="col-lg-6" style="font-size:1vw;padding:0">
                                                             <span style="display: inline;color: #cc3300">*</span>
												             <span id="nickNameMsg" style="color:red;"></span>
											            </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-lg-2 addleave_content_title">Q Q</td>
                                                        <td class="col-lg-4">
                                                            <input name="QQ" id="QQ" type="text" onkeyup="checkQQ()">
                                                        </td>
                                                         <td class="col-lg-6" style="font-size:1vw;padding:0">
                                                             <span id="QQMsg" style="color:red;"></span>
											            </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-lg-2 addleave_content_title">邮箱</td>
                                                        <td class="col-lg-4">
                                                            <input name="Email" id="Email" type="text" onkeyup="checkEmail()">
                                                        </td>
                                                         <td class="col-lg-6" style="font-size:1vw;padding:0">
                                                             <span id="EmailMsg" style="color:red;"></span>
											            </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-lg-2 addleave_content_title">电话</td>
                                                        <td class="col-lg-4">
                                                            <input name="phone" id="phone" type="text" onkeyup="checkPhone()">
                                                        </td>
                                                        <td class="col-lg-6" style="font-size:1vw;padding:0">
                                                             <span id="phoneMsg" style="color:red;"></span>
											            </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-lg-4 addleave_content_title">头像</td>
                                                        <td class="col-lg-8">
                                                            <input name="imagename" id="imagename" type="radio" value="tx1" style="width: auto;">
                                                            <img src="tx1.jpg">
                                                            <input name="imagename" id="imagename" type="radio" value="tx2" style="width: auto;">
                                                            <img src="tx2.jpg"> 
                                                            <input name="imagename" id="imagename" type="radio" value="tx3" style="width: auto;">
                                                            <img src="tx3.jpg">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-lg-2 addleave_content_title">内容</td>
                                                        <td class="col-lg-4">
                                                            <textarea name="content" id="content" cols="32" rows="3" onkeyup="checkContent()"></textarea>
                                                        </td>
                                                         <td class="col-lg-6" style="font-size:1vw;padding:0">
                                                            <span style="display: inline;color: #cc3300">*</span>
                                                            <span id="contentMsg" style="color:red;"></span>
											            </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="addleave_button">
                                                <input value="提交" name="submit" type="submit" onClick="return check();">
                                                <input value="重置" name="reset" type="reset">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </form>
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