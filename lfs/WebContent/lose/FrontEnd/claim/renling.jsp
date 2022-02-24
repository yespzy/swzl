<%@ page language="java"  contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
 <%
	if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
		out.print("<script>javascript:alert('对不起，请您先登陆！');history.back();</script>");
	}else{
			 String id=request.getParameter("id");
			 String sql="insert into renling(username,shiwuID) values('"+request.getSession().getAttribute("username")+"',"+id+")";
			 connDbBean.executeUpdate(sql);
			 out.print("<script>alert('操作成功!!');location.href='http://localhost:8080/lfs/lose/FrontEnd/index/index.jsp';</script>");
  	}
 %>
