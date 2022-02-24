<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="AddPersonalLose.css" type="text/css">
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
            if(document.addloseform.productname.value==""){
                alert("请输入物品名称");
                document.addloseform.productname.focus();
                return false;
            }if(document.addloseform.losedate.value==""){
                alert("请输入丢失时间");
                document.addloseform.losedate.focus();
                return false;
            }if(document.addloseform.loseplace.value==""){
                alert("请输入丢失地点");
                document.addloseform.loseplace.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <div>
        <div class="addpersonallose">
            <div class="row">
                <p>添加物品报失信息</p>
                <form name="addloseform" id="addloseform" method="post" action="addlose_post.jsp">
                    <table>
                        <tr>
                            <td class="col-lg-4">物品名称</td>
                            <td class="col-lg-8">
                                <input name="productname" id="productname" type="text">
                                <span style="color: #cc3300">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-4">丢失日期</td>
                            <td class="col-lg-8">
                                <input name="losedate" id="losedate" type="date">
                                <span style="color: #cc3300">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-4">丢失地点</td>
                            <td class="col-lg-8">
                                <input name="loseplace" id="loseplace" type="text">
                                <span style="color: #cc3300">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-4">备注</td>
                            <td class="col-lg-8">
                                <input name="remark" id="remark" type="text">
                            </td>
                        </tr>
                        <tr class="addpersonallose_button">
                            <td style="width:100%;">
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