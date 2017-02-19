
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>智察 - 大数据关系洞察系统</title>
    <style type="text/css">
    .info-box-icon {
        border-top-left-radius: 2px;
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 2px;
        display: block;
        float: left;
        height: 60px;
        width: 90px;
        text-align: center;
        font-size: 45px;
        line-height: 90px;
        background: rgba(0, 0, 0, 0.2);
    }
    
    .info-box {
        display: block;
        min-height: 60px;
        background: #fff;
        width: 100%;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
        border-radius: 2px;
        margin-bottom: 15px;
    }
    
    .info-box-content {
        padding: 5px 10px;
        margin-left: 90px;
    }
    
    .titleList {
        margin-bottom: -30px;
        margin-left: 10px;
    }
    </style>
</head>

<body>
    <script src="js/echarts.min.js"></script>
    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon" style="background: #60C5C8 url('img/icon/趋势.png') no-repeat center;"></span>
                <div class="info-box-content" style="position: absolute;right: 120px;margin: 0 auto;top: 7px;text-align: center;"><span>彭州,PX</span>
                    <br><span>关键字</span></div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-aqua" style="background: #60C5C8 url('img/icon/赞同.png') no-repeat center"></span>
                <div class="info-box-content" style="position: absolute;right: 120px;margin: 0 auto;top: 7px;text-align: center;"><span>5524</span>
                    <br><span>正面信息</span></div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-aqua" style="background:#b3a3da url('img/icon/中立.png') no-repeat center"></span>
                <div class="info-box-content" style="position: absolute;right: 120px;margin: 0 auto;top: 7px;text-align: center;"><span>8133</span>
                    <br><span>中立信息</span></div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-aqua" style="background:#9cb460 url('img/icon/反对.png') no-repeat center"></span>
                <div class="info-box-content" style="position: absolute;right: 120px;margin: 0 auto;top: 7px;text-align: center;"><span>536</span>
                    <br><span>负面信息</span></div>
            </div>
        </div>
    </div>
    <div style="display: flex;display: -webkit-flex;justify-content: space-around;">
        <div style="width: 48%;height:500px;">
            <h4>全网声量走势</h4>
            <hr>
            <div id="saleTrend" style="width: 100%;height:90%"></div>
        </div>
        <div style="width:48%;height:500px;">
            <h4>负面舆情</h4>
            <hr>
            <div id="negativeOpinion" style="width: 100%;height: 90%">
                <img src="img/icon/负.png" height="20" width="20"><span class="titleList">老一辈留下的8个错误育儿经害了多少宝宝 扫码阅读手机版</span>
                <hr style="border:0;border-bottom:1px dashed #eee;margin-top:3px;">
                
                <img src="img/icon/负.png" height="20" width="20"><span class="titleList">拒绝干裂脱皮膏 最全的冬季唇部护理秘诀 扫码阅读手机版</span>
                <hr style="border:0;border-bottom:1px dashed #eee;margin-top:3px;">

                <img src="img/icon/负.png" height="20" width="20"><span class="titleList">车险费改一周年 车险赔付减少2%~3% 扫码阅读手机版</span>
                <hr style="border:0;border-bottom:1px dashed #eee;margin-top:3px;">

                <img src="img/icon/负.png" height="20" width="20"><span class="titleList">女生逼疯骗子 骗子：你不按套路出牌我要报警 扫码阅读手机版</span>
                <hr style="border:0;border-bottom:1px dashed #eee;margin-top:3px;">

                <img src="img/icon/负.png" height="20" width="20"><span class="titleList">郑步春：次新股系统性下跌 在跌后有望反弹 扫码阅读手机版</span>
                <hr style="border:0;border-bottom:1px dashed #eee;margin-top:3px;">

                <img src="img/icon/负.png" height="20" width="20"><span class="titleList">爆笑！韩国主播失误大合集 看到最后笑喷饭了 扫码阅读手机版</span>
                <hr style="border:0;border-bottom:1px dashed #eee;margin-top:3px;">

                <img src="img/icon/负.png" height="20" width="20"><span class="titleList">1月16日国内四大证券报纸头版头条内容精华摘要 扫码阅读手机版</span>

                <hr style="border:0;border-bottom:1px dashed #eee;margin-top:3px;">
                <img src="img/icon/负.png" height="20" width="20"><span class="titleList">四川农民工贵州讨薪被打7人伤 警方已立案调查 扫码阅读手机版</span>
                <hr style="border:0;border-bottom:1px dashed #eee;margin-top:3px;">

                <img src="img/icon/负.png" height="20" width="20"><span class="titleList">万达年会上王健林再展歌喉 挑战摇滚、黄梅戏 扫码阅读手机版</span>
                <hr style="border:0;border-bottom:1px dashed #eee;margin-top:3px;">

                <img src="img/icon/负.png" height="20" width="20"><span class="titleList">河北一酒店KTV发生爆炸现场 扫码阅读手机版</span>
                <hr style="border:0;border-bottom:1px dashed #eee;margin-top:3px;">


            </div>
        </div>
    </div>
    <br>
    <div style="display: flex;display: -webkit-flex;justify-content: space-around;">
        <div style="width:48%;height:500px;">
            <h4>来源分类</h4>
            <hr>
            <div id="sourceType" style="width: 100%;height: 90%">
            </div>
        </div>
        <div style="width:48%;height:500px;">
            <h4>媒体友好程度</h4>
            <hr>
            <div id="mediaFriend" style="width: 100%;height: 90%">
            </div>
        </div>
    </div>
    <br>
    <div style="display: flex;display: -webkit-flex;justify-content: space-around;">
        <div style="width:48%;height:500px;">
            <h4>网页搜索结果</h4>
            <hr>
            <div id="searchResult" style="width: 100%;height: 90%">
                <table class="table table-bordered table-hover">
                    <thead>
                        <td></td>
                        <td>快照时间</td>
                        <td>标题</td>
                        <td>url</td>
                    </thead>
                    <tbody>
                        <tr>
                            <td width="5%"><img src="img/icon/正.png" width="18px" height="18px"></td>
                            <td>2017-01-15 20:36</td>
                            <td>成都七中</td>
                            <td><a href="#">查看</a></td>
                        </tr>
                        <tr>
                            <td width="5%"><img src="img/icon/负.png" width="18px" height="18px"></td>
                            <td>2017-01-15 20:36</td>
                            <td>福建漳州...</td>
                            <td><a href="#">查看</a></td>
                        </tr>
                        <tr>
                            <td width="5%"><img src="img/icon/中.png" width="18px" height="18px"></td>
                            
                            <td>2017-01-15 20:36</td>
                            <td>伊顿9P...</td>
                            <td><a href="#">查看</a></td>
                        </tr>
                        <tr>
                            <td width="5%"><img src="img/icon/正.png" width="18px" height="18px"></td>

                            <td>2017-01-15 20:36</td>
                            <td>欧洲PX...</td>
                            <td><a href="#">查看</a></td>
                        </tr>
                        <tr>
                            <td width="5%"><img src="img/icon/负.png" width="18px" height="18px"></td>

                            <td>2017-01-15 20:36</td>
                            <td>广东广州...</td>
                            <td><a href="#">查看</a></td>
                        </tr>
                        <tr>
                            <td width="5%"><img src="img/icon/负.png" width="18px" height="18px"></td>

                            <td>2017-01-15 20:36</td>
                            <td>东莞叉车...</td>
                            <td><a href="#">查看</a></td>
                        </tr>
                        <tr>
                            <td width="5%"><img src="img/icon/正.png" width="18px" height="18px"></td>

                            <td>2017-01-15 20:36</td>
                            <td>PTA近...</td>
                            <td><a href="#">查看</a></td>
                        </tr>
                        <tr>
                            <td width="5%"><img src="img/icon/中.png" width="18px" height="18px"></td>

                            <td>2017-01-15 20:36</td>
                            <td>卡西欧电...</td>
                            <td><a href="#">查看</a></td>
                        </tr>
                        <tr>
                            <td width="5%"><img src="img/icon/正.png" width="18px" height="18px"></td>

                            <td>2017-01-15 20:36</td>
                            <td>须破解P...</td>
                            <td><a href="#">查看</a></td>
                        </tr>
                        <tr>
                            <td width="5%"><img src="img/icon/负.png" width="18px" height="18px"></td>

                            <td>2017-01-15 20:36</td>
                            <td>伊顿9P...</td>
                            <td><a href="#">查看</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div style="width:48%;height:500px;">
            <h4>舆情信息实时统计</h4>
            <hr>
            <div id="InfoStatic" style="width: 100%;height: 90%">
                <table class="table table-bordered table-hover">
                    <thead>
                        <td></td>
                        <td>今天</td>
                        <td>一周</td>
                        <td>两周</td>
                        <td>30天</td>
                    </thead>
                    <tbody>
                        <tr>
                            <td>新闻</td>
                            <td>467</td>
                            <td>11977</td>
                            <td>26676</td>
                            <td>50514</td>
                        </tr>
                        <tr>
                            <td>论坛</td>
                            <td>0</td>
                            <td>65</td>
                            <td>208</td>
                            <td>960</td>
                        </tr>
                        <tr>
                            <td>微博</td>
                            <td>467</td>
                            <td>11977</td>
                            <td>26676</td>
                            <td>50514</td>
                        </tr>
                        <tr>
                            <td>微信</td>
                            <td>94</td>
                            <td>1191</td>
                            <td>1773</td>
                            <td>3560</td>
                        </tr>
                        <tr>
                            <td>博客</td>
                            <td>1</td>
                            <td>262</td>
                            <td>888</td>
                            <td>1601</td>
                        </tr>
                        <tr>
                            <td>贴吧</td>
                            <td>0</td>
                            <td>232</td>
                            <td>383</td>
                            <td>496</td>
                        </tr>
                        <tr>
                            <td>问答</td>
                            <td>0</td>
                            <td>6</td>
                            <td>27</td>
                            <td>150</td>
                        </tr>
                        <tr>
                            <td>传统纸媒</td>
                            <td>19</td>
                            <td>396</td>
                            <td>1009</td>
                            <td>1283</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    var myChart = echarts.init(document.getElementById('saleTrend'));
    option = {
        // title: {
        //     text: '全网声量走势'
        // },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['新闻', '论坛', '微博', '微信公众号', '博客', '贴吧', '问答']
        },
        grid: {
            left: '0%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        // toolbox: {
        //     feature: {
        //         saveAsImage: {}
        //     }
        // },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '新闻',
            type: 'line',
            stack: '总量',
            data: [120, 132, 101, 134, 90, 230, 210],
            smooth: true
        }, {
            name: '论坛',
            type: 'line',
            stack: '总量',
            data: [220, 182, 191, 234, 290, 330, 310],
            smooth: true
        }, {
            name: '微博',
            type: 'line',
            stack: '总量',
            data: [150, 232, 201, 154, 190, 330, 410],
            smooth: true
        }, {
            name: '微信公众号',
            type: 'line',
            stack: '总量',
            data: [320, 332, 301, 334, 390, 330, 320],
            smooth: true
        }, {
            name: '博客',
            type: 'line',
            stack: '总量',
            data: [820, 932, 901, 934, 1290, 1330, 1320],
            smooth: true
        }, {
            name: '贴吧',
            type: 'line',
            stack: '总量',
            data: [430, 433, 450, 399, 400, 410, 420],
            smooth: true
        }, {
            name: '问答',
            type: 'line',
            stack: '总量',
            data: [250, 260, 255, 240, 230, 258, 251],
            smooth: true
        }]
    };
    myChart.setOption(option);

    var myChart = echarts.init(document.getElementById('sourceType'));
    option = {
        // title: {
        //     text: '来源分类',
        //     // subtext: '纯属虚构',
        //     x: 'center'
        // },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            x: 'center',
            y: 'bottom',
            data: ['新闻', '论坛', '微博', '微信公众号', '博客', '贴吧', '问答', '传统纸媒']
        },
        // toolbox: {
        //     show: true,
        //     feature: {
        //         mark: {
        //             show: true
        //         },
        //         dataView: {
        //             show: true,
        //             readOnly: false
        //         },
        //         magicType: {
        //             show: true,
        //             type: ['pie', 'funnel']
        //         },
        //         restore: {
        //             show: true
        //         },
        //         saveAsImage: {
        //             show: true
        //         }
        //     }
        // },
        calculable: true,
        series: [{
            name: '面积模式',
            type: 'pie',
            radius: [30, 110],
            center: ['50%', '50%'],
            roseType: 'area',
            data: [{
                value: 10,
                name: '新闻'
            }, {
                value: 5,
                name: '论坛'
            }, {
                value: 15,
                name: '微博'
            }, {
                value: 25,
                name: '微信公众号'
            }, {
                value: 20,
                name: '博客'
            }, {
                value: 35,
                name: '贴吧'
            }, {
                value: 30,
                name: '问答'
            }, {
                value: 40,
                name: '传统纸媒'
            }]
        }]

    };
    myChart.setOption(option);

    var myChart = echarts.init(document.getElementById('mediaFriend'));
    option = {

        tooltip: {
            trigger: 'item',
            formatter: "{b} : {c}%"
        },
        toolbox: {
            orient: 'vertical',
            top: 'center'
                // feature: {
                //     dataView: {
                //         readOnly: false
                //     },
                //     restore: {},
                //     saveAsImage: {}
                // }
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['北方网', '沈阳日报', '中国工业信息网', '福建日报', '莱芜新闻网', '教育连斩网', '商品与证券', '企汇网', '北方网', '大公网']
        },
        calculable: true,
        series: [


            {

                type: 'funnel',

                left: '20%',


                label: {
                    normal: {
                        position: 'left'
                    }
                },
                data: [{
                    value: 57,
                    name: '北方网'
                }, {
                    value: 20,
                    name: '沈阳日报'
                }, {
                    value: 62,
                    name: '中国工业信息网'
                }, {
                    value: 70,
                    name: '福建日报'
                }, {
                    value: 105,
                    name: '莱芜新闻网'
                }, {
                    value: 81,
                    name: '教育连斩网'
                }, {
                    value: 95,
                    name: '商品与证券'
                }, {
                    value: 130,
                    name: '企汇网'
                }, {
                    value: 111,
                    name: '北方网'
                }, {
                    value: 120,
                    name: '大公网'
                }]
            }
        ]
    };
    myChart.setOption(option);
    </script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>

</html>
