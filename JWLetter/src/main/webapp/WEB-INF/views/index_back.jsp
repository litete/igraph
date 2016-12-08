<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="css/sticky-footer-navbar.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/AdminLTE.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<title>中国电信纪律检查委员会举报信件处理系统</title>
</head>

<body>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/index.js"></script>
<!-- Static navbar -->
<div class="navbar navbar-default" role="navigation">
  <div class="container">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <a href="index.jsp"> <img src="img/deepSearch_logo_s.png"  class="navbar-brand"></a><a class="navbar-brand page-scroll" href="#page-top"> 中国电信纪律检查委员会举报信件处理系统</a> </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li><a href="index">举报箱</a></li>
          <li><a id="toGraph" href="graph">关联图谱</a></li>
        </ul>
        <form class="navbar-form" >
          <input type="text" class="form-control" style="width:350px" id="word" name="" placeholder="${keyword}">
          <i type="text" class="btn btn-primary" style="width:100px" onclick="search()" >搜索</i>
        </form>
      </div>
      <!--/.nav-collapse -->
      <div> </div>
    </div>
    <!--/.container-fluid -->
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-md-3">
      <div class="box box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">文件夹</h3>
          <div class="box-tools">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i> </button>
          </div>
        </div>
        <div class="box-body no-padding">
          <ul class="nav nav-pills nav-stacked" id="ul">
            <li id="showMessage" class="active"><a onclick="showMessage()"><i class="fa fa-inbox"></i> 举报箱<span class="label label-primary pull-right">12</span></a></li>
            <li id="showUndo"><a onclick="showUndo()"><i class="fa fa-envelope-o"></i> 未处理信件<span class="label label-warning pull-right">180</span></a></li>
            <li id="showOneLevel"><a onclick="showOneLevel()"><i class="fa fa-file-text-o"></i> 一级信件<span class="label label-warning pull-right">13</span></a></li>
            <li id="showTwoLevel"><a onclick="showTwoLevel()"><i class="fa fa-filter"></i> 二级信件<span class="label label-warning pull-right">65</span></a> </li>
            <li id="showThreeLevel"><a onclick="showThreeLevel()"><i class="fa fa-trash-o"></i> 三级信件<span class="label label-warning pull-right">65</span></a></li>
            <li id="showSearch"><a onclick="showSearch()"><i class="glyphicon glyphicon-search"></i> 搜索结果 <span class="label label-primary pull-right">0</span></a></li>
          </ul>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /. box -->
      <div class="box box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">标签</h3>
          <div class="box-tools">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i> </button>
          </div>
        </div>
        <div class="box-body no-padding">
          <ul class="nav nav-pills nav-stacked">
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> 收受巨额财物 </a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> 伪造证据</a></li>
            <li><a href="#"><i class="fa fa-circle-o text-light-blue"></i> 贪污公款</a></li>
          </ul>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->
    <div class="col-md-9" id="message">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">举报箱</h3>
          <!--              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" class="form-control input-sm" placeholder="Search Mail">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>-->
          <!-- /.box-tools -->
        </div>
        <!-- /.box-header -->
        <div class="box-body no-padding">
          <div class="mailbox-controls">
            <!-- Check all button -->
            <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> </button>
            <div class="btn-group"> </div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>辽宁省大连市委常委、常务副市长曹爱华接受调查</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">一级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>河南省济源市人大原党组副书记、副主任郭茹被调查</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>重庆市九龙坡区人大原党组书记、主任潘平被调查</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>广州南沙经济技术开发区管委会副主任段险峰被双开</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>湖南日报社原党组成员、社务委员刘树林被"双开"</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">二级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>新疆兵团第九师党委常委、副师长张建雄被“双开”</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">二级信件</td>
                </tr>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <div class="box-footer no-padding">
        <div class="mailbox-controls">
          <!-- Check all button -->
          <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> </button>
          <!-- /.btn-group -->
          <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
          <div class="pull-right"> 1-50/200
            <div class="btn-group">
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
            </div>
            <!-- /.btn-group -->
          </div>
          <!-- /.pull-right -->
        </div>
      </div>
    </div>
    <div class="col-md-9" id="undo" style="display:none">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">未处理信件</h3>
          <!--              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" class="form-control input-sm" placeholder="Search Mail">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>-->
          <!-- /.box-tools -->
        </div>
        <!-- /.box-header -->
        <div class="box-body no-padding">
          <div class="mailbox-controls">
            <!-- Check all button -->
            <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> </button>
            <div class="btn-group"> </div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>辽宁省大连市委常委、常务副市长曹爱华接受调查</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">一级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>河南省济源市人大原党组副书记、副主任郭茹被调查</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>重庆市九龙坡区人大原党组书记、主任潘平被调查</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>广州南沙经济技术开发区管委会副主任段险峰被双开</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>湖南日报社原党组成员、社务委员刘树林被"双开"</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">二级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>新疆兵团第九师党委常委、副师长张建雄被“双开”</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">二级信件</td>
                </tr>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <div class="box-footer no-padding">
        <div class="mailbox-controls">
          <!-- Check all button -->
          <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> </button>
          <!-- /.btn-group -->
          <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
          <div class="pull-right"> 1-50/200
            <div class="btn-group">
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
            </div>
            <!-- /.btn-group -->
          </div>
          <!-- /.pull-right -->
        </div>
      </div>
    </div>
    <div class="col-md-9" id="levelone" style="display:none">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">一级信件</h3>
          <!--              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" class="form-control input-sm" placeholder="Search Mail">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>-->
          <!-- /.box-tools -->
        </div>
        <!-- /.box-header -->
        <div class="box-body no-padding">
          <div class="mailbox-controls">
            <!-- Check all button -->
            <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> </button>
            <div class="btn-group"> </div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>辽宁省大连市委常委、常务副市长曹爱华接受调查</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">一级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>河南省济源市人大原党组副书记、副主任郭茹被调查</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>重庆市九龙坡区人大原党组书记、主任潘平被调查</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>广州南沙经济技术开发区管委会副主任段险峰被双开</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>湖南日报社原党组成员、社务委员刘树林被"双开"</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">二级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>新疆兵团第九师党委常委、副师长张建雄被“双开”</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">二级信件</td>
                </tr>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <div class="box-footer no-padding">
        <div class="mailbox-controls">
          <!-- Check all button -->
          <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> </button>
          <!-- /.btn-group -->
          <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
          <div class="pull-right"> 1-50/200
            <div class="btn-group">
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
            </div>
            <!-- /.btn-group -->
          </div>
          <!-- /.pull-right -->
        </div>
      </div>
    </div>
    <div class="col-md-9" id="leveltwo" style="display:none">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">二级信件</h3>
          <!--              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" class="form-control input-sm" placeholder="Search Mail">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>-->
          <!-- /.box-tools -->
        </div>
        <!-- /.box-header -->
        <div class="box-body no-padding">
          <div class="mailbox-controls">
            <!-- Check all button -->
            <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> </button>
            <div class="btn-group"> </div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>辽宁省大连市委常委、常务副市长曹爱华接受调查</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">一级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>河南省济源市人大原党组副书记、副主任郭茹被调查</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>重庆市九龙坡区人大原党组书记、主任潘平被调查</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>广州南沙经济技术开发区管委会副主任段险峰被双开</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>湖南日报社原党组成员、社务委员刘树林被"双开"</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">二级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>新疆兵团第九师党委常委、副师长张建雄被“双开”</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">二级信件</td>
                </tr>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <div class="box-footer no-padding">
        <div class="mailbox-controls">
          <!-- Check all button -->
          <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> </button>
          <!-- /.btn-group -->
          <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
          <div class="pull-right"> 1-50/200
            <div class="btn-group">
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
            </div>
            <!-- /.btn-group -->
          </div>
          <!-- /.pull-right -->
        </div>
      </div>
    </div>
    <div class="col-md-9" id="levelthree" style="display:none">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">三级信件</h3>
          <!--              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" class="form-control input-sm" placeholder="Search Mail">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>-->
          <!-- /.box-tools -->
        </div>
        <!-- /.box-header -->
        <div class="box-body no-padding">
          <div class="mailbox-controls">
            <!-- Check all button -->
            <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> </button>
            <div class="btn-group"> </div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>辽宁省大连市委常委、常务副市长曹爱华接受调查</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">一级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>河南省济源市人大原党组副书记、副主任郭茹被调查</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>重庆市九龙坡区人大原党组书记、主任潘平被调查</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>广州南沙经济技术开发区管委会副主任段险峰被双开</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>湖南日报社原党组成员、社务委员刘树林被"双开"</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">二级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>新疆兵团第九师党委常委、副师长张建雄被“双开”</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">二级信件</td>
                </tr>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <div class="box-footer no-padding">
        <div class="mailbox-controls">
          <!-- Check all button -->
          <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> </button>
          <!-- /.btn-group -->
          <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
          <div class="pull-right"> 1-50/200
            <div class="btn-group">
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
            </div>
            <!-- /.btn-group -->
          </div>
          <!-- /.pull-right -->
        </div>
      </div>
    </div>
    <div class="col-md-9" id="searchresult" style="display:none">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">搜索结果</h3>
          <!--              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" class="form-control input-sm" placeholder="Search Mail">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>-->
          <!-- /.box-tools -->
        </div>
        <!-- /.box-header -->
        <div class="box-body no-padding">
          <div class="mailbox-controls">
            <!-- Check all button -->
            <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> </button>
            <div class="btn-group"> </div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>辽宁省大连市委常委、常务副市长曹爱华接受调查</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">一级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>河南省济源市人大原党组副书记、副主任郭茹被调查</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>执纪审查</b>重庆市九龙坡区人大原党组书记、主任潘平被调查</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>广州南沙经济技术开发区管委会副主任段险峰被双开</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">三级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>湖南日报社原党组成员、社务委员刘树林被"双开"</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">二级信件</td>
                </tr>
                <tr>
                  <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                      <input type="checkbox" style="position: absolute; opacity: 0;">
                      <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">举报人XX</a></td>
                  <td class="mailbox-subject"><b>党纪处分</b>新疆兵团第九师党委常委、副师长张建雄被“双开”</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">二级信件</td>
                </tr>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <div class="box-footer no-padding">
        <div class="mailbox-controls">
          <!-- Check all button -->
          <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i> </button>
          <!-- /.btn-group -->
          <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
          <div class="pull-right"> 1-50/200
            <div class="btn-group">
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
            </div>
            <!-- /.btn-group -->
          </div>
          <!-- /.pull-right -->
        </div>
      </div>
    </div>
    <!-- /. box -->
  </div>
  <!-- /.col -->
  <div class="col-md-offset-3" name="letter_contents">
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">举报信正文</h3>
        <div class="box-tools pull-right"> <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a> <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a> </div>
      </div>
      <!-- /.box-header -->
      <div class="box-body no-padding">
        <div class="mailbox-read-info">
          <h3>辽宁省大连市委常委、常务副市长曹爱华接受调查</h3>
          <h5>来源：中央纪委监察部网站 <span class="mailbox-read-time pull-right">2016-09-02 17:05</span></h5>
        </div>
        <!-- /.mailbox-read-info -->
        <div class="mailbox-controls with-border text-center">
          <div class="btn-group">
            <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="Delete"> <i class="fa fa-trash-o"></i></button>
            <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="Reply"> <i class="fa fa-reply"></i></button>
            <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="Forward"> <i class="fa fa-share"></i></button>
          </div>
          <!-- /.btn-group -->
          <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" title="" data-original-title="Print"> <i class="fa fa-print"></i></button>
        </div>
        <!-- /.mailbox-controls -->
        <div class="mailbox-read-message">
          <p>据辽宁省纪委消息：经辽宁省委批准，辽宁省大连市委常委、常务副市长曹爱华涉嫌严重违纪，目前正接受组织调查。（辽宁省纪委）</p>
          <p>曹爱华简历</p>
          <p>曹爱华，女，汉族，1968年1月出生，祖籍辽宁庄河，1990年8月参加工作，1992年7月加入中国共产党，在职硕士研究生学历，现任中共大连市委常委、大连市人民政府常务副市长。
            
            1995年8月—1999年3月，任共青团营口市委副书记、党组成员；
            
            1999年3月—2000年11月，任共青团营口市委书记、党组书记；
            
            2000年11月—2002年10月，任中共营口市委常委、宣传部长；
            
            2002年10月—2007年12月，任共青团辽宁省委副书记、党组副书记；
            
            （于2003年8月至12月，到文化部挂职，任文化产业司副司长）；
            
            2007年12月—2010年8月，任共青团辽宁省委书记、党组书记；
            
            2010年8月—2012年12月，任中共大连市委常委、大连市人民政府副市长；
            
            2013年1月至今，任中共大连市委常委、大连市人民政府常务副市长。（简历摘自大连市人民政府网站）</p>
        </div>
        <!-- /.mailbox-read-message -->
      </div>
      <!-- /.box-body -->
      <div class="box-footer">
        <ul class="mailbox-attachments clearfix">
          <li> <span class="mailbox-attachment-icon"><i class="fa fa-file-pdf-o"></i></span>
            <div class="mailbox-attachment-info"> <a href="#" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> 举报信扫描件.pdf</a> <span class="mailbox-attachment-size"> 1,245 KB <a href="#" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a> </span> </div>
          </li>
        </ul>
      </div>
      <!-- /.box-footer -->
      <div class="box-footer">
        <div class="pull-right">
          <button type="button" class="btn btn-default"><i class="fa fa-reply"></i> 上一封</button>
          <button type="button" class="btn btn-default"><i class="fa fa-share"></i> 下一封</button>
        </div>
        <button type="button" class="btn btn-default"><i class="fa fa-print"></i> 打印</button>
      </div>
      <!-- /.box-footer -->
    </div>
    <!-- /. box -->
  </div>
</div>
<div id="footer">
  <div class="container">
    <p class="text-muted" style="float:right">关于我们</p>
  </div>
</div>

</body>

</html>
