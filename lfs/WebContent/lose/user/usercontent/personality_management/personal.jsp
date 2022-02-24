<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="personal.css" type="text/css">
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
<script src="form.js" type="text/javascript"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <div>
        <div class="personal">
            <div class="row">
                <p>修改个人信息</p>
                <form name="personalform" id="personalform" method="post" action="personal_post.jsp">
                    <%
					  String sql="select * from yonghuzhuce where yonghuming='"+request.getSession().getAttribute("username")+"'";
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
					  ResultSet RS_result=connDbBean.executeQuery(sql);
					  while(RS_result.next()){
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
					  }
				   %>
                    <table>
                        <tr>
                            <td class="col-lg-2">用户名</td>
                            <td class="col-lg-4">
                                <input name="username" id="username" type="text" value="<%= yonghuming%>" onkeyup="checkUsername();">
                            </td>
                             <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:1.5vh;border:none!important;">
					            <span id="usernameMsg"></span>
				            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">密码</td>
                            <td class="col-lg-4">
                                <input name="password" id="password" type="text" value="<%= mima%>" onkeyup="checkPassword()">
                            </td>
                             <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:1.5vh;border:none!important;">
					            <span id="passwordMsg" style="color:red;"></span>
				            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">姓名</td>
                            <td class="col-lg-4">
                                <input name="name" id="name" type="text" value="<%= xingming%>" onkeyup="checkName()">
                            </td>
                             <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:1.5vh;border:none!important;">
					            <span id="nameMsg" style="color:red;"></span>
				            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-4">性别</td>
                            <td class="col-lg-8">
                                <select name="sex" id="sex">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </td>
                        </tr>
                        <script language="javascript">document.personalform.sex.value="<%=xingbie%>";</script>
                        <tr>
                            <td class="col-lg-4">出生日期</td>
                            <td class="col-lg-8">
                                <input name="birthday" id="birthday" type="date" value="<%= chushengnianyue%>">
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">QQ</td>
                            <td class="col-lg-4">
                                <input name="QQ" id="QQ" type="text" value="<%= QQ%>" onkeyup="checkQQ()">
                            </td>
                             <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:1.5vh;border:none!important;">
					            <span id="QQMsg" style="color:red;"></span>
				            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">邮箱</td>
                            <td class="col-lg-4">
                                <input name="Email" id="Email" type="text" value="<%= youxiang%>" onkeyup="checkEmail()">
                            </td>
                             <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:1.5vh;border:none!important;">
					            <span id="EmailMsg" style="color:red;"></span>
				            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">电话</td>
                            <td class="col-lg-4">
                                <input name="phone" id="phone" type="text" value="<%= dianhua%>" onkeyup="checkPhone()">
                            </td>
                             <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:1.5vh;border:none!important;">
					            <span id="phoneMsg" style="color:red;"></span>
					            <span style="color:black;"></span>
				            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">学院</td>
                            <td class="col-lg-4">
                                <input name="academy" id="academy" type="text" value="<%= xueyuan%>" onkeyup="checkAcademy()">
                            </td>
                             <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:1.5vh;border:none!important;">
					             <span id="academyMsg" style="color:red;"></span>
				            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">专业</td>
                            <td class="col-lg-4">
                                <input name="major" id="major" type="text" value="<%=zhuanye%>" onkeyup="checkMajor()">
                            </td>
                            <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:1.5vh;border:none!important;">
					            <span id="majorMsg" style="color:red;"></span>
				            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">班级</td>
                            <td class="col-lg-4">
                                <input name="class" id="class" type="text" value="<%=banji%>" onkeyup="checkClass()">
                            </td>
                             <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:1.5vh;border:none!important;">
					            <span id="classMsg" style="color:red;"></span>
				            </td>
                        </tr>
                        <tr class="personal_button">
                            <td style="width:100%">
                                <input type="submit" name="submit" id="submit" value="提交" onclick="return check();">
                                <input type="reset" name="reset" id="reset" value="重置">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</body>
</html>