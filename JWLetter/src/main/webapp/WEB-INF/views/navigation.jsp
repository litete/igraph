<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/20
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>


</head>
<body>
<div class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target=".navbar-collapse"><span class="sr-only">Toggle navigation</span> <span
                class="icon-bar"></span> <span class="icon-bar"></span> <span
                class="icon-bar"></span></button>
        <a href="index"> <img src="img/deepSearch_logo_s.png"
                              class="navbar-brand"></a><a class="navbar-brand page-scroll"
                                                          href="#page-top"> 智察 - 大数据关系洞察系统</a></div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li><a href="index">举报箱</a></li>
          <li><a id="toGraph" href="#" onclick="graphOnclick()">关联图谱</a></li>
          <li><a href="map">地图</a></li>
            <li><a href="opinions">舆情</a></li>
        </ul>
        <form class="navbar-form" action="/JWLetter/graph">
          <input type="text" class="form-control" style="width: 350px"
                 id="word" name="word" placeholder="${keyword}">
          <button type="submit" class="btn btn-primary" style="width: 100px"  >搜索</button>
        </form>
      </div>
      <!--/.nav-collapse -->
      <div></div>
    </div>
    <!--/.container-fluid -->
  </div>
</div>
<script src="js/jquery.js"></script>
<script src="js/index.js"></script>
</body>
</html>
