<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<%
	request.setCharacterEncoding("utf-8"); 
	response.setCharacterEncoding("utf-8"); 
%>
  <%
	String yonghuming=request.getParameter("username");
	String mima=request.getParameter("password");
	String xingming=request.getParameter("name");
	String xingbie=request.getParameter("sex");
	String chushengnianyue=request.getParameter("birthday");
	String QQ=request.getParameter("QQ");
	String youxiang=request.getParameter("Email");
	String dianhua=request.getParameter("phone");
	String xueyuan=request.getParameter("academy");
	String zhuanye=request.getParameter("major");
	String banji=request.getParameter("class");
	
	String sql="update yonghuzhuce set yonghuming='"+yonghuming+"',mima='"+mima+"',xingming='"+xingming+"',xingbie='"+xingbie+"',chushengnianyue='"+chushengnianyue+"',QQ='"+QQ+"',youxiang='"+youxiang+"',dianhua='"+dianhua+"',xueyuan='"+xueyuan+"',zhuanye='"+zhuanye+"',banji='"+banji+"' where yonghuming= '"+request.getSession().getAttribute("username")+"'";
	connDbBean.executeUpdate(sql);
	out.print("<script>alert('修改成功!!');location.href='"+request.getHeader("Referer")+"';</script>");
  %>


