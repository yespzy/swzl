<%@page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<%
	request.setCharacterEncoding("utf-8"); 
	response.setCharacterEncoding("utf-8"); 
%>
  <%
     String oldpassword=request.getParameter("oldpassword");
	 String newpassword=request.getParameter("newpassword");
	 ResultSet RS_result=connDbBean.executeQuery("select * from [admin] where username='"+request.getSession().getAttribute("username")+"'");
	 if(!RS_result.next()){
	      out.print("<script>alert('系统故障,请勿继续操作!');window.history.go(-1);</script>");
		}else{
		  String pwd=RS_result.getString("pwd");
	  	  if(pwd.equals(oldpassword)) {
	  	  	String sql="update admin set pwd='"+newpassword+"' where username='"+request.getSession().getAttribute("username")+"'";
	  	  	connDbBean.executeUpdate(sql);
	  	  	out.print("<script>alert('修改成功!!');window.history.go(-1);</script>");
	  	  }else {
	  	  	out.print("<script>alert('对不起,您的原密码不正确,请重试!');window.history.go(-1);</script>");
	  	  }
	  }
	RS_result.close();
  %>
