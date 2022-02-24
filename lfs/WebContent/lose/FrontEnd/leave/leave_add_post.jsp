<%@ page language="java"  import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8"); 
	response.setCharacterEncoding("utf-8"); 
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
  <%
	if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
		out.print("<script>javascript:alert('对不起，请您先登陆！');history.back();</script>");
	}
	else{
	    String nickname=request.getParameter("nickname");
		String imagename=request.getParameter("imagename");
		String QQ=request.getParameter("QQ");
		String Email=request.getParameter("Email");
		String phone=request.getParameter("phone");
		String neirong=request.getParameter("content");
	    String sql="insert into leavemessage(nickname,imagename,QQ,Email,phone,neirong) values('"+nickname+"','"+imagename+"','"+QQ+"','"+Email+"','"+phone+"','"+neirong+"') ";
	    connDbBean.executeUpdate(sql);
	  	out.print("<script>alert('添加成功!!');location.href='http://localhost:8080/lfs/lose/FrontEnd/leave/leave.jsp';</script>");
	}
 %>

