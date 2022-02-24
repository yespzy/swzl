<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="AddProduct.css" type="text/css">
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
    <script type="text/javascript" src="popup.js"></script>
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
            if(document.addproductform.productname.value==""){
                alert("请输入物品名称");
                document.addproductform.productname.focus();
                return false;
            }if(document.addproductform.pickdate.value==""){
                alert("请输入时间");
                document.addproductform.pickdate.focus();
                return false;
            }if(document.addproductform.pickplace.value==""){
                alert("请输入地点");
                document.addproductform.pickplace.focus();
                return false;
            }
        }
    </script>
    <script type="text/javascript">
	    function up(tt){
	        var pop=new Popup({ 
	        	contentType:1,isReloadOnClose:false,width:300,height:100
	        });
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","文件上传");
            pop.build();
            pop.show();
	    }
	</script>
</head>
<body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <div>
        <div class="addproduct">
            <div class="row">
                <form name="addproductform" id="addproductform" method="post" action="addproduct_post.jsp">
                    <table>
                        <tr>
                            <td class="col-lg-2">物品名称</td>
                            <td class="col-lg-4">
                                <input type="text" name="productname" id="productname">
                                <span style="color: #cc3300">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">捡到日期</td>
                            <td class="col-lg-4">
                                <input type="date" name="pickdate" id="pickdate">
                                <span style="color: #cc3300">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">捡到地点</td>
                            <td class="col-lg-4">
                                <input type="text" name="pickplace" id="piclplace">
                                <span style="color: #cc3300">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">图片</td>
                            <td class="col-lg-4">
                                <input name="productpicture" id="producepicture" type="text" size="50" value=""/>
                                <input type='button' value="上传" onClick="up('producepicture')" style="width:auto!important"/>
                            </td>
                        </tr>
                        <tr style="height: auto!important;">
                            <td class="col-lg-2">备注</td>
                            <td class="col-lg-4">
                                <input type="text" name="remark" id="remark">
                            </td>
                        </tr>
                        <tr class="addproduct_button">
                            <td style="width:100%">
                                <input type="submit" name="submit" id="submit" value="提交"  onClick="return check();">
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