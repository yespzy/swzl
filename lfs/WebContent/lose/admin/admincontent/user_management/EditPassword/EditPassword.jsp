<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="EditPassword.css" type="text/css">
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
        <div class="editpassword">
            <div class="row">
                <form method="post" name="editpassword" action="editpassword_post.jsp">
                    <table border="0">
                     <%
						  String sql="select * from admin where username='"+request.getSession().getAttribute("username")+"'";
						  String oldpassword="";
						  ResultSet RS_result=connDbBean.executeQuery(sql);
						  while(RS_result.next()){
							 oldpassword=RS_result.getString("pwd");
						  }
					 %>
                        <tr>
                            <td class="col-lg-2">原密码</td>
                            <td class="col-lg-4">
                                <input readonly="readonly" type="text" name="oldpassword" id="oldpassword" value="<%= oldpassword%>">
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">新密码</td>
                            <td class="col-lg-4">
                                <input type="password" name="newpassword" id="newpassword" onkeyup="checkNew()">
                                <span style="color: #cc3300">*</span>
                            </td>
                            <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:2vh;border:none!important;">
					            <span id="newMsg" style="color:red;"></span>
				            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">确认密码</td>
                            <td class="col-lg-4">
                                <input type="password" name="repassword" id="repassword" onkeyup="checkreNew()">
                                <span style="color: #cc3300">*</span>
                            </td>
                             <td class="col-lg-6" style="font-size:1.3vw;padding:0;padding-top:2vh;;border:none!important;">
					            <span id="renewMsg"></span>
					            <span style="color:white;">字母数字下划线,不能是数字开头</span>
				            </td>
                        </tr>
                        <tr class="editpassword_button">
                            <td>
                                <input type="submit" name="submit" value="确定" onClick="return check();">
                                <input type="reset" name="reset" value="重置">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</body>
</html>