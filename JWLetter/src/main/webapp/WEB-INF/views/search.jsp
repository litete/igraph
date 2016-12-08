<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="css/sticky-footer-navbar.css" type="text/css" rel="stylesheet">  
     <script src="js/bootstrap.min.js"></script>  
     <script type="text/javascript" src="js/echarts.min.js"></script>
     <script type="text/javascript" src="js/echarts.js" charset="utf-8"></script>
   
	<title>深度搜索</title>

</head>
<body>
 <!-- Static navbar -->
  <div class="navbar navbar-default" role="navigation">
      <div class="container">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
           <a href="index.jsp"> <img src="img/deepSearch_logo_s.png"  class="navbar-brand"></a>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="search.jsp">搜索</a></li>
              <li><a href="knowledge.jsp">知识</a></li>
              <li><a href="topic.jsp">头条</a></li>
              <li><a href="marketing.jsp">营销</a></li>

            </ul>
        <form class="navbar-form" action="/vSearch/search">
		   <input type="text" class="form-control" style="width:420px" id="word" name="word" placeholder="${keyword}"> <button type="submit" class="btn btn-primary" style="width:100px" >搜索</button>
	 </form>
		 
          </div><!--/.nav-collapse -->
          <div>
         
          </div>
        </div><!--/.container-fluid -->
      </div>
    </div>

	<div class="col-lg-8" >
	     <div id="main" style="width: 100%;height:300px;"></div>
	</div>
    
    <div id="content_right" class="cr-content col-lg-4" style="width:32%;margin-top:0%;" >
	    
	    <div class="row" style="width:100%"  style="position:relative;">
	        <div class="text-center">      
			     <div class="col-lg-9 text-center" >
			        <h4 class="section-heading">相关公众号</h4>
			        <table class="table table-hover">
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">中国电信</a></td>
			          </tr>
			        </table>
			    </div>
	        </div>
        </div>	 	 
      </div>

 <div id="footer">
      <div class="container">
        <p class="text-muted" style="float:right">数据合作 | 关于我们</p>
      </div>
    </div>
 </body>

