<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 下面这句用于响应移动设备的改变布局，必须写在前面 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta charset="UTF-8">
    <title>广东石油化工学院失物招领系统</title>
    <link href="userlogon.css" type="text/css" rel="stylesheet">
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
                    <div class="user_logon">
                        <div class="row">
                            <form name="userlogon" method="post" action="userlogon_add_post.jsp">
                                <table>
                                    <tr  style="background-color: bisque">
                                        <td class="col-lg-8 col-xs-8">
                                            <span class="glyphicon glyphicon-hand-right" style="color: rgb(99, 98, 90);margin-right: 0.5rem"></span>
                                            <span class="user_logon_title">用户注册</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <hr style="border: #FFFFFF 1px solid;margin: 0">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                           <div class="userlogon_content">
                                               <table>
                                                   <tr>
                                                       <td class="col-lg-2">账号</td>
                                                       <td class="col-lg-4">
                                                           <input type="text" name="Username" id="Username" onkeyup="checkUsername()">
                                                           <span style="color:red">*</span>
                                                       </td>
                                                         <td class="col-lg-6" style="font-size:1.3vw;padding:0">
												            <span id="usernameMsg"></span>
												            <span style="color:white;">字母数字下划线,不能是数字开头</span>
											            </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="col-lg-2">密码</td>
                                                       <td class="col-lg-4">
                                                           <input name="Password" id="Password" type="password" onkeyup="checkPassword()">
                                                           <span style="color:red">*</span>
                                                       </td>
                                                        <td class="col-lg-6" style="font-size:1.3vw;padding:0">
												            <span id="passwordMsg" style="color:red;"></span>
												            <span style="color:white;">	密码请设置6-16位字符</span>
											            </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="col-lg-2">姓名</td>
                                                       <td class="col-lg-4">
                                                           <input name="name" id="name" type="text" onkeyup="checkName()">
                                                           <span style="color:red">*</span>
                                                       </td>
                                                        <td class="col-lg-6" style="font-size:1.3vw;padding:0;">
												            <span id="nameMsg" style="color:red;"></span>
												            <span style="color:white;">姓名应为2-3位中文真实姓名</span>
											            </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="col-lg-4">性别</td>
                                                       <td class="col-lg-8" style="padding-left: 5.3vw;">
                                                           <select name="sex" id="sex">
                                                               <option value="男">男</option>
                                                               <option value="女">女</option>
                                                           </select>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="col-lg-4">出生日期</td>
                                                       <td class="col-lg-8" style="padding-left:1.5vw;">
                                                           <input name="birthday" id="birthday" type="date">
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="col-lg-2">Q Q</td>
                                                       <td class="col-lg-4" style="padding-left:1.5vw;">
                                                           <input name="QQ" id="QQ" type="text" onkeyup="checkQQ()">
                                                       </td>
                                                        <td class="col-lg-6" style="font-size:1.3vw;padding:0">
												            <span id="QQMsg" style="color:red;"></span>
												            <span style="color:white;">请输入6-10位阿拉伯数字</span>
											            </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="col-lg-2">邮箱</td>
                                                       <td class="col-lg-4" style="padding-left:1.5vw;">
                                                           <input name="Email" id="Email" type="text" onkeyup="checkEmail()">
                                                       </td>
                                                        <td class="col-lg-6" style="font-size:1.3vw;padding:0">
												            <span id="EmailMsg" style="color:red;"></span>
												            <span style="color:white;">请输入有效的邮箱地址</span>
											            </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="col-lg-2">电话</td>
                                                       <td class="col-lg-4" style="padding-left:1.5vw;">
                                                           <input name="phone" id="phone" type="text" onkeyup="checkPhone()">
                                                       </td>
                                                        <td class="col-lg-6" style="font-size:1.3vw;padding:0">
												            <span id="phoneMsg" style="color:red;"></span>
												            <span style="color:white;">请填写以1开头的11位有效数字</span>
											            </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="col-lg-2">学院</td>
                                                       <td class="col-lg-4" style="padding-left:1.5vw;">
                                                           <input name="academy" id="academy" type="text" onkeyup="checkAcademy()">
                                                       </td>
                                                        <td class="col-lg-6" style="font-size:1.3vw;padding:0">
												            <span id="academyMsg" style="color:red;"></span>
												            <span style="color:white;">请输入中文名称</span>
											            </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="col-lg-2">专业</td>
                                                       <td class="col-lg-4" style="padding-left:1.5vw;">
                                                           <input name="major" id="major" type="text" onkeyup="checkMajor()">
                                                       </td>
                                                        <td class="col-lg-6" style="font-size:1.3vw;padding:0">
												            <span id="majorMsg" style="color:red;"></span>
												            <span style="color:white;">请输入中文名称</span>
											            </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="col-lg-2">班级</td>
                                                       <td class="col-lg-4" style="padding-left:1.5vw;">
                                                           <input name="classes" id="classes" type="text"  onkeyup="checkClass()">
                                                       </td>
                                                        <td class="col-lg-6" style="font-size:1.3vw;padding:0">
												            <span id="classMsg" style="color:red;"></span>
												            <span style="color:white;">中文、数字、短横线组成，必须以中文开头</span>
											            </td>
                                                   </tr>
                                               </table>
                                           </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="userlogon_button">
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