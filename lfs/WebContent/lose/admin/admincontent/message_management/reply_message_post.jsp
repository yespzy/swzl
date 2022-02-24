<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<%
	request.setCharacterEncoding("utf-8"); 
	response.setCharacterEncoding("utf-8"); 
%>
  <%
	String huifuneirong=request.getParameter("replycontent");
	String id=request.getParameter("id");
	String sql="update leavemessage set replymessage='"+huifuneirong+"' where id= "+id;
	connDbBean.executeUpdate(sql);
	out.print("<script>alert('回复成功!!');window.history.go(-1);</script>");
  %>


