<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<%
	request.setCharacterEncoding("utf-8"); 
	response.setCharacterEncoding("utf-8"); 
%>

  <%
	String id=request.getParameter("id");
	String sql="update renling set Flag='已认领' where ID="+id+"  update shiwuzhaoling set Flag='已认领' where id=(select shiwuID FROM renling where ID="+id+" )";
	connDbBean.executeUpdate(sql);
	out.print("<script>alert('认领成功!!');location.href='"+request.getHeader("Referer")+"'</script>");
  %>

