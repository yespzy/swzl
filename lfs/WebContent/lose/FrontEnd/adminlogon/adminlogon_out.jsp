<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
 <%
	session.removeAttribute("username");
    session.removeAttribute("password");
	session.removeAttribute("cx");
	response.sendRedirect("http://localhost:8080/lfs/lose/FrontEnd/index/index.jsp");
 %>
