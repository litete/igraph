<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="css/sticky-footer-navbar.css" type="text/css"
	rel="stylesheet">
<link rel="stylesheet" href="css/AdminLTE.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<title>智察 - 大数据关系洞察系统</title>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/echarts.js" charset="utf-8"></script>
<script src="js/macarons.js"></script>
<script src="js/dist/theme/blue.js"></script>
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
        <button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> </button>
        <a href="index"> <img src="img/deepSearch_logo_s.png"
						class="navbar-brand"></a><a class="navbar-brand page-scroll"
						href="#page-top">智察 - 大数据关系洞察系统</a> </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li><a href="index">举报箱</a></li>
          <li><a id="toGraph" href="graph">关联图谱</a></li>
        </ul>
        <form class="navbar-form">
          <input type="text" class="form-control" style="width: 350px"
							id="word" name="" placeholder="${keyword}">
          <div
							type="text" class="btn btn-primary" style="width: 100px"
							onclick="search()">搜索</div>
        </form>
      </div>
      <!--/.nav-collapse -->
      <div></div>
    </div>
    <!--/.container-fluid -->
  </div>
</div>
<div class="container" style="padding-top:10px">
  <div class="row">
    <div class="col-md-3">
      <div class="box box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">文件夹</h3>
          <div class="box-tools">
            <button type="button" class="btn btn-box-tool"
								data-widget="collapse"> <i class="fa fa-minus"></i> </button>
          </div>
        </div>
        <div class="box-body no-padding">
          <ul class="nav nav-pills nav-stacked" id="ul">
            <li id="showMessage" class="active"><a
								onclick="showMessage()"><i class="fa fa-inbox"></i> 举报箱<span
									class="label label-primary pull-right"></span></a></li>
            <li id="showUndo"><a onClick="showUndo()"><i
									class="fa fa-envelope-o"></i> 未处理信件<span
									class="label label-warning pull-right"></span></a></li>
            <li id="showOneLevel"><a onClick="showOneLevel()"><i
									class="fa fa-file-text-o"></i> 一级信件<span
									class="label label-warning pull-right"></span></a></li>
            <li id="showTwoLevel"><a onClick="showTwoLevel()"><i
									class="fa fa-filter"></i> 二级信件<span
									class="label label-warning pull-right"></span></a></li>
            <li id="showThreeLevel"><a onClick="showThreeLevel()"><i
									class="fa fa-trash-o"></i> 三级信件<span
									class="label label-warning pull-right"></span></a></li>
            <li id="showSearch"><a onClick="showSearch()"><i
									class="glyphicon glyphicon-search"></i> 搜索结果 <span
									class="label label-primary pull-right">0</span></a></li>
          </ul>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /. box -->
      <div class="box box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">标签</h3>
          <div class="box-tools">
            <button type="button" class="btn btn-box-tool"
								data-widget="collapse"> <i class="fa fa-minus"></i> </button>
          </div>
        </div>
        <div class="box-body no-padding" >
          <ul class="nav nav-pills nav-stacked" id="tag">
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
            <button type="button"
								class="btn btn-default btn-sm checkbox-toggle"> <i class="fa fa-square-o"></i> </button>
            <div class="btn-group"></div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-refresh"></i> </button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-left"></i> </button>
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-right"></i> </button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <ul class="pagination pull-right">
      </ul>
    </div>
    <div class="col-md-9" id="undo" style="display: none">
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
            <button type="button"
								class="btn btn-default btn-sm checkbox-toggle"> <i class="fa fa-square-o"></i> </button>
            <div class="btn-group"></div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-refresh"></i> </button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-left"></i> </button>
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-right"></i> </button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <ul class="pagination pull-right">
        <li><a href="#">&laquo;</a></li>
        <li><a href="#" onClick="page(this)">1</a></li>
        <li><a href="#" onClick="page(this)">2</a></li>
        <li><a href="#" onClick="page(this)">3</a></li>
        <li><a href="#" onClick="page(this)">4</a></li>
        <li><a href="#" onClick="page(this)">5</a></li>
        <li><a href="#">&raquo;</a></li>
      </ul>
    </div>
    <div class="col-md-9" id="levelone" style="display: none">
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
            <button type="button"
								class="btn btn-default btn-sm checkbox-toggle"> <i class="fa fa-square-o"></i> </button>
            <div class="btn-group"></div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-refresh"></i> </button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-left"></i> </button>
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-right"></i> </button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <ul class="pagination pull-right">
        <li><a href="#">&laquo;</a></li>
        <li><a href="#" onClick="page(this)">1</a></li>
        <li><a href="#" onClick="page(this)">2</a></li>
        <li><a href="#" onClick="page(this)">3</a></li>
        <li><a href="#" onClick="page(this)">4</a></li>
        <li><a href="#" onClick="page(this)">5</a></li>
        <li><a href="#">&raquo;</a></li>
      </ul>
    </div>
    <div class="col-md-9" id="leveltwo" style="display: none">
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
            <button type="button"
								class="btn btn-default btn-sm checkbox-toggle"> <i class="fa fa-square-o"></i> </button>
            <div class="btn-group"></div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-refresh"></i> </button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-left"></i> </button>
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-right"></i> </button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <ul class="pagination pull-right">
        <li><a href="#">&laquo;</a></li>
        <li><a href="#" onClick="page(this)">1</a></li>
        <li><a href="#" onClick="page(this)">2</a></li>
        <li><a href="#" onClick="page(this)">3</a></li>
        <li><a href="#" onClick="page(this)">4</a></li>
        <li><a href="#" onClick="page(this)">5</a></li>
        <li><a href="#">&raquo;</a></li>
      </ul>
    </div>
    <div class="col-md-9" id="levelthree" style="display: none">
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
            <button type="button"
								class="btn btn-default btn-sm checkbox-toggle"> <i class="fa fa-square-o"></i> </button>
            <div class="btn-group"></div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-refresh"></i> </button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-left"></i> </button>
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-right"></i> </button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <ul class="pagination pull-right">
        <li><a href="#">&laquo;</a></li>
        <li><a href="#" onClick="page(this)">1</a></li>
        <li><a href="#" onClick="page(this)">2</a></li>
        <li><a href="#" onClick="page(this)">3</a></li>
        <li><a href="#" onClick="page(this)">4</a></li>
        <li><a href="#" onClick="page(this)">5</a></li>
        <li><a href="#">&raquo;</a></li>
      </ul>
    </div>
    <div class="col-md-9" id="tagBox" style="display: none">
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
            <button type="button"
								class="btn btn-default btn-sm checkbox-toggle"> <i class="fa fa-square-o"></i> </button>
            <div class="btn-group"></div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-refresh"></i> </button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-left"></i> </button>
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-right"></i> </button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <ul class="pagination pull-right">
        <li><a href="#">&laquo;</a></li>
        <li><a href="#" onClick="page(this)">1</a></li>
        <li><a href="#" onClick="page(this)">2</a></li>
        <li><a href="#" onClick="page(this)">3</a></li>
        <li><a href="#" onClick="page(this)">4</a></li>
        <li><a href="#" onClick="page(this)">5</a></li>
        <li><a href="#">&raquo;</a></li>
      </ul>
    </div>
    <div class="col-md-9" id="searchresult" style="display: none">
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
            <button type="button"
								class="btn btn-default btn-sm checkbox-toggle"> <i class="fa fa-square-o"></i> </button>
            <div class="btn-group"></div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-refresh"></i> </button>
            <div class="pull-right"> 1-50/200
              <div class="btn-group">
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-left"></i> </button>
                <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-chevron-right"></i> </button>
              </div>
              <!-- /.btn-group -->
            </div>
            <!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
              </tbody>
            </table>
            <!-- /.table -->
          </div>
        </div>
        <!-- /.mail-box-messages -->
      </div>
      <!-- /.box-body -->
      <ul class="pagination pull-right">
        <li><a href="#">&laquo;</a></li>
        <li><a href="#" onClick="page(this)">1</a></li>
        <li><a href="#" onClick="page(this)">2</a></li>
        <li><a href="#" onClick="page(this)">3</a></li>
        <li><a href="#" onClick="page(this)">4</a></li>
        <li><a href="#" onClick="page(this)">5</a></li>
        <li><a href="#">&raquo;</a></li>
      </ul>
    </div>
    <!-- /. box -->
    <div class="col-md-9" name="letter_contents" id="letter_contents">
      <div class="box box-primary">
        <div class="box-header with-border">
         
          <h3 class="box-title">举报信正文</h3>
          <div class="box-tools pull-right"> 
           <button type="button" class="btn btn-default btn-sm"> <i class="fa fa-close"></i> </button>
           </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body no-padding">
          <div class="mailbox-read-info" id="title"> </div>
          <!-- /.mailbox-read-info -->
          <div class="mailbox-controls with-border text-center">
            <div class="btn-group">
              <button type="button" class="btn btn-default btn-sm"
									data-toggle="tooltip" data-container="body" title="Delete"> <i class="fa fa-trash-o"></i> </button>
              <button type="button" class="btn btn-default btn-sm"
									data-toggle="tooltip" data-container="body" title="Reply"> <i class="fa fa-reply"></i> </button>
              <button type="button" class="btn btn-default btn-sm"
									data-toggle="tooltip" data-container="body" title="Forward"> <i class="fa fa-share"></i> </button>
            </div>
            <!-- /.btn-group -->
            <button type="button" class="btn btn-default btn-sm"
								data-toggle="tooltip" title="" data-original-title="Print"> <i class="fa fa-print"></i> </button>
          </div>
          <!-- /.mailbox-controls -->
          <div class="mailbox-read-message" id="content"> </div>
          <!-- /.mailbox-read-message -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <ul class="mailbox-attachments clearfix">
            <li><span class="mailbox-attachment-icon"><i
									class="fa fa-file-pdf-o"></i></span>
              <div class="mailbox-attachment-info"> <a href="#" class="mailbox-attachment-name"><i
										class="fa fa-paperclip"></i> 举报信扫描件.pdf</a> <span
										class="mailbox-attachment-size"> 1,245 KB <a href="#"
										class="btn btn-default btn-xs pull-right"><i
											class="fa fa-cloud-download"></i></a> </span> </div>
            </li>
          </ul>
        </div>
        <!-- /.box-footer -->
        <div class="box-footer">
          <div class="pull-right">
            <button type="button" class="btn btn-default"> <i class="fa fa-reply"></i> 上一封 </button>
            <button type="button" class="btn btn-default"> <i class="fa fa-share"></i> 下一封 </button>
          </div>
          <button type="button" class="btn btn-default"> <i class="fa fa-print"></i> 打印 </button>
        </div>
        <div class="box-header with-border">
          <h3 class="box-title">多证据指向</h3>
          <div id="let" style="border: 0px; height: 760px;width: 605px"></div>
        </div>
        <!-- /.box-footer -->
      </div>
      <!-- /. box -->
    </div>
  </div>
  <!-- /.col -->
</div>
<div id="footer">
  <div class="container">
    <p class="text-muted" style="float: right">关于我们</p>
  </div>
</div>
</body>
</html>
