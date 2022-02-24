<%@ page language="java"  contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="Utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
 <base href="<%=basePath%>">
<%
	 String username=new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
	 String password=new String(request.getParameter("password").getBytes("iso-8859-1"),"utf-8");
	 String sql="";
	 String cx= new String(request.getParameter("cx").getBytes("iso-8859-1"),"utf-8");
	 sql="select * from [yonghuzhuce] where yonghuming='"+username+"' and mima='"+password+"'and issh='是'";
	 ResultSet RS_result=connDbBean.executeQuery(sql);
	 if(!RS_result.next()){
		out.print("<script>alert('你输入的用户不存在或密码错误,或帐号未经审核,请重新登录!');window.history.go(-1);</script>");
	}else{
	  	  session.setAttribute("username",username);
		  session.setAttribute("cx",cx);
		  response.sendRedirect("../index/index.jsp");	 
	} 
	RS_result.close();
%>

