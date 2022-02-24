<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="Message.css" type="text/css">
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
            if(document.replyform.replycontent.value==""){
                alert("请输入回复内容");
                document.replyform.replycontent.focus();
                return false;
            }
        }
    </script>
</head>
<%String id=request.getParameter("id"); %>
<body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <div>
        <div class="replymessage">
            <div class="row">
                <p>回复留言：</p>
                 <%
					  String sql="select * from leavemessage where id="+id;
					  String huifuneirong="";
					  ResultSet RS_result=connDbBean.executeQuery(sql);
					  while(RS_result.next()){
					  	huifuneirong=RS_result.getString("replymessage");
					  }
				   %>
                <form name="replyform" id="replyform" method="post" action="reply_message_post.jsp?id=<%=id %>">
                    <table style="margin-top: 1rem">
                        <tr>
                            <td class="col-lg-3 replymessage_title">
                                回复内容
                            </td>
                            <td class="col-lg-9">
                                <textarea name="replycontent" id="replycontent" cols="30" rows="3"><%= huifuneirong%></textarea>
                            </td>
                        </tr>
                        <tr class="replymessage_button">
                            <td>
                                <input name="submit" id="submit" type="submit" value="提交" class="col-lg-6" onclick="return check();">
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