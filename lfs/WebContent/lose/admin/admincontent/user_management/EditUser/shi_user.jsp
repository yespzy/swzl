<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

  <%
	String yuan=new String(request.getParameter("yuan").getBytes("iso-8859-1"),"utf-8");
	String id=request.getParameter("id");
	String tablename=request.getParameter("tablename");
	String sql="";
	if(yuan.equals("是")){
		sql="update "+tablename+" set issh='否' where id="+id;
	}else{
		sql="update "+tablename+" set issh='是' where id="+id;
	}
	connDbBean.executeUpdate(sql);
	out.print("<script>alert('操作成功!!');location.href='"+request.getHeader("Referer")+"';</script>");
  %>

