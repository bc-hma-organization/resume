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
            <colgroup>
                <col width="60">
                <col width="150">
                <col width="70">
                <col width="70">
                <col width="200">
                <col width="300">
                <col width="150">
                <col width="200">
                <col width="70">
            </colgroup>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>真实姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>身份证号码</th>
                    <th>地址</th>
                    <th>联系方式</th>
                    <th>邮箱</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${userList}" var="userList">
                    <tr>
                        <td>${userList.id}</td>
                        <td>${userList.trueName}</td>
                        <td>
                        <c:if test="${userList.sex}">男</c:if>
                        <c:if test="${!userList.sex}">女</c:if>
                        </td>
                        <td>${userList.age}</td>
                        <td>${userList.identityCard}</td>
                        <td>${userList.address}</td>
                        <td>${userList.phone}</td>
                        <td>${userList.email}</td>
                        <td>
                            <a href="#">查看</a>
                        </td>
                    </tr>
                </c:forEach>
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
