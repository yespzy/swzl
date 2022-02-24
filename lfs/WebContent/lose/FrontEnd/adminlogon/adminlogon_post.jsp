<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
  <%
	 String username=request.getParameter("username");
	 String password=request.getParameter("password");
	 String sql="";
	 sql="select * from [admin] where username='"+username+"' and pwd='"+password+"'";
	 ResultSet RS_result=connDbBean.executeQuery(sql);
	 if(!RS_result.next()){
		out.print("<script>alert('你输入的用户不存在或密码错误,请重新登录!');window.history.go(-1);</script>");
	 }
	else{
	  	  session.setAttribute("username",username);
	  	  session.setAttribute("password",password);
		  session.setAttribute("cx","管理员");
		  response.sendRedirect("../../admin/adminindex/adminindex.jsp");	 
		} 
	RS_result.close();
  %>