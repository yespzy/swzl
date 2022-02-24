<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>广东石油化工学院失物招领系统</title>
</head>
    <frameset rows="83,*" frameborder="0" border="0" framespacing="0">
        <frame name="usertopFrame" src="../usertop/usertop.jsp" noresize="noresize" frameborder="0"  marginwidth="0" marginheight="0" scrolling="no">
        <frameset rows="*" cols="20%,80%" id="userframe">
            <frame src="../userleft/userleft.jsp" name="adminleftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto">
            <frame src="userwelcome.jsp" name="userleftcontent" frameborder="0" scrolling="yes">
        </frameset>
        <noframes>
           <body></body>
        </noframes>
    </frameset>
</html>