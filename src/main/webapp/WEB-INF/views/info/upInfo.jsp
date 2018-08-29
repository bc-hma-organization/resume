<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/menu/taglib.jsp"%>
<html>
<head>
    <title>个人经历</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ctx}/statics/css/font.css">
    <link rel="stylesheet" href="${ctx}/statics/layui/css/layui.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/statics/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/request.js"></script>
    <style type="text/css">
        .study_div{
            margin-top: 20px;
            border: solid 1px #0C0C0C;
            width: 80%;
            height: 50%;
            margin-left: 10%;
            text-align: center;
        }

        .work_div{
            margin-top: 5px;
            border: solid 1px #0C0C0C;
            width: 80%;
            height: 50%;
            margin-left: 10%;
            text-align: center;
        }

        .left_label{
            float: left;
            line-height: 36px;
        }

        .label_input{
            width: 250px;
            float: left;
        }

        .block_div{
            float: left;
            display: block;
        }
    </style>
</head>
<body>
    <div class="study_div">
        <div style="text-align: center;"><label style="font-size: large;">学习经历</label></div>
        <button class="layui-btn layui-btn-normal" style="float: right;margin-right: 5px;">添加</button>
        <div class="block_div">
            <label class="left_label">学习机构名:</label>
            <input type="text" name="company" class="layui-input label_input"  placeholder="">
        </div>
        <div class="block_div">
            <label class="left_label">学位：</label>
            <input type="text" name="position" class="layui-input label_input">
        </div>
    </div>
    <div class="work_div">

    </div>
</body>
</html>
