<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

     <div class="row">
         <!--设置列排序，只在lg屏幕下才会有效果，如果push或者pull的列数没有计算好，那么有可能造成重叠-->
         <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 top_one top_logo">
             <img src="../qdtop/images/logo.png" alt="">
         </div>
         <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12 top_title top_one">
             <a>
                 <h1>校园失物招领系统</h1>
             </a>
         </div>

     </div>
     <div class="clear" style="margin-top: 4px"></div>
     <div id="myCarousel" class="carousel slide">
         <ol class="carousel-indicators">
             <li data-target="#myCarousel" data-slide-to="0" class="active"> </li>
             <li data-target="#myCarousel" data-slide-to="1"> </li>
             <li data-target="#myCarousel" data-slide-to="2"> </li>
         </ol>
         <div class="carousel-inner">
             <div class="item active">
                 <img src="../qdtop/images/b1.jpg"/>
             </div>
             <div class="item">
                 <img src="../qdtop/images/b2.jpg"/>
             </div>
             <div class="item">
                 <img src="../qdtop/images/b3.jpg"/>
             </div>

         </div>

         <a href="#myCarousel" data-slide="prev" class="carousel-control left">
             <span class="glyphicon glyphicon-chevron-left"> </span>
         </a>
         <a href="#myCarousel" data-slide="next" class="carousel-control right">
             <span class="glyphicon glyphicon-chevron-right"> </span>
         </a>
         <script type="text/javascript">
             //自动播放
             $("#myCarousel").carousel({
                 interval :2000,
             });
         </script>
     </div>
     <div class="row">
         <table>
             <tr>
                 <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="border-left: #FFFFFF 1px solid"><a href="../index/index.jsp">首页</a></td>
                 <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><a href="../userlogon/userlogon.jsp">用户注册</a></td>
                 <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><a href="../lose/lose.jsp">物品报失</a></td>
                 <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><a href="../claim/claim.jsp">物品认领</a></td>
                 <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><a href="../leave/leave.jsp">留言板</a></td>
                 <td class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><a href="../adminlogon/adminlogon.jsp">后台管理</a></td>
             </tr>
         </table>
     </div>

