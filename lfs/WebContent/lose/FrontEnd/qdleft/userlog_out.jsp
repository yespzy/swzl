<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <base href="<%=basePath%>">
 <%
	session.removeAttribute("username");
	session.removeAttribute("cx");
	response.sendRedirect("../index/index.jsp");
 %>

