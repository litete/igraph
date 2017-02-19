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
     <script type="text/javascript" src="js/echarts.js" charset="utf-8"></script>
     <script src="js/macarons.js"></script>
     <script src="js/jquery.js"></script>
   
	<title>深度搜索</title>

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
    <session id="KwTrend">
     <div class="container">
     <h3>指数趋势</h3>
     <h5> 指数:
     <div id="searchindex">
     </div></h5>
    <div id="trend1" style="height: 320px;width:100%"></div>
     </div>
    </session>

     </session>
    <session id="relatedKW">
    <div class="container">
    <h3>关系图谱</h3>
     <div id="tree" style="height:600px;width:100%;"></div> 
    </div>
    </session>
    
         <session id="relatedSite">
     <div class="container">
     <h3>人群流向</h3>
   
 <div class="panel panel-default">
 <!-- Table -->
  <table class="table table-hover">
     <tr>  
        <th scope="col">序号</th>  
        <th scope="col">网站</th>  
        <th scope="col">类别</th>  
    </tr>
     <tr>  
        <td>1.</td>
        <td>sina.com.cn</td>  
        <td>新闻媒体</td>  
     </tr> 
      <tr>  
   
        <td>2</td>  
        <td>sogou.com</td>  
        <td>tencent.com</td>  
     </tr> 
 <tr>  
        
        <td>3</td>  
        <td>tencent.com</td>  
        <td>tencent.com</td>  
     </tr> 
  
  </table>
</div>
  	</div>
    

        <div id="footer">
      <div class="container">
        <p class="text-muted" style="float:right">数据合作 | 关于我们</p>
      </div>
    </div>
    
    
    </body>
    <script type="text/javascript">
  var myChart = echarts.init(document.getElementById('trend'));
  var option = {  
   					title: {
   						    show:true,
                            left:'40%',
                            text:'left',
                            text:'北京和巴黎的关键词热度',
                            },
                    tooltip: {
                             show: true,
                             },
                             
                    // 图例
                    legend: {
                    		 show:true,
                             data:[{name:'北京'},{name:'巴黎'}],
                             selectedMode:true,
                             right: 150,
                             top: 20
                             },
                           // x轴
                    xAxis : [
                           {  
                            name : '时间',
                            nameLocation :'end',
                            splitLine:{
                                      show: false,
                             },
                            
                            type : 'category',
                            data : ["2013-01-01","2013-03-01","2013-04-01","2013-05-01","2013-06-01","2013-07-01","2013-08-01","2013-09-01","2013-10-01","2013-11-01",
                                    "2013-12-01","2014-01-01","2014-02-01","2014-03-01","2014-04-01","2014-05-01","2014-06-01","2014-07-01","2014-08-01","2014-09-01",
                                    "2014-10-01","2014-11-01","2014-12-01","2015-01-01","2015-02-01","2015-03-01","2015-04-01","2015-05-01","2015-06-01","2015-07-01",
                                    "2015-08-01","2015-09-01","2015-10-01","2015-11-01","2015-12-01","2016-01-01","2016-02-01","2016-03-01","2016-04-01","2016-05-01"],
                            axisTick: {
                                       alignWithLabel: true,
                                       interval: 0,
                                      },
                            axisLabel: {
                                         interval: 0,
                                         rotate: '45',
                                       },
                            axisTick: {
                                        show: false,
                                       },
                                       
                           },
                            ],
                    yAxis : [
                        {
                            name : '关键词热度',
                            nameLocation :'end',
                            type : 'value'
                        }
                    ],
                    //数据
                    series : [
                        {
                            "name":"北京",
                            "type":"line",
                            "color":'red',
                            "data":[2, 3, 3, 8, 11, 20, 19, 26, 34, 65,61,476,622,995,1060,1076,649,
                                    1277,1266,1591,1482,1820,1943,2110,1504,2751,2977,2706,3415,3765,4146,4859,
                                    5714,8575,12974,45258,44796,72446,172350,54231],
                        },
                    
                    
                        {
                            "name":"巴黎",
                            "type":"line",
                            "color":'blue',
                            "data":[0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,
                                    0,0,0,0,0,0,0,0,0,0,0,0,0,0,1695,
                                    2076,3048,4339,14276,14493,24594,70007,18533],
                        }
                    ],
                    };
             
                 // 为echarts对象加载数据
                 myChart.setOption(option); 
    </script>
    <script type="text/javascript">
			  var myChart = echarts.init(document.getElementById('trend1'));
			  /* var base = +new Date(1968, 9, 3);
			  var oneDay = 24 * 3600 * 1000;
			  var date = [];
			
			  var data = [Math.random() * 300];
			
			  for (var i = 1; i < 20000; i++) {
			      var now = new Date(base += oneDay);
			      date.push([now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'));
			      data.push(Math.round((Math.random() - 0.5) * 20 + data[i - 1]));
			  }  */
			
			  option = {
			      tooltip: {
			          trigger: 'axis',
			          position: function (pt) {
			              return [pt[0], '10%'];
			          }
			      },
			      title: {
			    	  show:true,
			          left:'40%',
			          text:'left',
			          text:'北京和巴黎的关键词热度',
			      },
			   // 图例
			      legend: {
			      		 show:true,
			               data:[{name:'北京'},{name:'巴黎'}],
			               selectedMode:true,
			               right: 150,
			               top: 20
			               },
			      toolbox: {
			          feature: {
			              dataZoom: {
			                  yAxisIndex: 'none'
			              },
			              restore: {},
			              saveAsImage: {}
			          }
			      },
			      xAxis: {
			          type: 'category',
			          boundaryGap: false,
			          data: ["2013-01-01","2013-03-01","2013-04-01","2013-05-01","2013-06-01","2013-07-01","2013-08-01","2013-09-01","2013-10-01","2013-11-01",
			                 "2013-12-01","2014-01-01","2014-02-01","2014-03-01","2014-04-01","2014-05-01","2014-06-01","2014-07-01","2014-08-01","2014-09-01",
			                 "2014-10-01","2014-11-01","2014-12-01","2015-01-01","2015-02-01","2015-03-01","2015-04-01","2015-05-01","2015-06-01","2015-07-01",
			                 "2015-08-01","2015-09-01","2015-10-01","2015-11-01","2015-12-01","2016-01-01","2016-02-01","2016-03-01","2016-04-01","2016-05-01"],
			      },
			      yAxis: {
			    	  name : '关键词热度',
			          nameLocation :'end',
			          type : 'value',
			      },
			      dataZoom: [{
			          type: 'inside',
			          start: 0,
			          end: 10
			      }, {
			          start: 0,
			          end: 10,
			          handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
			          handleSize: '80%',
			          handleStyle: {
			              color: '#fff',
			              shadowBlur: 3,
			              shadowColor: 'rgba(0, 0, 0, 0.6)',
			              shadowOffsetX: 2,
			              shadowOffsetY: 2
			          }
			      }],
			      series: [
					                {
			                            "name":"北京",
			                            "type":"line",
			                            "color":'red',
			                            "data":[2, 3, 3, 8, 11, 20, 19, 26, 34, 65,61,476,622,995,1060,1076,649,
			                                    1277,1266,1591,1482,1820,1943,2110,1504,2751,2977,2706,3415,3765,4146,4859,
			                                    5714,8575,12974,45258,44796,72446,172350,54231],
			                        },
			                    
			                    
			                        {
			                            "name":"巴黎",
			                            "type":"line",
			                            "color":'blue',
			                            "data":[0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,
			                                    0,0,0,0,0,0,0,0,0,0,0,0,0,0,1695,
			                                    2076,3048,4339,14276,14493,24594,70007,18533],
			                        }
					            ]
			          
			  };

                 // 为echarts对象加载数据
                 myChart.setOption(option); 
    </script>
    <script type="text/javascript">

        var chartTheme = null;
        var sumChart = null;
        var treeChart = null;
		var ech = null;
        require(['js/dist/theme/blue'],function(tarTheme){
			
			chartTheme = tarTheme;
            // 路径配置
            require.config({
				paths: {
					echarts: 'js/dist'
				}
			});
			// 使用
			require(
				[
					'echarts',
					'echarts/chart/bar',
					'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
					'echarts/chart/force',
					'echarts/chart/chord'
				],
				//将画多个图表的进行函数封装
				function drawCharts(ec) {
					ech=ec;
					//drawSumChart(ec);
					drawTreeChart(ec);
				}
			);
        })

       function drawTreeChart(ec){
            // 基于准备好的dom，初始化echarts图表
            
            treeChart = ec.init(document.getElementById('tree'),'macarons');
            
            var option = {
                title : {
                text: '',
                subtext: '',
                x:'right',
                y:'bottom'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: '{a} : {b}'
                },
                toolbox: {
                    show : true,
                    feature : {
                    restore : {show: true},
                    magicType: {show: true, type: ['force', 'chord']},
                    saveAsImage : {show: true}
                }
            },
            legend: {
                x: 'left',
                data:['直接关联','间接关联']
            },
            series : [
            {
                type:'force',
                name : "关联关系",
                ribbonType: false,
                categories : [
                {
                    name: '关键词'
                },
                {
                    name: '直接关联'
                },
                {
                    name:'间接关联'
                }
            ],
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        textStyle: {
                            color: '#eee'
                        }
                    },
                    nodeStyle : {
                        color:'#79cce0',
                        brushType : 'both',
                        borderColor : 'rgba(0,0,0,0)',
                        borderWidth : 1
                    },
                    linkStyle: {
                        type: 'curve',
                        borderColor: '#c4dfee'
                    }
                },
                emphasis: {
                    label: {
                        show: false
                        // textStyle: null      // 默认使用全局文本样式
                    },
                    nodeStyle : {
                        //r: 30
                    },
                    linkStyle : {}
                }
            },
            useWorker: false,
            minRadius : 25,
            maxRadius : 50,
            gravity: 1,
            scaling: 1.3,
            roam: 'move',
			nodes:[
                {"category":0,"name":"关键词-中国电信","value":60}
				,{"category":1,"name":"通信","value":49.07243461}
				,{"category":1,"name":"4G","value":4.424778761}
				,{"category":1,"name":"真实","value":1.981651376}
				,{"category":1,"name":"杨杰","value":1.315789474}
				,{"category":1,"name":"CTNET2025","value":0.695652174}
				,{"category":1,"name":"网络","value":0.621359223}
				,{"category":1,"name":"去了","value":0.592592593}
				,{"category":1,"name":"真实情况","value":0.303370787}
				,{"category":1,"name":"王牌","value":0.3}
				,{"category":1,"name":"这就是","value":0.278350515}
				,{"category":1,"name":"致命","value":0.278350515}
				,{"category":1,"name":"北京","value":0.171974522}
				,{"category":1,"name":"看完","value":0.133004926}
				,{"category":1,"name":"军事打击","value":0.08988764}
				,{"category":1,"name":"稀罕","value":0.08988764}
				,{"category":1,"name":"亲历记","value":0.08988764}
				,{"category":1,"name":"去电信化","value":0.08988764}
				,{"category":1,"name":"研发","value":0.08988764}
				,{"category":1,"name":"ctbri","value":0.08988764}
				,{"category":1,"name":"而来","value":0.088888889}
            ],
			links:[
                {"source":"关键词-中国电信","target":"通信","weight":1,"f":49.07243461},
				{"source":"关键词-中国电信","target":"4G","weight":1,"f":4.424778761},
				{"source":"关键词-中国电信","target":"真实","weight":1,"f":1.981651376},
				{"source":"关键词-中国电信","target":"杨杰","weight":1,"f":1.315789474},
				{"source":"关键词-中国电信","target":"CTNET2025","weight":1,"f":0.695652174},
				{"source":"关键词-中国电信","target":"网络","weight":1,"f":0.621359223},
				{"source":"关键词-中国电信","target":"去了","weight":1,"f":0.592592593},
				{"source":"关键词-中国电信","target":"真实情况","weight":1,"f":0.303370787},
				{"source":"关键词-中国电信","target":"王牌","weight":1,"f":0.3},
				{"source":"关键词-中国电信","target":"这就是","weight":1,"f":0.278350515},
				{"source":"关键词-中国电信","target":"致命","weight":1,"f":0.278350515},
				{"source":"关键词-中国电信","target":"北京","weight":1,"f":0.171974522},
				{"source":"关键词-中国电信","target":"看完","weight":1,"f":0.133004926},
				{"source":"关键词-中国电信","target":"军事打击","weight":1,"f":0.08988764},
				{"source":"关键词-中国电信","target":"稀罕","weight":1,"f":0.08988764},
				{"source":"关键词-中国电信","target":"亲历记","weight":1,"f":0.08988764},
				{"source":"关键词-中国电信","target":"去电信化","weight":1,"f":0.08988764},
				{"source":"关键词-中国电信","target":"研发","weight":1,"f":0.08988764},
				{"source":"关键词-中国电信","target":"ctbri","weight":1,"f":0.08988764},
				{"source":"关键词-中国电信","target":"而来","weight":1,"f":0.088888889}]
            }]};
			treeChart.setOption(option);
        }
    </script>