<%@ page import="com.ctbri.JWLetter.pojo.Letter" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<% Letter letter= (Letter) request.getAttribute("letter");--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
	<link href="css/sticky-footer-navbar.css" type="text/css"
		  rel="stylesheet">
	<link rel="stylesheet" href="css/AdminLTE.min.css">
	<link rel="stylesheet" href="css/morris.css">
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<title>智察 - 智能关系洞察系统</title>


</head>
<body>

<input type="text" id="dvs" style="display: none" value=${letter.letter_id} >


	<%--<% request.getAttribute("letter") ;--%>
		<%--System.out.println("letter:"+request.getAttribute("letter"));%>--%>

<!-- Static navbar -->
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
					<%--<li><a href="index">举报箱</a></li>--%>
					<li><a href="#" onclick="indexOnclick">举报箱</a></li>
					<li><a <%--id="toGraph"--%> href="#" onclick="graphOnclick()">关联图谱</a></li>
					<li><a href="#" onclick="mapOnclick()">地图</a></li>
					<li><a href="#" onclick="opinionsOnclick()">舆情</a></li>
				</ul>
				<form class="navbar-form" action="/JWLetter/graph">
					<input type="text" class="form-control" style="width: 350px"
						   id="word" name="word" placeholder="${keyword}" />
					<button type="submit" class="btn btn-primary" style="width: 100px">搜索</button>
				</form>
			</div>
			<!--/.nav-collapse -->
			<div></div>
		</div>
		<!--/.container-fluid -->
	</div>
</div>
<div class="container-fluid" style="padding-top: 10px">
	<div class="row">
		<div class="col-md-3">
			<div class="box box-solid">
				<div class="box-header with-border">
					<h3 class="box-title">文件夹</h3>

					<div class="box-tools">
						<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
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
								data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="box-body no-padding">
					<ul class="nav nav-pills nav-stacked" id="tag">
					</ul>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
			<div class="box box-solid">
				<div class="box-header with-border">
					<h3 class="box-title">处理进度</h3>

					<div class="box-tools">
						<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="box-body no-padding">
					<table class="table table-condensed">
						<tbody>
						<tr>
							<th style="width: 10px">#</th>
							<th>任务</th>
							<th>进度</th>
							<th style="width: 40px">总量</th>
						</tr>
						<tr>
							<td>1.</td>
							<td>总信件量</td>
							<td>
								<div class="progress progress-xs">
									<div class="progress-bar progress-bar-danger"
										 style="width: 100%"></div>
								</div>
							</td>
							<td><span class="badge bg-red">1000</span></td>
						</tr>
						<tr>
							<td>2.</td>
							<td>已处理量</td>
							<td>
								<div class="progress progress-xs">
									<div class="progress-bar progress-bar-yellow"
										 style="width: 60%"></div>
								</div>
							</td>
							<td><span class="badge bg-yellow">600</span></td>
						</tr>
						<tr>
							<td>3.</td>
							<td>流程执行中</td>
							<td>
								<div class="progress progress-xs progress-striped active">
									<div class="progress-bar progress-bar-primary"
										 style="width: 30%"></div>
								</div>
							</td>
							<td><span class="badge bg-light-blue">300</span></td>
						</tr>
						<tr>
							<td>4.</td>
							<td>已证伪</td>
							<td>
								<div class="progress progress-xs progress-striped active">
									<div class="progress-bar progress-bar-success"
										 style="width: 10%"></div>
								</div>
							</td>
							<td><span class="badge bg-green">100</span></td>
						</tr>
						</tbody>
					</table>
				</div>
				<!-- /.box-body -->
			</div>
			<a style="position: absolute; right: 0;" onClick="showStatisc()">>>>了解更多</a>
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
								class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"></i>
						</button>
						<div class="btn-group"></div>
						<!-- /.btn-group -->
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-refresh"></i>
						</button>
						<div class="pull-right">
							1-50/200
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-right"></i>
								</button>
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
								class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"></i>
						</button>
						<div class="btn-group"></div>
						<!-- /.btn-group -->
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-refresh"></i>
						</button>
						<div class="pull-right">
							1-50/200
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-right"></i>
								</button>
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
								class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"></i>
						</button>
						<div class="btn-group"></div>
						<!-- /.btn-group -->
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-refresh"></i>
						</button>
						<div class="pull-right">
							1-50/200
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-right"></i>
								</button>
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
								class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"></i>
						</button>
						<div class="btn-group"></div>
						<!-- /.btn-group -->
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-refresh"></i>
						</button>
						<div class="pull-right">
							1-50/200
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-right"></i>
								</button>
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
								class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"></i>
						</button>
						<div class="btn-group"></div>
						<!-- /.btn-group -->
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-refresh"></i>
						</button>
						<div class="pull-right">
							1-50/200
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-right"></i>
								</button>
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
								class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"></i>
						</button>
						<div class="btn-group"></div>
						<!-- /.btn-group -->
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-refresh"></i>
						</button>
						<div class="pull-right">
							1-50/200
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-right"></i>
								</button>
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
								class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"></i>
						</button>
						<div class="btn-group"></div>
						<!-- /.btn-group -->
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-refresh"></i>
						</button>
						<div class="pull-right">
							1-50/200
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-right"></i>
								</button>
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
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-close"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body no-padding">
					<div class="mailbox-read-info" id="title"></div>
					<!-- /.mailbox-read-info -->
					<div class="mailbox-controls with-border text-center">
						<div class="btn-group">
							<button type="button" class="btn btn-default btn-sm"
									data-toggle="tooltip" data-container="body" title="Delete">
								<i class="fa fa-trash-o"></i>
							</button>
							<button type="button" class="btn btn-default btn-sm"
									data-toggle="tooltip" data-container="body" title="Reply">
								<i class="fa fa-reply"></i>
							</button>
							<button type="button" class="btn btn-default btn-sm"
									data-toggle="tooltip" data-container="body" title="Forward">
								<i class="fa fa-share"></i>
							</button>
						</div>
						<!-- /.btn-group -->
						<button type="button" class="btn btn-default btn-sm"
								data-toggle="tooltip" title="" data-original-title="Print">
							<i class="fa fa-print"></i>
						</button>
					</div>
					<!-- /.mailbox-controls -->
					<div class="mailbox-read-message" id="content"></div>
					<!-- /.mailbox-read-message -->
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<ul class="mailbox-attachments clearfix">
						<li><span class="mailbox-attachment-icon"><i
								class="fa fa-file-pdf-o"></i></span>

							<div class="mailbox-attachment-info">
								<a href="#" class="mailbox-attachment-name"><i
										class="fa fa-paperclip"></i> 举报信扫描件.pdf</a> <span
									class="mailbox-attachment-size"> 1,245 KB <a href="#"
																				 class="btn btn-default btn-xs pull-right"><i
									class="fa fa-cloud-download"></i></a>
									</span>
							</div>
						</li>
					</ul>
				</div>
				<!-- /.box-footer -->
				<div class="box-footer">
					<div class="pull-right">
						<button type="button" class="btn btn-default">
							<i class="fa fa-reply"></i> 上一封
						</button>
						<button type="button" class="btn btn-default">
							<i class="fa fa-share"></i> 下一封
						</button>
					</div>
					<button type="button" class="btn btn-default">
						<i class="fa fa-print"></i> 打印
					</button>
				</div>
				<div class="box-header with-border">
					<h3 class="box-title">多证据指向</h3>

					<div id="let" style="border: 0px; height: 760px; width: 605px"></div>
				</div>
				<!-- /.box-footer -->
			</div>
			<!-- /. box -->
		</div>
		<div class="col-md-9" id="statiscresult">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">统计结果</h3>
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
					<!-- 案件类型占比 -->
					<div class="col-md-12">
						<div class="box" id="main" style="height: 364px; width: 850px"></div>
					</div>
					<!-- 案件类型占比end -->
					<!-- 信件量/处理量 use Raphaël-->
					<%--<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">信件量/处理量</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
											data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>

							<div class="box-body chart-responsive">
								<div class="chart" id="revenue-chart"
									 style="height: 300px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
									<svg height="300" version="1.1" width="400"
										 xmlns="http://www.w3.org/2000/svg"
										 style="overflow: hidden; position: relative;"></svg>

								</div>
							</div>
						</div>
					</div>--%>

					<!-- end 信件量/处理量 -->
					<!-- 中高层干部/基层干部 -->
					<div class="col-md-12">
						<!-- LINE CHART -->
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">中高层干部/基层干部</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
											data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<div class="box-body">
								<div class="chart">
									<canvas id="lineChart" height="235" width="798"></canvas>
								</div>
							</div>
						</div>
						<!-- end LINE CHART -->
					</div>
				</div>
				<!-- /.mail-box-messages -->
			</div>
			<!-- /.box-body -->

		</div>
	</div>
	<!-- /.col -->
</div>
<div id="footer">
	<div class="container">
		<p class="text-muted" style="float: right">关于我们</p>
	</div>
</div>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/echarts.js" charset="utf-8"></script>
<script src="js/macarons.js"></script>
<script src="js/dist/theme/blue.js"></script>
<script src="js/morris.min.js" charset="utf-8"></script>
<script src="js/raphael-min.js" charset="utf-8"></script>
<script src="js/Chart.min.js" charset="utf-8"></script>
<script src="js/index.js"></script>


<script type="text/javascript">
	$(function () {
		"use strict";
		// 信件量/处理量
		Morris.Area({
			element: 'revenue-chart',
			data: [{
				y: '201604',
				信件量: 250,
				处理量: 90
			}, {
				y: '201605',
				信件量: 291,
				处理量: 65
			}, {
				y: '201606',
				信件量: 278,
				处理量: 40
			}, {
				y: '201607',
				信件量: 252,
				处理量: 65
			}, {
				y: '201608',
				信件量: 306,
				处理量: 40
			}, {
				y: '201609',
				信件量: 257,
				处理量: 65
			}, {
				y: '201610',
				信件量: 372,
				处理量: 90
			}, {
				y: '201611',
				信件量: 258,
				处理量: 90
			}
			],
			xkey: 'y',
			ykeys: ['信件量', '处理量'],
			labels: ['信件量', '处理量'],
			lineColors: ['#a0d0e0', '#3c8dbc'],
			hideHover: 'auto'
		});
	});
</script>
<script type="text/javascript">
	// 中高层干部/基层干部   使用的是chart.js
	var areaChartOptions = {
		//Boolean - If we should show the scale at all
		showScale: true,
		//Boolean - Whether grid lines are shown across the chart
		scaleShowGridLines: false,
		//String - Colour of the grid lines
		scaleGridLineColor: "rgba(0,0,0,.05)",
		//Number - Width of the grid lines
		scaleGridLineWidth: 1,
		//Boolean - Whether to show horizontal lines (except X axis)
		scaleShowHorizontalLines: true,
		//Boolean - Whether to show vertical lines (except Y axis)
		scaleShowVerticalLines: true,
		//Boolean - Whether the line is curved between points
		bezierCurve: true,
		//Number - Tension of the bezier curve between points
		bezierCurveTension: 0.3,
		//Boolean - Whether to show a dot for each point
		pointDot: false,
		//Number - Radius of each point dot in pixels
		pointDotRadius: 4,
		//Number - Pixel width of point dot stroke
		pointDotStrokeWidth: 1,
		//Number - amount extra to add to the radius to cater for hit detection outside the drawn point
		pointHitDetectionRadius: 20,
		//Boolean - Whether to show a stroke for datasets
		datasetStroke: true,
		//Number - Pixel width of dataset stroke
		datasetStrokeWidth: 2,
		//Boolean - Whether to fill the dataset with a color
		datasetFill: true,
		//String - A legend template
		//Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
		maintainAspectRatio: true,
		//Boolean - whether to make the chart responsive to window resizing
		responsive: true
	};
	var areaChartData = {
		labels: ["2016.04", "2016.05", "2016.06", "2016.07", "2016.08",
			"2016.09", "2016.09"],
		datasets: [{
			label: "中高层干部",
			fillColor: "rgba(210, 214, 222, 1)",
			strokeColor: "rgba(210, 214, 222, 1)",
			pointColor: "rgba(210, 214, 222, 1)",
			pointStrokeColor: "#c1c7d1",
			pointHighlightFill: "#fff",
			pointHighlightStroke: "rgba(220,220,220,1)",
			data: [14, 21, 11, 6, 9, 16, 12, 8]
		}, {
			label: "基层干部",
			fillColor: "rgba(60,141,188,0.9)",
			strokeColor: "rgba(60,141,188,0.8)",
			pointColor: "#3b8bba",
			pointStrokeColor: "rgba(60,141,188,1)",
			pointHighlightFill: "#fff",
			pointHighlightStroke: "rgba(60,141,188,1)",
			data: [236, 270, 278, 244, 298, 241, 360, 250]
		}]
	};
	var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
	var lineChart = new Chart(lineChartCanvas);
	var lineChartOptions = areaChartOptions;
	lineChartOptions.datasetFill = false;
	lineChart.Line(areaChartData, lineChartOptions);
</script>

<script>
	// 基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('main'));
	// 指定图表的配置项和数据
	var option = {
		title: {
			text: '案件类型占比',
			x: 'center'
		},
		tooltip: {
			trigger: 'item',
			formatter: "{a} <br/>{b}: {c} ({d}%)"
		},
		legend: {
			orient: 'vertical',
			x: 'left',
			data: ['贪污', '不作为', '打击报复', '滥用职权', '违法违纪', '官官相互', '受贿',
				'诈骗', '绑架', '徇私枉法', '行贿', '违纪违法', '以权谋私', '乱作为', '侮辱',
				'官商勾结']
		},
		series: [{
			name: '案件类型',
			type: 'pie',
			radius: ['30%', '70%'],
			avoidLabelOverlap: false,
			label: {
				normal: {
					show: false,
					position: 'center'
				},
				emphasis: {
					show: true,
					textStyle: {
						fontSize: '30',
						fontWeight: 'bold'
					}
				}
			},
			labelLine: {
				normal: {
					show: false
				}
			},
			data: [{
				value: 356,
				name: '贪污'
			}, {
				value: 317,
				name: '不作为'
			}, {
				value: 269,
				name: '打击报复'
			}, {
				value: 228,
				name: '滥用职权'
			}, {
				value: 179,
				name: '违法违纪'
			}, {
				value: 156,
				name: '官官相护'
			}, {
				value: 152,
				name: '受贿'
			}, {
				value: 139,
				name: '诈骗'
			}, {
				value: 106,
				name: '绑架'
			}, {
				value: 93,
				name: '徇私枉法'
			}, {
				value: 80,
				name: '违纪违法'
			}, {
				value: 77,
				name: '以权谋私'
			}, {
				value: 73,
				name: '乱作为'
			}, {
				value: 71,
				name: '侮辱'
			}, {
				value: 44,
				name: '官商勾结'
			}]
		}]
	};
	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);
</script>

</body>
</html>