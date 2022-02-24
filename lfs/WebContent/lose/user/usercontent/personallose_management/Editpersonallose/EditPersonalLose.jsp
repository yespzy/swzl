<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="EditPersonalLose.css" type="text/css">
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
        function check() {
            if(document.editpersonalform.productname.value==""){
                alert("请输入物品名称");
                document.editpersonalform.productname.focus();
                return false;
            }if(document.editpersonalform.losedate.value==""){
                alert("请输入丢失时间");
                document.editpersonalform.losedate.focus();
                return false;
            }if(document.editpersonalform.loseplace.value==""){
                alert("请输入丢失地点");
                document.editpersonalform.loseplace.focus();
                return false;
            }
        }
    </script>
</head>
<%String id=request.getParameter("id");%>
<body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <div>
        <div class="editpersonallose">
            <div class="row">
                <p>添加物品报失信息</p>
                <%
				  String sql="select * from baoshixinxi where id="+id;
				  String mingcheng="";
				  String shijian="";
				  String didian="";
				  String beizhu="";
				  ResultSet RS_result=connDbBean.executeQuery(sql);
				  while(RS_result.next()){
					  mingcheng=RS_result.getString("mingcheng");
					  didian=RS_result.getString("didian");
					  shijian=RS_result.getString("shijian");
					  beizhu=RS_result.getString("beizhu");
				  }
			    %>
                <form name="editpersonalform" id="editpersonalform" method="post" action="updatelose_post.jsp?id=<%=id %>">
                    <table>
                        <tr>
                            <td class="col-lg-4">物品名称</td>
                            <td class="col-lg-8">
                                <input name="productname" id="productname" type="text" value="<%= mingcheng%>">
                                <span style="color: #cc3300">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-4">丢失日期</td>
                            <td class="col-lg-8">
                                <input name="losedate" id="losedate" type="date" value="<%= shijian%>">
                                <span style="color: #cc3300">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-4">丢失地点</td>
                            <td class="col-lg-8">
                                <input name="loseplace" id="loseplace" type="text" value="<%= didian%>">
                                <span style="color: #cc3300">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-4">备注</td>
                            <td class="col-lg-8">
                                <input name="remark" id="remark" type="text" value="<%=beizhu%>">
                            </td>
                        </tr>
                        <tr class="editpersonallose_button">
                            <td style="width:100%">
                                <input type="submit" name="submit" id="submit" value="提交" onClick="return check();">
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