<%--
  Created by IntelliJ IDEA.
  User: fly
  Date: 2016/12/13
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<script src=".js/morris.min.js" charset="utf-8"></script>
<script src="js/raphael-min.js" charset="utf-8"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/echarts.js" charset="utf-8"></script>
<script src="js/Chart.min.js" charset="utf-8"></script>




<script type="text/javascript">
    $(function () {
        "use strict";

        // 信件量/处理量
        var area = new Morris.Area({
            element: 'revenue-chart',
            resize: true,
            data: [
                {y: '2011 Q1', 信件量: 2666, 处理量: 2666},
                {y: '2011 Q2', 信件量: 2778, 处理量: 2294},
                {y: '2011 Q3', 信件量: 4912, 处理量: 1969},
                {y: '2011 Q4', 信件量: 3767, 处理量: 3597},
                {y: '2012 Q1', 信件量: 6810, 处理量: 1914},
                {y: '2012 Q2', 信件量: 5670, 处理量: 4293},
                {y: '2012 Q3', 信件量: 4820, 处理量: 3795},
                {y: '2012 Q4', 信件量: 15073, 处理量: 5967},
                {y: '2013 Q1', 信件量: 10687, 处理量: 4460},
                {y: '2013 Q2', 信件量: 8432, 处理量: 5713}
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
        legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
        //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
        maintainAspectRatio: true,
        //Boolean - whether to make the chart responsive to window resizing
        responsive: true
    };
    var areaChartData = {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
            {
                label: "中高层干部",
                fillColor: "rgba(210, 214, 222, 1)",
                strokeColor: "rgba(210, 214, 222, 1)",
                pointColor: "rgba(210, 214, 222, 1)",
                pointStrokeColor: "#c1c7d1",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [65, 59, 80, 81, 56, 55, 40]
            },
            {
                label: "基层干部",
                fillColor: "rgba(60,141,188,0.9)",
                strokeColor: "rgba(60,141,188,0.8)",
                pointColor: "#3b8bba",
                pointStrokeColor: "rgba(60,141,188,1)",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(60,141,188,1)",
                data: [28, 48, 40, 19, 86, 27, 90]
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
            data:['贪污','滥用职权','行贿','以权谋私','官商勾结']
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
                    {value:335, name:'贪污'},
                    {value:310, name:'滥用职权'},
                    {value:234, name:'行贿'},
                    {value:135, name:'以权谋私'},
                    {value:1548, name:'官商勾结'}
                ]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>
