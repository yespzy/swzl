<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"> <link rel="stylesheet" href="Notice.css" type="text/css">
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
    <script language="javascript">
        function check(){
            if(document.noticeform.content.value==""){
                alert("请输入内容");
                document.noticeform.content.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <div>
        <div class="notice">
            <div class="row">
                <form name="noticeform" id="noticeform" method="post" action="notice_post.jsp">
                    <table style="margin-top: 1rem">
                        <tr>
                            <td class="col-lg-3 notice_title">
                                编辑内容
                            </td>
                              <%
								  String sql="select * from gonggao";
								  String contdent="";
								  ResultSet RS_result=connDbBean.executeQuery(sql);
								  while(RS_result.next()){
								 	 contdent=RS_result.getString("content");
								  }
							   %>
                            <td class="col-lg-9">
                                <textarea name="content" id="content" cols="30" rows="3"><%=contdent%></textarea>
                            </td>
                        </tr>
                        <tr class="notice_button">
                            <td>
                                <input name="submit" id="submit" type="submit" value="提交" class="col-lg-6" onClick="return check();">
                                <input name="reset" id="reset" type="reset" value="重置" class="col-lg-6">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</body>
</html>