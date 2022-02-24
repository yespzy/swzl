<%@ page language="java"  pageEncoding="gb2312" import="java.sql.*" %>

<%
request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8"); 
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

  <%
	String mingcheng=request.getParameter("productname");
	String shijian=request.getParameter("pickdate");
	String didian=request.getParameter("pickplace");
	String tupian=request.getParameter("productpicture");
	String beizhu=request.getParameter("remark");
	String sql="insert into shiwuzhaoling(mingcheng,shijian,didian,tupian,beizhu) values('"+mingcheng+"','"+shijian+"','"+didian+"','"+tupian+"','"+beizhu+"') ";
	connDbBean.executeUpdate(sql);
	out.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='"+request.getHeader("Referer")+"';</script>");
  %>
