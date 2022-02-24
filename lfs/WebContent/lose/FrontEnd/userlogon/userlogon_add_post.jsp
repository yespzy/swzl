<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("UTF-8"); 
	response.setCharacterEncoding("UTF-8"); 
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<base href="<%=basePath%>">

<%
	String username=request.getParameter("Username");
	String password=request.getParameter("Password");
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String birthday=request.getParameter("birthday");
	String QQ=request.getParameter("QQ");
	String Email=request.getParameter("Email");
	String phone=request.getParameter("phone");
	String academy=request.getParameter("academy");
	String major=request.getParameter("major");
	String classes=request.getParameter("classes");
	ResultSet RS_result=connDbBean.executeQuery("select * from [yonghuzhuce] where yonghuming='"+username+"'");
	 if(RS_result.next()){
		 out.print("<script>alert('该用户名已经存在,请换其他名称的用户名!');window.history.go(-1);</script>");
	  } else {
		  String sql="insert into yonghuzhuce(yonghuming,mima,xingming,xingbie,chushengnianyue,QQ,youxiang,dianhua,xueyuan,zhuanye,banji) values('"+username+"','"+password+"','"+name+"','"+sex+"','"+birthday+"','"+QQ+"','"+Email+"','"+phone+"','"+academy+"','"+major+"','"+classes+"') ";
		  connDbBean.executeUpdate(sql);
	  	  out.print("<script>alert('注册成功，请待管理员审核后方可登陆！');location.href='http://localhost:8080/lfs/lose/FrontEnd/index/index.jsp';</script>");
		}
	RS_result.close();
 %>