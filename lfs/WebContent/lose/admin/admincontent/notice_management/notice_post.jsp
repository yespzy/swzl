<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<%
	request.setCharacterEncoding("utf-8"); 
	response.setCharacterEncoding("utf-8"); 
%>
<%
	String neirong=request.getParameter("content");
	String sql="update gonggao set content='"+neirong+"' ";
	System.out.print(sql);
	connDbBean.executeUpdate(sql);
	out.print("<script>alert('编辑成功!!');history.back(-1);</script>");
%>

