<%--
  Created by IntelliJ IDEA.
  User: fly
  Date: 2016/12/13
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>智察 - 大数据关系洞察系统</title>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="css/morris.css" >
    <!-- Theme style -->
    <link rel="stylesheet" href="css/AdminLTE.min.css">
</head>
<body>
<!-- 案件类型占比 -->
<div class="col-md-6">
    <div class="box" id="main" style="height:364px;">
    </div>
</div>
<!-- 案件类型占比end -->
<!-- 信件量/处理量 use Raphaël-->
<div class="col-md-6">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">信件量/处理量</h3>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
            </div>
        </div>

        <div class="box-body chart-responsive">
            <div class="chart" id="revenue-chart" style="height: 300px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                <svg height="300" version="1.1" width="510" xmlns="http://www.w3.org/2000/svg" style="overflow: hidden; position: relative;">

                </svg>

            </div>
        </div>
    </div>
</div>

<!-- end 信件量/处理量 -->
<!-- 中高层干部/基层干部 -->
<div class="col-md-6">
    <!-- LINE CHART -->
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">中高层干部/基层干部</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="box-body">
            <div class="chart">
                <canvas id="lineChart" height="250" width="510"></canvas>
            </div>
        </div>
    </div>
    <!-- end LINE CHART -->
</div>
<!--end 中高层干部/基层干部 -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/morris.min.js" charset="utf-8"></script>
<script src="js/raphael-min.js" charset="utf-8"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/echarts.js" charset="utf-8"></script>
<script src="js/Chart.min.js" charset="utf-8"></script>




<script type="text/javascript">
    $(function () {
      "use strict";

      // 信件量/处理量
        Morris.Area({
            element: 'revenue-chart',
            data: [
                { y: '201604', 信件量: 250, 处理量: 90 },
                { y: '201605', 信件量: 291,  处理量: 65 },
                { y: '201606', 信件量: 278,  处理量: 40 },
                { y: '201607', 信件量: 252,  处理量: 65 },
                { y: '201608', 信件量: 306,  处理量: 40 },
                { y: '201609', 信件量: 257,  处理量: 65 },
                { y: '201610', 信件量: 372, 处理量: 90 },
                { y: '201611', 信件量: 258, 处理量: 90 }

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
      labels: ["2016.04", "2016.05", "2016.06", "2016.07", "2016.08", "2016.09","2016.09"],
      datasets: [
        {
          label: "中高层干部",
          fillColor: "rgba(210, 214, 222, 1)",
          strokeColor: "rgba(210, 214, 222, 1)",
          pointColor: "rgba(210, 214, 222, 1)",
          pointStrokeColor: "#c1c7d1",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: [14, 21, 11, 6, 9, 16, 12,8]
        },
        {
          label: "基层干部",
          fillColor: "rgba(60,141,188,0.9)",
          strokeColor: "rgba(60,141,188,0.8)",
          pointColor: "#3b8bba",
          pointStrokeColor: "rgba(60,141,188,1)",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(60,141,188,1)",
          data: [236, 270, 278, 244, 298, 241, 360,250]
        }
      ]
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
        x:'center'
      },
        tooltip: {
          trigger: 'item',
          formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data:['贪污','不作为','打击报复','滥用职权','违法违纪','官官相互','受贿','诈骗','绑架','徇私枉法','行贿','违纪违法','以权谋私','乱作为','侮辱','官商勾结']
        },

        series: [
            {
                name:'案件类型',
                type:'pie',
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
                data:[
                    {value:356, name:'贪污'},
                    {value:317, name:'不作为'},
                    {value:269, name:'打击报复'},
                    {value:228, name:'滥用职权'},
                    {value:179, name:'违法违纪'},
                    {value:156, name:'官官相护'},
                    {value:152, name:'受贿'},
                    {value:139, name:'诈骗'},
                    {value:106, name:'绑架'},
                    {value:93, name:'徇私枉法'},
                    {value:80, name:'违纪违法'},
                    {value:77, name:'以权谋私'},
                    {value:73, name:'乱作为'},
                    {value:71, name:'侮辱'},
                    {value:44, name:'官商勾结'}
                ]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
	</script>
  </body>
</html>
