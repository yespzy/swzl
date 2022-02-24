<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<%
	request.setCharacterEncoding("utf-8"); 
	response.setCharacterEncoding("utf-8"); 
%>
  <%
	 String username=request.getParameter("username");
	 String pwd=request.getParameter("password");
	 ResultSet RS_result=connDbBean.executeQuery("select * from [admin] where username='"+username+"'");
	 if(RS_result.next()){
		out.print("<script>alert('该用户名已经存在,请换其他用户名!');window.history.go(-1);</script>");
	  }else{
  	  	String sql="insert into admin(username,pwd) values('"+username+"','"+pwd+"')";
  	  	connDbBean.executeUpdate(sql);
  	  	out.print("<script>alert('添加成功!!');location.href='EditAdmin.jsp';</script>");
	  }
	 RS_result.close();
  %>