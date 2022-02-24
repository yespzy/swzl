<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="userleft.css" type="text/css">
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
    <script language=JavaScript>
        function showadminleftmenu(sid){
            whichEl = eval("adminleftmenu" + sid);
            if (whichEl.style.display == "none"){
                eval("adminleftmenu" + sid + ".style.display=\"\";");
            }else{
                eval("adminleftmenu" + sid + ".style.display=\"none\";");
            }
        }
    </script>
</head>
<body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <div>
        <div class="adminleft">
            <div class="row">
                <table>
                    <tr style="display: line-block;background-color: #FFFFFF;">
                        <td class="col-lg-12">
                            <table>
                                <tr>
                                    <td class="col-lg-12 admin_left_title">
                                        <img src="adminleft_xinxin.png">
                                        <span onclick="showadminleftmenu(1)">个人管理</span>
                                    </td>
                                </tr>
                                <tr class="col-lg-12">
                                    <td>
                                        <table id="adminleftmenu1">
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../usercontent/personality_management/personal.jsp" target="userleftcontent">个人资料管理</a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="display: line-block;background-color: #FFFFFF;">
                        <td class="col-lg-12">
                            <table>
                                <tr>
                                    <td class="col-lg-12 admin_left_title">
                                        <img src="adminleft_xinxin.png">
                                        <span onclick="showadminleftmenu(2)">物品报失管理</span>
                                    </td>
                                </tr>
                                <tr class="col-lg-12">
                                    <td>
                                        <table id="adminleftmenu2">
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../usercontent/personallose_management/Addpersonallose/AddPersonalLose.jsp" target="userleftcontent">物品报失添加</a>
                                                </td>
                                            </tr>
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../usercontent/personallose_management/PersonalLoseList/PersonalLoseList.jsp" target="userleftcontent">物品报失管理</a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="display: line-block;background-color: #FFFFFF;">
                        <td class="col-lg-12">
                            <table>
                                <tr>
                                    <td class="col-lg-12 admin_left_title">
                                        <img src="adminleft_xinxin.png">
                                        <span onclick="showadminleftmenu(3)">我的认领管理</span>
                                    </td>
                                </tr>
                                <tr class="col-lg-12">
                                    <td>
                                        <table id="adminleftmenu3">
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../usercontent/MyRecruitment_manegement/MyRecruitment.jsp" target="userleftcontent">我的认领信息</a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>