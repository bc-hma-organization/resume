<%--
  Created by IntelliJ IDEA.
  User: 区块链培训学院
  Date: 2018/8/29
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/menu/taglib.jsp"%>
<html>
<style>
    .big_box{
        background-color: #00F7DE;
        width: 90%;
        margin-left: 60px;
        margin-top: 30px;
    }
    .box_top{
        background-color: #1E9FFF;
        width: 100%;
        height: 70px;
    }
    .top_left{
        background-color: #01AAED;
        width: 60%;
        height: 100%;
        float: left;
    }
    .top_left p{
        margin-left: 30px;
        font-size: 30px;
        line-height: 70px;
    }
    .top_rigth{
        background-color: #2E2D3C;
        float: left;
        width: 38%;
        line-height: 70px;
        text-align: right;
    }
    .box_main{
        float: left;
        width: 100%;
        background-color: #8D8D8D;
    }
    .main_top{
        width: 100%;
        float: left;
    }
    .img_box{
        width: 150px;
        padding-left: 30px;
        padding-top: 30px;
        float: left;
    }
    .user_box{
        float: left;
        background-color: #40AFFE;
        height: 200px;
        width: 81%;
        padding-left: 30px;
        padding-top: 30px;
    }
    .main_botom{
        width: 100%;
        float: left;
    }
    .title_box p{
        line-height: 70px;
        padding-left: 40px;
        font-size: 26px;
    }
    .table_box{
        width: 100%;
    }
</style>
<head>
    <title>申请认证用户信息</title>
    <link rel="stylesheet" href="${ctx}/statics/layui/css/layui.css">
</head>
<body>
    <div class="big_box">
        <div class="box_top">
            <div class="top_left">
                <p>用户信息</p>
            </div>
            <div class="top_rigth">
                <button class="layui-btn">确认</button>
                <button class="layui-btn layui-btn-danger">否认</button>
                <button class="layui-btn layui-btn-warm">返回</button>
            </div>
        </div>
        <div class="box_main">
            <div class="main_top">
                <div class="img_box">
                    <img src="${ctx}/statics/images/back.jpg" width="150" height="200">
                </div>
                <div class="user_box">
                    用户信息
                </div>
            </div>
            <div class="main_botom">
                <div class="title_box">
                    <p>学习经历：</p>
                </div>
                <div class="table_box">
                    表格1
                </div>
                <div class="title_box">
                    <p>工作经历：</p>
                </div>
                <div class="table_box">
                    表格2
                </div>
            </div>

        </div>
    </div>

    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script>

    </script>

</body>
</html>
