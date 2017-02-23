<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html style="height: 100%" >
<head>
    <meta charset="utf-8">
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

<body style="height: 80%; margin: 0">
<jsp:include page="navigation.jsp"></jsp:include>
    <div id="container" style="height: 92%;width: 100%;margin-top: -20px;" ></div>
    <!-- 新添加的jQuery -->
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- End -->
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
    <script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    app.title = '热力图与百度地图扩展';

    var geoCoordMap = {
        "牛背山遭遇抢劫": [104.067923, 30.679943],
        "政府门口遭抢劫": [102.89916, 30.367481],
        "乐山广场持刀抢劫": [103.751548, 29.593577],
        "飞车抢劫": [104.00525, 30.677642],
        "成都两男子入室抢劫 一人被住户夺刀刺死": [104.116747, 30.629146],
        "成都市区光天化日下抢劫行人": [104.012135, 30.706204],
        "龙舟路发生银行抢劫案": [104.103019, 30.634199],
        "大白天在街上拦路抢劫": [104.103543, 30.673769],
        "成都双楠广福桥治安混乱摩托车抢劫路人": [104.03083, 30.651103],
        "成都一环路青羊小区站摩托车抢劫": [104.048142, 30.67807],
        "成都艺术职业学院发生入室执刀抢劫事件": [104.058893, 30.727375],
        "上池正街情侣宝马车内开车窗夜聊 惨遭歹徒持刀抢劫": [104.062702, 30.65758],
        "二环路，昨天亲眼看到抢劫": [104.05164, 30.632006],
        "我在大邑被抢劫了": [103.388452, 30.614941],
        "金沙府南新区附近抓抢劫犯": [104.028799, 30.681776],
        "成都三圣乡4A级风景区发生乡镇干部警察打人抢劫事件": [104.144941, 30.606584],
        "蜀蓉路发生暴力抢劫案砍伤被害人": [104.033542, 30.694509],
        "沙河公园，王贾路与大件路口发生一摩托车抢劫行人案件": [104.144351, 30.789092],
        "一环路附近接二连三的出现抢劫事件": [104.058585, 30.640807],
        "茶店子车站抢劫": [104.033915, 30.703095],
        " 宜宾高速公路南站遭持枪歹徒抢劫": [104.633019, 28.769675],
        "遭遇抢劫": [104.064329, 30.663156],
        "昨晚上9点过西月城公交站台抢劫": [104.067923, 30.679943],
        "北门驷马桥是抢劫者的天堂": [104.098105, 30.701102],
        "成都华联周大生金店遭抢劫，劫匪开枪伤及路人": [104.034717, 30.701517],
        "成都锦绣路大白天持刀抢劫": [104.080869, 30.631146],
        "四达投监会杨硕、吴李华、张渝莉盗窃500万": [104.067923, 30.679943],
        "岷山饭店附近多次盗窃": [104.073514, 30.654664],
        "成华区前锋小区发生入室盗窃": [104.097024, 30.685421],
        "青白江一晚发生三起盗窃案": [104.34643, 30.796354],
        "武侯区锦苑入室盗窃": [104.079483, 30.632937],
        "华阳连环盗窃案": [104.061642, 30.514656],
        "蓉上坊2期一月内遭两次入室盗窃": [104.099171, 30.654036],
        "成都两男子入室盗窃": [103.998896, 30.608872],
        "丽景华庭2期小区住户被入室盗窃": [104.01573, 30.656872],
        "玉双路附近小区有贼晚上爬窗盗窃": [104.101152, 30.661392],
        "故意伤害车娅婷的犯罪嫌疑人李斌于8月13日下午被成都警方抓获": [104.047813, 30.683117],
        "早上上班路上遇到打架": [104.09634, 30.66215],
        "10月22晚8点在二环路交大立交和学生打架": [104.040318, 30.721775],
        "玉林南路上宠物店打架事件": [104.064334, 30.62935],
        "一环路东三段公交车打架": [104.106935, 30.662468],
        "1路公交司机和乘客打架": [104.076958, 30.660574],
        "牛市口半夜打架": [104.109474, 30.648],
        "龙泉驿大面镇发生打架事件": [104.197995, 30.592412],
        "昨晚,在玉林南街,发生城管和群众斗殴事件": [104.068892, 30.629186],
        "11月25日，公交221，斗殴事件": [104.067923, 30.679943],
        "昨天下午北站西二路黑社会斗殴": [104.072673, 30.695696],
        "成都武警医院乱收费": [104.067923, 30.679943],
        "成都ETC乱收费": [102.89916, 30.367481],
        "成都一驾校乱收费 学员学费交清后又收钱": [103.868455, 30.651424],
        "成都海棠公馆业主维权 抗议森宇乱收费 强收费": [103.917545, 30.560885],
        "驾考新规后诸多钻空教练各种乱收费": [104.105551, 30.629906],
        "成都驾校乱收费之——天宇驾校": [104.10483, 30.678725],
        "按揭银行乱收费": [104.081618, 30.558936],
        "成都府河桥市场商家遭遇离奇“乱收费”": [104.069357, 30.696617],
        "成都华天阳光小区违规收费": [104.147588, 30.654992],
        "成都市成华区二仙桥石油社区乱收费": [104.127145, 30.690907],
        "成都蜀州驾校乱收费": [103.538957, 30.753915],
        "金牛区金科苑社区太凭白条就敢公开收费": [103.993319, 30.716126],
        "电子科大成都学院乱收费": [103.970822, 30.732007],
        "曝光郫县今日田园物管乱收费": [103.810323, 30.82708],
        "成都华阳新车站乱收费": [104.061642, 30.514656],
        "成都天欣驾校教练吴艳林车牌川A2449学 乱收费": [104.067923, 30.679943],
        "成都市新都一中某班乱收费": [104.067923, 30.679943],
        "成都出租车司机态度太差乱收费": [104.079847, 30.69481],
        "不交钱不准坐电梯": [104.069304, 30.658027],
        "高朋大道3号电瓶车停放点乱收费": [104.047387, 30.632607],
        "呼吁抵制成都占道乱收费，保护自己的权益": [104.034876, 30.65405],
        "成都官二代故意杀人法院判一审放人": [104.067923, 30.679943],
        "1月29日盐源县杀人案": [104.067923, 30.679943],
        "成都男吸毒生幻觉将儿子扔下2楼": [103.970875, 30.63712],
        "运渣车又杀人了": [104.121639, 30.658066],
        "成都一女子杀死男友女儿藏尸冰柜获死刑 ": [104.068053, 30.679803],
        "成都橄榄风情杀人案": [104.067923, 30.679943],
        "川大江安校区再发杀人命案": [105.128778, 28.663533],
        "关于成都市青白江区胡孝林涉嫌行贿的举报材料": [104.34643, 30.796354],
        "监守自盗 黑心货运 余氏东风": [104.067923, 30.679943],
        "成都高新区吕奉平中西医门诊部是个黑心诊所": [103.553321, 31.448079],
        "黑心汽车修理厂，成都新奔宝黑心汽车修理厂": [103.993111, 30.602386],
        "黑心幼儿园毒害小孩": [103.973158, 30.762543],
        "成都瑞吉总厨的黑心": [104.067923, 30.679943],
        "曝光黑心佃祥房产中介公司": [104.067923, 30.679943],
        "成都黑心房东曝光": [104.06832, 30.679395],
        "成都黑心公立医院大家一定要关注谨防上当": [104.083131, 30.666284],
        "成都黑心驾校教练": [104.11408, 30.694738],
        "黑心的开发商‘双流华兴建筑公司’": [103.942554, 30.578528],
        "被黑心中介坑惨了，在犀浦租房的朋友一定不要找“富嘉”房产 彭斌": [103.969966, 30.766613],
        "成都联合一百果业 黑心内幕": [103.870506, 30.8025],
        "成都，市政管道太黑心，有图有真相": [104.037433, 30.690561],
        "成都紫荆紫竹北二街翔宇茶楼是黑心茶楼": [104.061928, 30.617157],
        "成都康泰宠物医院，为了赚黑心钱想切掉我家大宝的手指": [104.101361, 30.620033],
        "曝光成都黑心的哥": [104.12378, 30.62008],
        "九里堤中路南门十字路口黑心咖啡馆": [104.063987, 30.704993],
        "成都满城房产黑心黑心恶心": [104.090326, 30.647449],
        "成都阿玛施专卖店黑心欺压员工": [104.067923, 30.679943],
        "龙泉驿玺城的黑心开发商": [104.274704, 30.55462],
        "在双流县华阳镇遭遇黑心房东": [104.06303, 30.537114],
        "成都市中国移动芳草营业厅手机维修，吃黑心钱": [104.066107, 30.639154],
        "黑心的成都仁和春天光华店": [104.075531, 30.664112],
        "成都蓝光金荷花市场无良苦命商家遭遇黑心物管暴力威肋": [104.083413, 30.694994]
    };

    var data = [{
        name: "牛背山遭遇抢劫",
        value: 10
    }, {
        name: "政府门口遭抢劫",
        value: 10.17938921
    }, {
        name: "乐山广场持刀抢劫",
        value: 13.74079795
    }, {
        name: "飞车抢劫",
        value: 13.79535539
    }, {
        name: "成都两男子入室抢劫 一人被住户夺刀刺死",
        value: 15.51066309
    }, {
        name: "成都市区光天化日下抢劫行人",
        value: 15.58310526
    }, {
        name: "龙舟路发生银行抢劫案",
        value: 15.59773821
    }, {
        name: "大白天在街上拦路抢劫",
        value: 15.60225456
    }, {
        name: "成都双楠广福桥治安混乱摩托车抢劫路人",
        value: 15.62050059
    }, {
        name: "成都一环路青羊小区站摩托车抢劫",
        value: 17.24421682
    }, {
        name: "成都艺术职业学院发生入室执刀抢劫事件",
        value: 17.24530074
    }, {
        name: "上池正街情侣宝马车内开车窗夜聊 惨遭歹徒持刀抢劫",
        value: 17.28179281
    }, {
        name: "二环路，昨天亲眼看到抢劫",
        value: 17.30076146
    }, {
        name: "我在大邑被抢劫了",
        value: 17.33165325
    }, {
        name: "金沙府南新区附近抓抢劫犯",
        value: 17.35206713
    }, {
        name: "成都三圣乡4A级风景区发生乡镇干部警察打人抢劫事件",
        value: 17.35513825
    }, {
        name: "蜀蓉路发生暴力抢劫案砍伤被害人",
        value: 17.36814532
    }, {
        name: "沙河公园，王贾路与大件路口发生一摩托车抢劫行人案件",
        value: 19.0682781
    }, {
        name: "一环路附近接二连三的出现抢劫事件",
        value: 19.08435629
    }, {
        name: "茶店子车站抢劫",
        value: 19.0850789
    }, {
        name: " 宜宾高速公路南站遭持枪歹徒抢劫",
        value: 19.08598217
    }, {
        name: "遭遇抢劫",
        value: 19.08634348
    }, {
        name: "昨晚上9点过西月城公交站台抢劫",
        value: 19.08760805
    }, {
        name: "北门驷马桥是抢劫者的天堂",
        value: 19.08851132
    }, {
        name: "成都华联周大生金店遭抢劫，劫匪开枪伤及路人",
        value: 19.08869198
    }, {
        name: "成都锦绣路大白天持刀抢劫",
        value: 19.10495082
    }, {
        name: "四达投监会杨硕、吴李华、张渝莉盗窃500万",
        value: 19.13909438
    }, {
        name: "岷山饭店附近多次盗窃",
        value: 19.14053961
    }, {
        name: "成华区前锋小区发生入室盗窃",
        value: 19.15697911
    }, {
        name: "青白江一晚发生三起盗窃案",
        value: 19.17739299
    }, {
        name: "武侯区锦苑入室盗窃",
        value: 19.17865756
    }, {
        name: "华阳连环盗窃案",
        value: 19.19419379
    }, {
        name: "蓉上坊2期一月内遭两次入室盗窃",
        value: 19.19437444
    }, {
        name: "成都两男子入室盗窃",
        value: 19.19618098
    }, {
        name: "丽景华庭2期小区住户被入室盗窃",
        value: 19.1972649
    }, {
        name: "玉双路附近小区有贼晚上爬窗盗窃",
        value: 19.21334309
    }, {
        name: "故意伤害车娅婷的犯罪嫌疑人李斌于8月13日下午被成都警方抓获",
        value: 19.23321501
    }, {
        name: "早上上班路上遇到打架",
        value: 19.23339566
    }, {
        name: "10月22晚8点在二环路交大立交和学生打架",
        value: 20.87608054
    }, {
        name: "玉林南路上宠物店打架事件",
        value: 20.87626119
    }, {
        name: "一环路东三段公交车打架",
        value: 20.89053284
    }, {
        name: "1路公交司机和乘客打架",
        value: 20.89486853
    }, {
        name: "牛市口半夜打架",
        value: 20.91239195
    }, {
        name: "龙泉驿大面镇发生打架事件",
        value: 20.91383718
    }, {
        name: "昨晚,在玉林南街,发生城管和群众斗殴事件",
        value: 20.9266636
    }, {
        name: "11月25日，公交221，斗殴事件",
        value: 20.92792817
    }, {
        name: "昨天下午北站西二路黑社会斗殴",
        value: 20.93154125
    }, {
        name: "成都武警医院乱收费",
        value: 20.93190256
    }, {
        name: "成都ETC乱收费",
        value: 20.96460089
    }, {
        name: "成都一驾校乱收费 学员学费交清后又收钱",
        value: 20.96478154
    }, {
        name: "成都海棠公馆业主维权 抗议森宇乱收费 强收费",
        value: 20.98483411
    }, {
        name: "驾考新规后诸多钻空教练各种乱收费",
        value: 20.98537608
    }, {
        name: "成都驾校乱收费之——天宇驾校",
        value: 21.03523652
    }, {
        name: "按揭银行乱收费",
        value: 22.64413914
    }, {
        name: "成都府河桥市场商家遭遇离奇“乱收费”",
        value: 22.64540372
    }, {
        name: "成都华天阳光小区违规收费",
        value: 22.66093994
    }, {
        name: "成都市成华区二仙桥石油社区乱收费",
        value: 22.66238517
    }, {
        name: "成都蜀州驾校乱收费",
        value: 22.66527563
    }, {
        name: "金牛区金科苑社区太凭白条就敢公开收费",
        value: 22.69996116
    }, {
        name: "电子科大成都学院乱收费",
        value: 22.71549739
    }, {
        name: "曝光郫县今日田园物管乱收费",
        value: 22.72001373
    }, {
        name: "成都华阳新车站乱收费",
        value: 22.75198945
    }, {
        name: "成都天欣驾校教练吴艳林车牌川A2449学 乱收费",
        value: 22.7713194
    }, {
        name: "成都市新都一中某班乱收费",
        value: 22.79028805
    }, {
        name: "成都出租车司机态度太差乱收费",
        value: 22.79101067
    }, {
        name: "不交钱不准坐电梯",
        value: 22.80853408
    }, {
        name: "高朋大道3号电瓶车停放点乱收费",
        value: 22.8260575
    }, {
        name: "呼吁抵制成都占道乱收费，保护自己的权益",
        value: 22.84448419
    }, {
        name: "成都官二代故意杀人法院判一审放人",
        value: 22.84611007
    }, {
        name: "1月29日盐源县杀人案",
        value: 24.45212223
    }, {
        name: "成都男吸毒生幻觉将儿子扔下2楼",
        value: 24.45230288
    }, {
        name: "运渣车又杀人了",
        value: 24.47091022
    }, {
        name: "成都一女子杀死男友女儿藏尸冰柜获死刑 ",
        value: 24.50415052
    }, {
        name: "成都橄榄风情杀人案",
        value: 24.50523444
    }, {
        name: "川大江安校区再发杀人命案",
        value: 24.52203525
    }, {
        name: "关于成都市青白江区胡孝林涉嫌行贿的举报材料",
        value: 24.64957682
    }, {
        name: "监守自盗 黑心货运 余氏东风",
        value: 24.65300924
    }, {
        name: "成都高新区吕奉平中西医门诊部是个黑心诊所",
        value: 26.29406823
    }, {
        name: "黑心汽车修理厂，成都新奔宝黑心汽车修理厂",
        value: 26.29677804
    }, {
        name: "黑心幼儿园毒害小孩",
        value: 26.31502407
    }, {
        name: "成都瑞吉总厨的黑心",
        value: 26.34790306
    }, {
        name: "曝光黑心佃祥房产中介公司",
        value: 26.40047331
    }, {
        name: "成都黑心房东曝光",
        value: 26.40101527
    }, {
        name: "成都黑心公立医院大家一定要关注谨防上当",
        value: 26.42016458
    }, {
        name: "成都黑心驾校教练",
        value: 28.11812951
    }, {
        name: "黑心的开发商‘双流华兴建筑公司’",
        value: 28.15389896
    }, {
        name: "被黑心中介坑惨了，在犀浦租房的朋友一定不要找“富嘉”房产 彭斌",
        value: 28.15462158
    }, {
        name: "成都联合一百果业 黑心内幕",
        value: 28.17160303
    }, {
        name: "成都，市政管道太黑心，有图有真相",
        value: 28.24820024
    }, {
        name: "成都紫荆紫竹北二街翔宇茶楼是黑心茶楼",
        value: 28.26482038
    }, {
        name: "成都康泰宠物医院，为了赚黑心钱想切掉我家大宝的手指",
        value: 29.90732461
    }, {
        name: "曝光成都黑心的哥",
        value: 29.90750526
    }, {
        name: "九里堤中路南门十字路口黑心咖啡馆",
        value: 29.90786657
    }, {
        name: "成都满城房产黑心黑心恶心",
        value: 29.90913115
    }, {
        name: "成都阿玛施专卖店黑心欺压员工",
        value: 29.91057638
    }, {
        name: "龙泉驿玺城的黑心开发商",
        value: 29.96134009
    }, {
        name: "在双流县华阳镇遭遇黑心房东",
        value: 29.97868285
    }, {
        name: "成都市中国移动芳草营业厅手机维修，吃黑心钱",
        value: 29.98265724
    }, {
        name: "黑心的成都仁和春天光华店",
        value: 30.01517492
    }, {
        name: "成都蓝光金荷花市场无良苦命商家遭遇黑心物管暴力威肋",
        value: 30
    }];
    var categoryMap = {
        "牛背山遭遇抢劫": "抢劫",
        "政府门口遭抢劫": "抢劫",
        "乐山广场持刀抢劫": "抢劫",
        "飞车抢劫": "抢劫",
        "成都两男子入室抢劫 一人被住户夺刀刺死": "抢劫",
        "成都市区光天化日下抢劫行人": "抢劫",
        "龙舟路发生银行抢劫案": "抢劫",
        "大白天在街上拦路抢劫": "抢劫",
        "成都双楠广福桥治安混乱摩托车抢劫路人": "抢劫",
        "成都一环路青羊小区站摩托车抢劫": "抢劫",
        "成都艺术职业学院发生入室执刀抢劫事件": "抢劫",
        "上池正街情侣宝马车内开车窗夜聊 惨遭歹徒持刀抢劫": "抢劫",
        "二环路，昨天亲眼看到抢劫": "抢劫",
        "我在大邑被抢劫了": "抢劫",
        "金沙府南新区附近抓抢劫犯": "抢劫",
        "成都三圣乡4A级风景区发生乡镇干部警察打人抢劫事件": "抢劫",
        "蜀蓉路发生暴力抢劫案砍伤被害人": "抢劫",
        "沙河公园，王贾路与大件路口发生一摩托车抢劫行人案件": "抢劫",
        "一环路附近接二连三的出现抢劫事件": "抢劫",
        "茶店子车站抢劫": "抢劫",
        " 宜宾高速公路南站遭持枪歹徒抢劫": "抢劫",
        "遭遇抢劫": "抢劫",
        "昨晚上9点过西月城公交站台抢劫": "抢劫",
        "北门驷马桥是抢劫者的天堂": "抢劫",
        "成都华联周大生金店遭抢劫，劫匪开枪伤及路人": "抢劫",
        "成都锦绣路大白天持刀抢劫": "抢劫",
        "四达投监会杨硕、吴李华、张渝莉盗窃500万": "盗窃",
        "岷山饭店附近多次盗窃": "盗窃",
        "成华区前锋小区发生入室盗窃": "盗窃",
        "青白江一晚发生三起盗窃案": "盗窃",
        "武侯区锦苑入室盗窃": "盗窃",
        "华阳连环盗窃案": "盗窃",
        "蓉上坊2期一月内遭两次入室盗窃": "盗窃",
        "成都两男子入室盗窃": "盗窃",
        "丽景华庭2期小区住户被入室盗窃": "盗窃",
        "玉双路附近小区有贼晚上爬窗盗窃": "盗窃",
        "故意伤害车娅婷的犯罪嫌疑人李斌于8月13日下午被成都警方抓获": "故意伤害",
        "早上上班路上遇到打架": "打架斗殴",
        "10月22晚8点在二环路交大立交和学生打架": "打架斗殴",
        "玉林南路上宠物店打架事件": "打架斗殴",
        "一环路东三段公交车打架": "打架斗殴",
        "1路公交司机和乘客打架": "打架斗殴",
        "牛市口半夜打架": "打架斗殴",
        "龙泉驿大面镇发生打架事件": "打架斗殴",
        "昨晚,在玉林南街,发生城管和群众斗殴事件": "打架斗殴",
        "11月25日，公交221，斗殴事件": "打架斗殴",
        "昨天下午北站西二路黑社会斗殴": "打架斗殴",
        "成都武警医院乱收费": "乱收费",
        "成都ETC乱收费": "乱收费",
        "成都一驾校乱收费 学员学费交清后又收钱": "乱收费",
        "成都海棠公馆业主维权 抗议森宇乱收费 强收费": "乱收费",
        "驾考新规后诸多钻空教练各种乱收费": "乱收费",
        "成都驾校乱收费之——天宇驾校": "乱收费",
        "按揭银行乱收费": "乱收费",
        "成都府河桥市场商家遭遇离奇“乱收费”": "乱收费",
        "成都华天阳光小区违规收费": "乱收费",
        "成都市成华区二仙桥石油社区乱收费": "乱收费",
        "成都蜀州驾校乱收费": "乱收费",
        "金牛区金科苑社区太凭白条就敢公开收费": "乱收费",
        "电子科大成都学院乱收费": "乱收费",
        "曝光郫县今日田园物管乱收费": "乱收费",
        "成都华阳新车站乱收费": "乱收费",
        "成都天欣驾校教练吴艳林车牌川A2449学 乱收费": "乱收费",
        "成都市新都一中某班乱收费": "乱收费",
        "成都出租车司机态度太差乱收费": "乱收费",
        "不交钱不准坐电梯": "乱收费",
        "高朋大道3号电瓶车停放点乱收费": "乱收费",
        "呼吁抵制成都占道乱收费，保护自己的权益": "乱收费",
        "成都官二代故意杀人法院判一审放人": "杀人",
        "1月29日盐源县杀人案": "杀人",
        "成都男吸毒生幻觉将儿子扔下2楼": "杀人",
        "运渣车又杀人了": "杀人",
        "成都一女子杀死男友女儿藏尸冰柜获死刑 ": "杀人",
        "成都橄榄风情杀人案": "杀人",
        "川大江安校区再发杀人命案": "杀人",
        "关于成都市青白江区胡孝林涉嫌行贿的举报材料": "行贿",
        "监守自盗 黑心货运 余氏东风": "其他",
        "成都高新区吕奉平中西医门诊部是个黑心诊所": "其他",
        "黑心汽车修理厂，成都新奔宝黑心汽车修理厂": "其他",
        "黑心幼儿园毒害小孩": "其他",
        "成都瑞吉总厨的黑心": "其他",
        "曝光黑心佃祥房产中介公司": "其他",
        "成都黑心房东曝光": "其他",
        "成都黑心公立医院大家一定要关注谨防上当": "其他",
        "成都黑心驾校教练": "其他",
        "黑心的开发商‘双流华兴建筑公司’": "其他",
        "被黑心中介坑惨了，在犀浦租房的朋友一定不要找“富嘉”房产 彭斌": "其他",
        "成都联合一百果业 黑心内幕": "其他",
        "成都，市政管道太黑心，有图有真相": "其他",
        "成都紫荆紫竹北二街翔宇茶楼是黑心茶楼": "其他",
        "成都康泰宠物医院，为了赚黑心钱想切掉我家大宝的手指": "其他",
        "曝光成都黑心的哥": "其他",
        "九里堤中路南门十字路口黑心咖啡馆": "其他",
        "成都满城房产黑心黑心恶心": "其他",
        "成都阿玛施专卖店黑心欺压员工": "其他",
        "龙泉驿玺城的黑心开发商": "其他",
        "在双流县华阳镇遭遇黑心房东": "其他",
        "成都市中国移动芳草营业厅手机维修，吃黑心钱": "其他",
        "黑心的成都仁和春天光华店": "其他",
        "成都蓝光金荷花市场无良苦命商家遭遇黑心物管暴力威肋": "其他",
    }
    var convertData = function(data) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var geoCoord = geoCoordMap[data[i].name];
            var value = geoCoord.concat(data[i].value)
            var category1 = categoryMap[data[i].name]
            value = value.concat(category1)
            if (geoCoord) {
                res.push({
                    name: data[i].name,
                    value: value
                    // value: geoCoord.concat(data[i].value)
                    // category: value.concat(category1)
                });
            }
        }
        return res;
    };

    var convertedData = [
        convertData(data),
        convertData(data.sort(function(a, b) {
            return b.value - a.value;
        }).slice(0, 5))
    ];
    // regularData = convertedData[0]

    option = {
        backgroundColor: '#404a59',
        animation: true,
        animationDuration: 1000,
        animationEasing: 'cubicInOut',
        animationDurationUpdate: 1000,
        animationEasingUpdate: 'cubicInOut',
        title: [
            // {
            //     text: '全国主要城市 交易量',
            //     subtext: 'data from yunqicl',
            //     left: 'center',
            //     textStyle: {
            //         color: '#fff'
            //     }
            // },
            {
                id: 'statistic',
                right: 120,
                top: 40,
                width: 100,
                textStyle: {
                    color: '#fff',
                    fontSize: 16
                }
            }
        ],
        toolbox: {
            iconStyle: {
                normal: {
                    borderColor: '#fff'
                },
                emphasis: {
                    borderColor: '#b1e4ff'
                }
            },
            feature: {
                dataZoom: {},
                brush: {
                    type: ['rect', 'polygon', 'clear']
                },
                saveAsImage: {
                    show: true
                }
            }
        },
        brush: {
            outOfBrush: {
                color: '#abc'
            },
            brushStyle: {
                borderWidth: 2,
                color: 'rgba(0,0,0,0.2)',
                borderColor: 'rgba(0,0,0,0.5)',
            },
            seriesIndex: [0, 1],
            throttleType: 'debounce',
            throttleDelay: 300,
            geoIndex: 0
        },
        bmap: {
            // map: 'china',
            right: '100',
            // right: '55%',
            center: [104.20, 30.67],
            zoom: 2.5,
            label: {
                emphasis: {
                    show: false
                }
            },
            roam: true,
            itemStyle: {
                normal: {
                    areaColor: '#323c48',
                    borderColor: '#111'
                },
                emphasis: {
                    areaColor: '#2a333d'
                }
            }
        },
        tooltip: {
            trigger: 'item'
        },
        grid: {
            right: 30,
            top: 100,
            bottom: 40,
            width: '30%'
        },
        xAxis: {
            type: 'value',
            scale: true,
            position: 'top',
            boundaryGap: false,
            splitLine: {
                show: false
            },
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 2,
                textStyle: {
                    color: '#aaa'
                }
            },
        },
        yAxis: {
            type: 'category',
            name: 'TOP 20',
            nameGap: 16,
            axisLine: {
                show: false,
                lineStyle: {
                    color: '#ddd'
                }
            },
            axisTick: {
                show: false,
                lineStyle: {
                    color: '#ddd'
                }
            },
            axisLabel: {
                interval: 0,
                textStyle: {
                    color: '#ddd'
                }
            },
            data: []
        },
        series: [{
            // name: category.regularData.name,
            type: 'scatter',
            coordinateSystem: 'bmap',
            data: convertedData[0],
            symbolSize: function(val) {
                return Math.max(val[2] / 10, 8);
            },
            label: {
                normal: {
                    formatter: '{c}',
                    position: 'right',
                    show: false
                },
                emphasis: {
                    show: true
                }
            },
            itemStyle: {
                normal: {
                    color: '#ddb926'
                }
            }
        }, {
            name: 'Top 5',
            type: 'effectScatter',
            coordinateSystem: 'bmap',
            data: convertedData[1],
            symbolSize: function(val) {
                return Math.max(val[2] / 10, 8);
            },
            showEffectOn: 'emphasis',
            rippleEffect: {
                brushType: 'stroke'
            },
            hoverAnimation: true,
            label: {
                normal: {
                    formatter: '{b}',
                    position: 'right',
                    show: true
                }
            },
            itemStyle: {
                normal: {
                    color: '#f4e925',
                    shadowBlur: 10,
                    shadowColor: '#333'
                }
            },
            zlevel: 1
        }, {
            id: 'bar',
            zlevel: 2,
            type: 'bar',
            symbol: 'none',
            itemStyle: {
                normal: {
                    color: '#ddb926'
                }
            },
            data: []
        }]
    };


    myChart.on('brushselected', renderBrushed);

    // myChart.setOption(option);

    setTimeout(function() {
        myChart.dispatchAction({
            type: 'brush',
            areas: [{
                geoIndex: 0,
                brushType: 'polygon',
                coordRange: [
                    [103.50, 30.43],
                    [103.50, 30.63],
                    [104.20, 30.89],
                    [104.45, 30.89]
                ]
            }]
        });
    }, 0);


    function renderBrushed(params) {
        var bmap = myChart.getModel().getComponent('bmap').getBMap();
        bmap.disableDragging();

        var mainSeries = params.batch[0].selected[0];

        var selectedItems = [];
        var categoryData = [];
        var barData = [];
        var maxBar = 30;
        var sum = 0;
        var count = 0;

        for (var i = 0; i < mainSeries.dataIndex.length; i++) {
            var rawIndex = mainSeries.dataIndex[i];
            var dataItem = convertedData[0][rawIndex];
            var pmValue = dataItem.value[2];

            sum += pmValue;
            count++;

            selectedItems.push(dataItem);
        }

        selectedItems.sort(function(a, b) {
            return a.value[2] - b.value[2];
        });

        for (var i = 0; i < Math.min(selectedItems.length, maxBar); i++) {
            categoryData.push(selectedItems[i].name);
            barData.push(selectedItems[i].value[2]);
        }

        this.setOption({
            yAxis: {
                data: categoryData
            },
            xAxis: {
                axisLabel: {
                    show: !!count
                }
            },
            title: {
                id: 'statistic',
                text: count ? '平均: ' + (sum / count).toFixed(4) : ''
            },
            series: {
                id: 'bar',
                data: barData
            }
        });
    }
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
    if (!app.inNode) {
        // 添加百度地图插件
        var bmap = myChart.getModel().getComponent('bmap').getBMap();
        bmap.addControl(new BMap.MapTypeControl({
            anchor: BMAP_ANCHOR_TOP_LEFT
        }));
        bmap.setMapStyle({
            style: 'midnight'
        });
        bmap.centerAndZoom(new BMap.Point(104.20, 30.67), 11);
        var local = new BMap.LocalSearch(bmap, {
            renderOptions: {
                map: bmap
            }
        })
        bmap.disableDragging();

        var myKeys = ["公安局", "派出所"];
        // local.search("派出所");
        local.searchInBounds(myKeys, bmap.getBounds());
        // local.search("公安局");
        bmap.centerAndZoom(new BMap.Point(104.20, 30.67), 11);

    }
    </script>
</body>

</html>
