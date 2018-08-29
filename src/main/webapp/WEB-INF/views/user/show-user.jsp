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
        <table class="layui-table" lay-data="{height:400, url:'/demo/table/user/', page:true, id:'test2', skin: 'row', even: true}">
            <thead>
            <tr>
                <th lay-data="{field:'id', width:60, sort: true}">ID</th>
                <th lay-data="{field:'username', width:150, templet: '#usernameTpl'}">真实姓名</th>
                <th lay-data="{field:'sex', width:100, sort: true, templet: '#sexTpl'}">性别</th>
                <th lay-data="{field:'city', width:60}">年龄</th>
                <th lay-data="{field:'sign', width:220}">身份证号码</th>
                <th lay-data="{field:'experience', width:220, sort: true}">地址</th>
                <th lay-data="{field:'score', width:220, sort: true}">联系方式</th>
                <th lay-data="{field:'classify', width:220}">邮箱</th>
            </tr>
            </thead>
        </table>
    </div>

    <script type="text/html" id="usernameTpl">
        <a href="/?table-demo-id={{d.id}}" class="layui-table-link" target="_blank">{{ d.username }}</a>
    </script>
    <script type="text/html" id="sexTpl">
        {{#  if(d.sex === '女'){ }}
        <span style="color: #F581B1;">{{ d.sex }}</span>
        {{#  } else { }}
        {{ d.sex }}
        {{#  } }}
    </script>
    <script type="text/html" id="barDemo1">
        <a class="layui-btn layui-btn-xs" lay-event="edit">工具性按钮</a>
    </script>
    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script>
        layui.use('table', function(){
            var table = layui.table;
        });
    </script>

</body>
</html>
