<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

  <%
	String id=request.getParameter("id");
	String tablename=request.getParameter("tablename");
	String sql="delete from "+tablename+" where id="+id+"";
	connDbBean.executeUpdate(sql);
	out.print("<script>alert('删除成功!!');location.href='"+request.getHeader("Referer")+"';</script>");
  %>

