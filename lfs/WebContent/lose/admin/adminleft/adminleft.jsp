<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="adminleft.css" type="text/css">
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
                                        <span onclick="showadminleftmenu(1)">用户信息管理</span>
                                    </td>
                                </tr>
                                <tr class="col-lg-12">
                                    <td>
                                        <table id="adminleftmenu1">
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../admincontent/user_management/EditPassword/EditPassword.jsp" target="adminleftcontent">修改密码</a>
                                                </td>
                                            </tr>
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../admincontent/user_management/EditAdmin/EditAdmin.jsp"  target="adminleftcontent">管理员用户管理</a>
                                                </td>
                                            </tr>
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../admincontent/user_management/EditUser/EditUser.jsp"  target="adminleftcontent">注册用户管理</a>
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
                                        <span onclick="showadminleftmenu(2)">物品招领管理</span>
                                    </td>
                                </tr>
                                <tr class="col-lg-12">
                                    <td>
                                        <table id="adminleftmenu2">
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../admincontent/products_management/AddProduct/AddProduct.jsp"  target="adminleftcontent">物品招领添加</a>
                                                </td>
                                            </tr>
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../admincontent/products_management/ProductManange/ProductList.jsp"  target="adminleftcontent">物品招领管理</a>
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
                                        <span onclick="showadminleftmenu(3)">失物认领管理</span>
                                    </td>
                                </tr>
                                <tr class="col-lg-12">
                                    <td>
                                        <table id="adminleftmenu3">
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../admincontent/lostfound_management/Unclaimed/Unclaimed.jsp"  target="adminleftcontent">未认领失物管理</a>
                                                </td>
                                            </tr>
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../admincontent/lostfound_management/Claimed/Claimed.jsp"  target="adminleftcontent">已认领失物查询</a>
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
                                        <span onclick="showadminleftmenu(4)">留言管理</span>
                                    </td>
                                </tr>
                                <tr class="col-lg-12">
                                    <td>
                                        <table id="adminleftmenu4">
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../admincontent/message_management/Message.jsp"  target="adminleftcontent">留言管理</a>
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
                                        <span onclick="showadminleftmenu(5)">公告管理</span>
                                    </td>
                                </tr>
                                <tr class="col-lg-12">
                                    <td>
                                        <table id="adminleftmenu5">
                                            <tr class="admin_left_content col-lg-12">
                                                <td>
                                                    <img src="adminleft_titlecontent_bg.png" width="10" height="10">
                                                    <a href="../admincontent/notice_management/Notice.jsp"  target="adminleftcontent">公告管理</a>
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