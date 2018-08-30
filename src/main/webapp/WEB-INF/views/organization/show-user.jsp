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
<head>
    <title>申请认证用户列表</title>
    <link rel="stylesheet" href="${ctx}/statics/layui/css/layui.css">
</head>
<body>
    <div style="width: 90%;height: 90%;margin-left: 30px">
        <table class="layui-table">
            <thead>
                <tr>
                    <th lay-data="{field:'id', width:60, sort: true}">ID</th>
                    <th lay-data="{field:'username', width:150">真实姓名</th>
                    <th lay-data="{field:'sex', width:100, sort: true}">性别</th>
                    <th lay-data="{field:'age', width:60}">年龄</th>
                    <th lay-data="{field:'ID', width:220}">身份证号码</th>
                    <th lay-data="{field:'area', width:220, sort: true}">地址</th>
                    <th lay-data="{field:'phone', width:220, sort: true}">联系方式</th>
                    <th lay-data="{field:'email', width:220}">邮箱</th>
                    <th lay-data="{field:'email', width:220}">操作</th>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <td>001</td>
                    <td>李四</td>
                    <td>男</td>
                    <td>23</td>
                    <td>461415199608091234</td>
                    <td>广东省广州市天河区</td>
                    <td>12345678903</td>
                    <td>123@qq.com</td>
                    <td>
                        <a href="#">查看</a>
                    </td>
                </tr>
            </tbody>
        </table>

        <div id="demo3"></div>
    </div>

    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script>
        layui.use(['laypage', 'layer'], function() {
            var laypage = layui.laypage, layer = layui.layer;
            //自定义首页、尾页、上一页、下一页文本
            laypage.render({
                elem: 'demo3'
                ,count: 70
                ,first: '首页'
                ,last: '尾页'
                ,prev: '<em>←</em>'
                ,next: '<em>→</em>'
            });
        })

    </script>

</body>
</html>
