<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <link href="css/sticky-footer-navbar.css" type="text/css" rel="stylesheet">  
     <script src="js/bootstrap.min.js"></script>  
     <script src="js/dist/theme/blue.js"></script>
     <script type="text/javascript" src="js/echarts.min.js"></script>
     <script type="text/javascript" src="js/dataTool.js"></script>
     <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
     <script src="js/macarons.js"></script>
     <script src="js/jquery.js"></script>
     <link rel="stylesheet" href="css/AdminLTE.min.css">
	 <title>商业价值</title>
</head>
<body>
 <!-- Static navbar -->
 <div class="navbar navbar-default" role="navigation">
      <div class="container-fluid">
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
 
   <div class="container-fluid">
  
   <div class=" col-lg-3">
          <img width=110 height=110 class="profile-user-img img-responsive img-circle" src="http://wx.qlogo.cn/mmhead/Q3auHgzwzM47AKAkJ990UXQIfTFBialhlSEiaHOGGn9ehu0yQ0icp6Svg/0">
          <h3 class="profile-username text-center">罗辑思维</h3>
          <p class="text-muted text-center"><b>公众号：</b>luojisw</p>
          <ul class="list-group list-group-unbordered">
          <li class="list-group-item">
    	  <p><b>功能介绍:</b></br>罗胖每天早上60秒语音，用文字回复语音中的关键词可阅读文章。看视频请在优酷搜索“罗辑思维”，每周五更新。更多精彩请关注新浪微博@罗辑思维朋友圈，联系我们请发邮件至service@luojilab.com</p>   
          </li>
          <li class="list-group-item">
          <p><b>账号主体:</b>资深媒体人 罗振宇</p>
          </li>
          </ul>  
	</div>

   <session id="part1 business value">
    <div class=" col-lg-9">
                 <div class="box-header">
              <h3 class="box-title">商业价值</h3>
            </div>
    <div id="radar" style="height: 350px;width:100%"></div>
     </div>
     </session>
     <session id="part2 shopping inclination">
      <div class="box col-lg-9 col-lg-offset-3">
    <div class="box-header">
              <h3 class="box-title">购物倾向</h3>
            </div>
            
            <div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    选择时段
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li>工作日</li>
    <li>周末</li>
  </ul>
</div>
    <div class="col-lg-8">       
    <div id="pie" style="height: 350px;width:100%"></div>
    </div> 
    <div class="col-lg-4">       
    <h4 class="section-heading">最佳投放子类</h4>
			        <table class="table table-hover">
			          <tr>
			            <td align="left"><a target="_blank" href="">点击付费查看</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">点击付费查看</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">点击付费查看</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">母婴、玩具</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">图书、音像、电子书</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">家具、厨具</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">运动户外</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">珠宝、奢侈品</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">个人护理</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">清洁用品</a></td>
			          </tr>
			        </table>
			        </div>
			        <div class="col-lg-12">
			        <h4 class="section-heading">最佳投放单品</h4>
			        <table class="table table-hover">
			          <tr>
			            <td align="left"><a target="_blank" href="">点击付费查看</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">点击付费查看</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">点击付费查看</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">农夫山泉饮用天然水（适合婴幼儿）1L*12瓶整箱</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">苹果(Apple)iphone5s(A1530)16GB金色移动联通电信4G手机</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">爽健Scholl电动修足机电动修脚器+护甲霜75ml蓝色组合装</a></td>
			          </tr>
			          <tr>
			            <td align="left"><a target="_blank" href="">奇酷（QIKU）8681-M02青春版移动联通双4G手机</a></td>
			          </tr>
			          
			        </table>
    </div> 
	</div>
    </session>
 <session id="part3" class="content-header">
<div class="box col-lg-9 col-lg-offset-3">
            <div class="box-header">
              <h3 class="box-title">生活属性</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-striped">
                <tbody><tr>
                  <th style="width: 10px">#</th>
                  <th>标签</th>
                  <th>指数</th>
                  <th style="width: 40px"></th>
                </tr>
                <tr>
                  <td>1.</td>
                  <td>关注学习指数</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">55%</span></td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td>关注婚恋指数</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-yellow">70%</span></td>
                </tr>
                <tr>
                  <td>3.</td>
                  <td>关注母婴指数</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-primary" style="width: 30%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-light-blue">30%</span></td>
                </tr>
                <tr>
                  <td>4.</td>
                  <td>关注养生指数</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">90%</span></td>
                </tr>
                
              </tbody></table>
            </div>
            
            <!-- /.box-body -->
          </div>
          
          <div class="box col-lg-9 col-lg-offset-3">
            <div class="box-header">
              <h3 class="box-title">兴趣偏好</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-striped">
                <tbody><tr>
                  <th style="width: 10px">#</th>
                  <th>标签</th>
                  <th>指数</th>
                  <th style="width: 40px"></th>
                </tr>
                <tr>
                  <td>1.</td>
                  <td>关注视频指数</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">55%</span></td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td>关注娱乐指数</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-yellow">70%</span></td>
                </tr>
                <tr>
                  <td>3.</td>
                  <td>关注动漫指数</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-primary" style="width: 30%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-light-blue">30%</span></td>
                </tr>
                <tr>
                  <td>4.</td>
                  <td>关注音乐指数</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">90%</span></td>
                </tr>
                <tr>
                  <td>5.</td>
                  <td>关注小说指数</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">90%</span></td>
                </tr>
              </tbody></table>
            </div>
            
            <!-- /.box-body -->
          </div>
          
                   <div class="box col-lg-9 col-lg-offset-3">
            <div class="box-header">
              <h3 class="box-title">消费属性</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-striped">
                <tbody><tr>
                  <th style="width: 10px">#</th>
                  <th>标签</th>
                  <th>指数</th>
                  <th style="width: 40px"></th>
                </tr>
                <tr>
                  <td>1.</td>
                  <td>关注理财指数</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">55%</span></td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td>网络购物指数</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-yellow">70%</span></td>
                </tr>
                <tr>
                  <td>3.</td>
                  <td>关注汽车指数</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-primary" style="width: 30%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-light-blue">30%</span></td>
                </tr>
                
              </tbody></table>
            </div>
            
            <!-- /.box-body -->
          </div>
          
          
 
          </session>
          <session id="part4" class="content-header">
           <div class="box col-lg-9 col-lg-offset-3">
            <div class="box-header">
              <h3 class="box-title">关联关系</h3>
            </div>
          <div id="account_asso" style="height:550px;"></div>
          </div>
          </session>
 </div>
  <div id="footer">
      <div class="container">
        <p class="text-muted" style="float:right">数据合作 | 关于我们</p>
      </div>
    </div>
 </body>
  <script type="text/javascript">
var dom = document.getElementById("radar");
var myChart = echarts.init(dom);
var app = {};
option = null;
 option = {
    title: {
        text: ''
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        x: 'right',
        data:['商业价值指数']
    },
    radar: [
        {
            indicator: [
                {text: '消费频率', max: 100},
                {text: '消费总额', max: 100},
                {text: '购物意愿', max: 100}
            ],
            center: ['50%','50%'],
            radius: 150
        }
    ],
    series: [
        {
            type: 'radar',
             tooltip: {
                trigger: 'item'
            },
            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            data: [
                {
                    value: [60,73,85],
                    name: '商业价值指数'
                }
            ]
        },
      
    ]
};;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>
<script type="text/javascript">
  var myChart = echarts.init(document.getElementById('pie'));
  var option = {  
   					title: {
   						show:true,
   						top:'2%',
                        left: '45%',
                        text:'微信公众号关注度',
                        textAlign: 'center',
                        textStyle:{
                                     fontSize:18,
                                     
                        }
                            },
                   tooltip : {
                              trigger: 'item',
                               formatter: "{a} <br/>{b} : {c} ({d}%)"
                               },
                    // 图例
                    legend: {
                         orient: 'vertical',
                         left: '5%',
                         itemHeight: '20',
                         top:'25',
                         textStyle: {
                                   fontSize:12,
                                   fontStyle:'normal',
                         },
                         data: ['家居生活','电脑办公','家用电器','母婴用品','服饰用品'],
                              },
                               calculable : true,
                               restore : {show: true},
                               saveAsImage : {show: true},
                    series : [
                        {
                            "name":"生活",
                            "type":"pie",
                            "radius" : '65%',
                            "center": ['50%', '65%'],
                            "clockwise":false,
                            "textStyle":{
                                        fontSize:'14',
                            },
                             data:[
                                      {value:335, name:'家居生活'},
                                      {value:310, name:'电脑办公'},
                                      {value:234, name:'家用电器'},
                                      {value:135, name:'母婴用品'},
                                      {value:1548,name:'服饰用品'}
                                  ],
                                  itemStyle: {
                                              emphasis: {
                                                          shadowBlur: 10,
                                                           shadowOffsetX: 0,
                                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                         },
                                               normal:{ 
                                                    label:{ 
                                                           show: true, 
                                                           textStyle:{
                                                            fontSize: 12
                                                            }
                                                           }, 
                                                    labelLine :{show:true} 
                                                        } 
                                                          } 
                                                 }
                        
                    ]
                };
                 // 为echarts对象加载数据
                 myChart.setOption(option); 
    </script>
 
 
 <script  type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('account_asso'));
        var dom = document.getElementById("account_asso");
        var app = {};
        option = null;
        myChart.showLoading();
        $.get('data/les-miserables.gexf', function (xml) {
            myChart.hideLoading();

            var graph = echarts.dataTool.gexf.parse(xml);
            var categories = [];
            for (var i = 0; i < 9; i++) {
                categories[i] = {
                    name: '类目' + i
                };
            }
            graph.nodes.forEach(function (node) {
                node.itemStyle = null;
                node.value = node.symbolSize;
                node.symbolSize /= 1.2;
                node.label = {
                    normal: {
                        show: node.symbolSize > 30
                    }
                };
                node.category = node.attributes.modularity_class;
            });
            option = {
                title: {
                    text: '公众号关联关系',
                    subtext: '',
                    top: 'bottom',
                    left: 'right'
                },
                tooltip: {},
                legend: [{
                    // selectedMode: 'single',
                    data: categories.map(function (a) {
                        return a.name;
                    })
                }],
                animationDuration: 1500,
                animationEasingUpdate: 'quinticInOut',
                series : [
                    {
                        name: 'Les Miserables',
                        type: 'graph',
                        layout: 'none',
                        data: graph.nodes,
                        links: graph.links,
                        categories: categories,
                        roam: true,
                        label: {
                            normal: {
                                position: 'right',
                                formatter: '{b}'
                            }
                        },
                        lineStyle: {
                            normal: {
                                color: 'source',
                                curveness: 0.3
                            }
                        }
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表
            myChart.setOption(option);
        }, 'xml');

    </script>
    