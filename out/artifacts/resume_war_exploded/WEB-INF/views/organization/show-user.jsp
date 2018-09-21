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
    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/request.js"></script>
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
        <tbody id="tbody">
        <%--<c:forEach items="${userList}" var="userList">
            <tr>
                <td>${userList.id}</td>
                <td>
                    <a href="selectInfoByUserId?userId=${userList.id}">${userList.trueName}</a>
                </td>
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
                    <a href="selectInfoByUserId?userId=${userList.id}">查看</a>
                </td>
            </tr>
        </c:forEach>--%>
        </tbody>
    </table>

    <div id="page"></div>
</div>


<script>
    var host = getHttpHost();
    $(document).ready(function(){
        //ajax请求后台数据
        getPageInfo();
        toPage();
        getSex();

    });
    //分页参数设置 这些全局变量关系到分页的功能
    //开始的页数
    var startAllAppoint = 0;
    //一页大小
    var limitAllAppoint = 10;
    var currentPageAllAppoint = 1;
    var totalPageAllAppoint = 0;
    var dataLength = 0;
    //ajax请求后台数据
    function getPageInfo(){
        $.ajax({
            type:"post",
            async:false,
            url: host+"/resume/organization/selectUser",
            data:{start:startAllAppoint, limit:limitAllAppoint},
            success:function(data,status){
                //data=eval("("+data+")");
                getInfo(data.root);
                startAllAppoint = data.currentResult;//当前页数(后台返回)
                totalPageAllAppoint = data.total;//总页数(后台返回)

            }
        });
    }

    //将性别转换成男女
    function getSex(){
        $('.sex').each(function () {
            if ($(this).text() == "false") {
                $(this).text("男");
            }
            if($(this).text() == "true") {
                $(this).text("女");
            }
        })
    }

    //分页用
    function toPage(){
        layui.use(['form', 'laypage', 'layedit','layer', 'laydate'], function() {
            var form = layui.form,
                layer = layui.layer,
                layedit = layui.layedit,
                laydate = layui.laydate,
                laypage = layui.laypage;

            var nums = 10;
            //调用分页
            laypage.render({
                elem: 'page'//对应的控件
                //,cont: 'paged'
                ,limit: limitAllAppoint
                ,count: totalPageAllAppoint //得到记录总数
                ,curr: currentPageAllAppoint //当前页
                ,jump: function(obj, first){
                    currentPageAllAppoint = obj.curr;
                    startAllAppoint = (obj.curr - 1);
                    //document.getElementById('biuuu_city_list').innerHTML = render(obj, obj.curr);
                    if(!first){ //一定要加此判断，否则初始时会无限刷新
                        getPageInfo();//一定要把翻页的ajax请求放到这里，不然会请求两次。
                        //location.href = '?page='+obj.curr;
                    }
                }
            });
        });
    };

    //填充表中数据
    function getInfo(data){
        var s = "<tr>";
        $.each(data,function(v,o){
            s+='<td>'+o.id+'</td>';
            s+='<td><a href="selectInfoByUserId?userId=' + o.id + '">'+o.trueName+'<a></td>';
            s+='<td class = "sex">'+o.sex+'</td>';
            s+='<td>'+o.age+'</td>';
            s+='<td>'+o.identityCard+'</td>';
            s+='<td>'+o.address+'</td>';
            s+='<td>'+o.phone+'</td>';
            s+='<td>'+o.email+'</td>';
            s+='<td><a href="selectInfoByUserId?userId=' + o.id + '">查看</a></td></tr>';
        });
        if(data.length>0){
            $("#tbody").html(s);
        }else{
            $("#tbody").append("<tr><td colspan='9' style='text-align: center;'>暂无数据</td></tr>");
        }
        getSex();
    }
</script>

</body>
</html>
