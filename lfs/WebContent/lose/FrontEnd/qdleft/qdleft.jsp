<%@ page language="java"  contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="Utf-8" session="true"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

            <div class="row qdleft_one">
                <table>
                    <tr>
                        <td class="qdleft_title">公告</td>
                    </tr>
                    <tr>
                        <td>
                    <span class="qdleft_content">
                        <marquee border="0" direction="down"  onMouseOut="start()" onMouseOver="stop()" scrollamount="2" scrolldelay=100"> 
                        	<%
								 String sqlxtgg="select * from gonggao";
								 ResultSet RS_resultxtgg=connDbBean.executeQuery(sqlxtgg);
								 while(RS_resultxtgg.next()) {
								 	out.print(RS_resultxtgg.getString("content"));
								 }
							%>
                        </marquee>
                    </span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="clear" style="height: 3vh"></div>
            <div class="row qdleft_one">
                <table>
                    <tr>
                        <td class="qdleft_title">登录</td>
                    </tr>
                    <%if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){ %>
                    <tr>
                        <td>
                        <div class="qdleft_content">
                             <form name="formlog" method="post" action="../qdleft/userlog_post.jsp">
                                 <table>
                                    <tr>
                                        <td>
                                            <label>
                                                账号<span class="glyphicon glyphicon-user"></span>
                                            </label>
                                            <input type="text" name="username" id="username" placeholder="请输入账号">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>
                                                密码<span class="glyphicon glyphicon-lock"></span>
                                            </label>
                                            <input type="password" name="password" id="password" placeholder="请输入密码">
                                        </td>
                                    </tr>
                                     <tr style="display: none">
                                        <td>
                                            <label>
                                               	 权限
                                                <select name="cx" id="cx">
                                                    <option value="普通用户">普通用户</option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="button">
                                                <span style="margin-right: 1vw;">
                                                     <input type="submit" name="submit" value="提交">
                                                </span>
                                                <span>
                                                     <input type="reset" name="reset" value="重置">
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                 </table>
                             </form>
                        </div>
                        </td>
                    </tr>
                    <%}else{%>
                    <tr style="height: 1rem"><td></td></tr>
                    <tr class="qdleft_else">
                        <td>
                            <table>
                                <tr>
                                    <td class="col-lg-2">账号</td>
                                    <td class="col-lg-2"><%=request.getSession().getAttribute("username")%></td>
                                </tr>
                                <tr>
                                    <td class="col-lg-2">角色</td>
                                    <td class="col-lg-3"><%=request.getSession().getAttribute("cx")%></td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <input type="button" name="out" value="退出" onClick="javascript:location.href='../qdleft/userlog_out.jsp';">
                                        <input type="button" name="personal" value="个人后台" onClick="javascript:location.href='http://localhost:8080/lfs/lose/FrontEnd/qdleft/mygo.jsp';">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <%}%>
                </table>
            </div>
 