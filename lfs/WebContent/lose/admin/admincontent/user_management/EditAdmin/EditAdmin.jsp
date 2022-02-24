<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="EditAdmin.css" type="text/css">
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
        <div class="editadmin">
            <div class="row">
                <form method="post" action="editadmin_post.jsp"name="editadmin" id="editadmin">
                    <table class="editadmin_post" border="0">
                        <tr>
                            <td class="col-lg-2">用户名</td>
                            <td class="col-lg-4">
                                <input type="text" name="username" id="username" onkeyup="checkusername()">
                                <span style="color: #cc3300">*</span>
                            </td>
                             <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:2vh;border:none!important;">
					            <span id="usernameMsg" style="color:red;"></span>
				            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">密 码</td>
                            <td class="col-lg-4">
                                <input type="password" name="password" id="password" onkeyup="checkpassword()">
                                <span style="color: #cc3300">*</span>
                            </td>
                             <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:2vh;border:none!important;">
					            <span id="passwordMsg" style="color:red;"></span>
				            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">确认密码</td>
                            <td class="col-lg-4">
                                <input type="password" name="repassword" id="repassword" onkeyup="checkrepassword()">
                                <span style="color: #cc3300">*</span>
                            </td>
                             <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:2vh;border:none!important;">
					            <span id="repasswordMsg" style="color:red;"></span>
				            </td>
                        </tr>
                        <tr class="editadmin_button">
                            <td style="width:100%">
                                <input type="submit" name="submit" value="提交" onclick="return check();">
                                <input type="reset" name="reset" value="重置">
                            </td>
                        </tr>
                    </table>
                </form>
                <table>
                    <tr class="admin_existence">
                        <td class="col-lg-12">已有管理员列表：</td>
                    </tr>
                    <tr>
                        <td style="width: 100%;border: none!important;" class="admin_existence_content">
                            <table >
                                <tr >
                                    <td class="col-lg-2" width="100">序号</td>
                                    <td class="col-lg-2" width="200">用户名</td>
                                    <td class="col-lg-2" width="250">密码</td>
                                    <td class="col-lg-4" width="350">添加时间</td>
                                    <td class="col-lg-2" width="100">操作</td>
                                </tr>
                                 <%
									 ResultSet RS_result=connDbBean.executeQuery("select * from admin order by id desc" );
									 String id="";
									 String username="";
									 String pwd="";
									 String addtime="";
									 int i=0;
									 while(RS_result.next()){
										 i=i+1;
										 id=RS_result.getString("id");
										 username=RS_result.getString("username");
										 pwd=RS_result.getString("pwd");
										 addtime=RS_result.getString("addtime");
								  %>
                                <tr >
                                    <td class="col-lg-2" width="100"><%=i%></td>
                                    <td class="col-lg-2" width="200"><%=username%></td></td>
                                    <td class="col-lg-2" width="250"><%=pwd%></td>
                                    <td class="col-lg-4" width="350"><%=addtime%></td>
                                    <td class="col-lg-2" width="100">
                                        <a href="delete_admin.jsp?id=<%=id%>&tablename=admin" onclick="return confirm('真的要删除？')">删除</a>
                                    </td>
                                </tr>
                                 <%}%>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>