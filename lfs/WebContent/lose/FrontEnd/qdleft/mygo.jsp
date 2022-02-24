<%@ page language="java"  contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8" session="true"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
  <%
	if (request.getSession().getAttribute("cx").equals("普通用户")){
		response.sendRedirect("http://localhost:8080/lfs/lose/user/userindex/userindex.jsp");
	}if ( request.getSession().getAttribute("cx").equals("管理员")){
		response.sendRedirect("http://localhost:8080/lfs/lose/admin/adminindex/adminindex.jsp");
	}
  %>
