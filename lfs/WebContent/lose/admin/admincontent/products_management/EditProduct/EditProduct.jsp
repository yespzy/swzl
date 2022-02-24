<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="EditProduct.css" type="text/css">
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
            if(document.editproductform.productname.value==""){
                alert("请输入名称");
                document.editproductform.productname.focus();
                return false;
            }if(document.editproductform.pickdate.value==""){
                alert("请输入时间");
                document.editproductform.pickdate.focus();
                return false;
            }if(document.editproductform.pickplace.value==""){
                alert("请输入地点");
                document.editproductform.pickplace.focus();
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
<% String id=request.getParameter("id"); %>
<body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
    <div>
        <div class="editproduct">
            <div class="row">
                <form name="editproductform" id="editproductform" method="post" action="editproduct_post.jsp?id=<%=id %>">
                     <%
						  String sql="select * from shiwuzhaoling where id="+id;
						  String mingcheng="";
						  String shijian="";
						  String didian="";
						  String tupian="";
						  String beizhu="";
						  ResultSet RS_result=connDbBean.executeQuery(sql);
						  while(RS_result.next()){
							  mingcheng=RS_result.getString("mingcheng");
							  didian=RS_result.getString("didian");
							  shijian=RS_result.getString("shijian");
							  tupian=RS_result.getString("tupian");
							  beizhu=RS_result.getString("beizhu");
						  }
					 %>
                    <table>
                        <tr>
                            <td class="col-lg-2">物品名称</td>
                            <td class="col-lg-10">
                                <input type="text" name="productname" id="productname" value="<%= mingcheng%>">
                                <span style="color: #cc3300">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">捡到日期</td>
                            <td class="col-lg-10">
                                <input type="date" name="pickdate" id="pickdate" value="<%= shijian%>">
                                <span style="color: #cc3300">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">捡到地点</td>
                            <td class="col-lg-10">
                                <input type="text" name="pickplace" id="piclplace" value="<%= didian%>">
                                <span style="color: #cc3300">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-2">图片</td>
                            <td class="col-lg-10">
                                <input name="productpicture" id="producepicture" type="text" value="<%= tupian%>"/>
                                <input type='button' value="上传" onClick="up('producepicture')" style="width:auto!important"/>
                            </td>
                        </tr>
                        <tr style="height: auto!important;">
                            <td class="col-lg-2">备注</td>
                            <td class="col-lg-10">
                                <input type="text" name="remark" id="remark" value="<%=beizhu%>">
                            </td>
                        </tr>
                        <tr class="editproduct_button" >
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