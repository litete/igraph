<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>智察 - 智能关系洞察系统</title>
    <script type="text/javascript" src="js/echarts.min.js"></script>
    <script type="text/javascript" src="js/echarts.js" charset="utf-8"></script>
    <script src="js/macarons.js"></script>
    <script src="js/dist/theme/blue.js"></script>
</head>
<body>
<!-- Static navbar -->
<jsp:include page="navigation.jsp"/>
<div class="container-fluid" style="padding-top: 10px">
    <div class="col-md-3">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">相关举报信</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body" id="article">
                <c:forEach items="${list}" var="user" varStatus="vs" end="10">

                    <p class="text-muted" onclick="showDetail(${user.letter_id})"><span
                            class="label label-danger">${user.name+1}</span> ${user.attachments} </p>
                    <%--
                        <p class="text-muted"> <span class="label label-danger">一级信件</span> 执纪审查辽宁省大连市委常委、常务副市长曹爱华接受调查 </p>
                        <p class="text-muted"> <span class="label label-success">三级信件</span> 执纪审查河南省济源市人大原党组副书记、副主任郭茹被调查 </p>
                        <p class="text-muted"> <span class="label label-success">三级信件</span> 执纪审查重庆市九龙坡区人大原党组书记、主任潘平被调查 </p>
                        <p class="text-muted"> <span class="label label-success">三级信件</span> 党纪处分广州南沙经济技术开发区管委会副主任段险峰被双开 </p>
                        <p class="text-muted"> <span class="label label-warning">二级信件</span> 党纪处分湖南日报社原党组成员、社务委员刘树林被"双开" </p>
                        <p class="text-muted"> <span class="label label-warning">二级信件</span> 党纪处分新疆兵团第九师党委常委、副师长张建雄被“双开” </p>
                    --%>

                </c:forEach>

            </div>
            <!-- /.box-body -->
        </div>
    </div>
    <div class="col-md-9" id="map">
        <div class="box-header with-border">
            <h3 class="box-title">关联图谱</h3>
        </div>
        <div id="tree" style="border: 0px; height: 760px; width: 100%;"></div>
    </div>
    <div class="col-md-9" name="letter" id="letter" style="display: none">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">举报信正文</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-default btn-sm" onclick="showDetail(${user.letter_id})">
                        <i class="fa fa-close"></i>
                    </button>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <div class="mailbox-read-info" id="title"></div>
                    <!-- /.mailbox-read-info -->
                    <div class="mailbox-controls with-border text-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm"
                                    data-toggle="tooltip" data-container="body" title="Delete"><i
                                    class="fa fa-trash-o"></i></button>
                            <button type="button" class="btn btn-default btn-sm"
                                    data-toggle="tooltip" data-container="body" title="Reply"><i
                                    class="fa fa-reply"></i></button>
                            <button type="button" class="btn btn-default btn-sm"
                                    data-toggle="tooltip" data-container="body" title="Forward"><i
                                    class="fa fa-share"></i></button>
                        </div>
                        <!-- /.btn-group -->
                        <button type="button" class="btn btn-default btn-sm"
                                data-toggle="tooltip" title="" data-original-title="Print"><i class="fa fa-print"></i>
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

                            <div class="mailbox-attachment-info"><a href="#" class="mailbox-attachment-name"><i
                                    class="fa fa-paperclip"></i> 举报信扫描件.pdf</a> <span
                                    class="mailbox-attachment-size"> 1,245 KB <a href="#"
                                                                                 class="btn btn-default btn-xs pull-right"><i
                                    class="fa fa-cloud-download"></i></a> </span></div>
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
                <div class="col-md-12">
                    <h3>多证据指向</h3>

                    <div id="let" style="border: 0px; height: 760px; width: 100%;"></div>
                </div>
                <!-- /.box-footer -->
            </div>
            <!-- /. box -->
        </div>
    </div>
    <div id="footer">
        <div class="container">
            <p class="text-muted" style="float: right">关于我们</p>
        </div>
    </div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/index.js"></script>
</body>
</html>
<script type="text/javascript">

    var chartTheme = null;
    var sumChart = null;
    var treeChart = null;
    var ech = null;
    require(['js/dist/theme/blue'], function (tarTheme) {

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
                    ech = ec;
                    //drawSumChart(ec);
                    drawTreeChart(ec);
                }
        );
    })

    function drawTreeChart(ec) {
        // 基于准备好的dom，初始化echarts图表

        treeChart = ec.init(document.getElementById('tree'), 'macarons');
        var node =${nodes};
        var link =${links};
        var ecConfig = require('echarts/config');
        treeChart.on(ecConfig.EVENT.CLICK, eConsole);
        var option = {
            title: {
                text: '',
                subtext: '',
                x: 'right',
                y: 'bottom'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} : {b}'
            },
            toolbox: {
                show: true,
                feature: {
                    restore: {show: true},
                    magicType: {show: true, type: ['force', 'chord']},
                    saveAsImage: {show: true}
                }
            },
            legend: {
                x: 'left',
                data: ['人名', '地名', '组织机构', '罪名', '职务', '诉讼日期', '其他'],
                textStyle: {
                    fontFamily: '微软雅黑'
                }
            },
            series: [
                {
                    type: 'force',
                    name: "关联关系",
                    ribbonType: false,
                    clickable: true,
                    categories: [
                        {
                            name: '关键词'
                        }, {
                            name: '人名'
                        }, {
                            name: '地名'
                        }, {
                            name: '组织机构'
                        }, {
                            name: '罪名'
                        }, {
                            name: '职务'
                        }, {
                            name: '诉讼日期'
                        }, {
                            name: '其他'
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
                            nodeStyle: {
                                //color:'rgb(54,143,255)',
                                brushType: 'both',
                                borderColor: 'rgba(0,0,0,0)',
                                borderWidth: 1
                            },
                            linkStyle: {
                                type: 'curve',
                                color: 'rgb(145,146,148)',
                                borderColor: '#919294'
                            }
                        },
                        emphasis: {
                            label: {
                                show: false
                                // textStyle: null      // 默认使用全局文本样式
                            },
                            nodeStyle: {
                                //r: 30
                            },
                            linkStyle: {}
                        }
                    },
                    useWorker: false,
                    minRadius: 20,
                    maxRadius: 35,
                    gravity: 1,
                    scaling: 1.6,
                    roam: 'move',
                    nodes:${nodes},
                    links:${links}
                }]
        };
        treeChart.setOption(option);

        treeChart.hideLoading();
    }
    function eConsole(param) {
        if (typeof param.data.source == 'undefined') {
            if (param.type == 'click') {

                window.location.href = "/JWLetter/graph?word=" + param.name;
            }
        } else {
            if (param.type == 'click') {
                var article = document.getElementById("article");
                $.ajax({
                    type: "post",
                    cache: false,
                    async: false,
                    dataType: "json",
                    data: "article=" + param.name,
                    url: "http://" + document.location.host + "/JWLetter/article",
                    success: function (res) {

                        all = res.article;
                        for (var i = 0; i < article.children.length;) {
                            article.removeChild(article.children[0]);
                        }

                        for (var i = 0; i < all.length; i++) {
                            var p = document.createElement("p");
                            var span = document.createElement("span");
                            var a = document.createElement("span");
                            span.setAttribute("class", "label label-warning");
                            span.innerHTML = "二级信件";
                            a.innerHTML = all[i].attachments;
                            p.appendChild(span);
                            p.setAttribute("class", "text-muted");
                            p.setAttribute("onclick", "showDetail(" + all[i].letter_id + ")");
                            //var str=all[i].attachments;
                            p.appendChild(a);
                            article.appendChild(p);

                        }


                    }
                });
            }
        }

    }


    function showDetail(a) {

        var map = document.getElementById("map");
        var letter = document.getElementById("letter");
        var node;
        var link;
        var content;
        if (map.style.display == "none") {
            map.style.display = "";
            letter.style.display = "none"
        } else {
            map.style.display = "none";
            letter.style.display = ""
        }

        $.ajax({
            type: "post",
            cache: false,
            async: false,
            dataType: "json",
            data: "id=" + a,
            url: "http://" + document.location.host + "/JWLetter/letter",
            success: function (res) {

                node = res.node;
                link = res.link;
                content = res.letter[0];

                var title = document.getElementById("title");
                for (var i = 0; i < title.children.length;) {
                    title.removeChild(title.children[0]);
                }
                var author = document.createElement("h3");
                author.innerHTML = content.attachments;
                var time = document.createElement("h5");
                var span1 = document.createElement("span")
                span1.innerHTML = content.author;
                var span2 = document.createElement("span")
                span2.innerHTML = content.submitDateTime;
                span2.setAttribute("class", "mailbox-read-time pull-right");
                time.appendChild(span1);
                time.appendChild(span2);
                title.appendChild(author);
                title.appendChild(time);
                var con = document.getElementById("content");
                for (var i = 0; i < con.children.length;) {
                    con.removeChild(con.children[0]);
                }
                var p = document.createElement("p");
                p.innerHTML = content.contents;
                con.appendChild(p);
                var chartTheme = null;
                var sumChart = null;
                var treeChart = null;
                var ech = null;
                require(['js/dist/theme/blue'], function (tarTheme) {

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
                                ech = ec;
                                //drawSumChart(ec);
                                drawTChart(ec);
                            }
                    );
                })

                function drawTChart(ec) {
                    // 基于准备好的dom，初始化echarts图表

                    treeChart = ec.init(document.getElementById('let'), 'macarons');

                    var ecConfig = require('echarts/config');
                    treeChart.on(ecConfig.EVENT.CLICK, eConsole);
                    var option = {
                        title: {
                            text: '',
                            subtext: '',
                            x: 'right',
                            y: 'bottom'
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: '{a} : {b}'
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                restore: {show: true},
                                magicType: {show: true, type: ['force', 'chord']},
                                saveAsImage: {show: true}
                            }
                        },
                        legend: {
                            x: 'left',
                            data: ['人名', '地名', '组织机构', '罪名', '职务', '诉讼日期', '其他'],
                            textStyle: {
                                fontFamily: '微软雅黑'
                            }
                        },
                        series: [
                            {
                                type: 'force',
                                name: "关联关系",
                                ribbonType: false,
                                clickable: true,
                                categories: [
                                    {
                                        name: '关键词'
                                    }, {
                                        name: '人名'
                                    }, {
                                        name: '地名'
                                    }, {
                                        name: '组织机构'
                                    }, {
                                        name: '罪名'
                                    }, {
                                        name: '职务'
                                    }, {
                                        name: '诉讼日期'
                                    }, {
                                        name: '其他'
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
                                        nodeStyle: {
                                            //color:'rgb(54,143,255)',
                                            brushType: 'both',
                                            borderColor: 'rgba(0,0,0,0)',
                                            borderWidth: 1
                                        },
                                        linkStyle: {
                                            type: 'curve',
                                            color: 'rgb(145,146,148)',
                                            borderColor: '#919294'
                                        }
                                    },
                                    emphasis: {
                                        label: {
                                            show: false
                                            // textStyle: null      // 默认使用全局文本样式
                                        },
                                        nodeStyle: {
                                            //r: 30
                                        },
                                        linkStyle: {}
                                    }
                                },
                                useWorker: false,
                                minRadius: 20,
                                maxRadius: 35,
                                gravity: 1,
                                scaling: 1.6,
                                roam: 'move',
                                nodes: node,
                                links: link
                            }]
                    };
                    treeChart.setOption(option);

                    treeChart.hideLoading();
                }

                function eConsole(param) {
                    if (typeof param.data.source == 'undefined') {
                        if (param.type == 'click') {
                            window.location.href = "/JWLetter/graph?word=" + param.name;
                        }
                    }
                }
            }
        });
    }
</script>
    