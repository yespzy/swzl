<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<%
	request.setCharacterEncoding("utf-8"); 
	response.setCharacterEncoding("utf-8"); 
%>
  <%
	String mingcheng=request.getParameter("productname");
	String shijian=request.getParameter("losedate");
	String didian=request.getParameter("loseplace");
	String beizhu=request.getParameter("remark");
	String id=request.getParameter("id");
	String sql="update baoshixinxi set mingcheng='"+mingcheng+"',shijian='"+shijian+"',didian='"+didian+"',beizhu='"+beizhu+"' where id= "+id;
	connDbBean.executeUpdate(sql);
	out.print("<script>alert('修改成功!!');location.href='"+request.getHeader("Referer")+"';</script>");
  %>


