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
    <title>申请认证用户信息</title>
    <link rel="stylesheet" href="${ctx}/statics/layui/css/layui.css">
    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/request.js"></script>
    <style>
        .big_box{
            width: 90%;
            margin-left: 60px;
            margin-top: 30px;
            margin-bottom: 40px;
        }
        .box_top{
            width: 100%;
            height: 70px;
        }
        .top_left{
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
            float: left;
            width: 38%;
            line-height: 70px;
            text-align: right;
        }
        .box_main{
            float: left;
            width: 100%;
        }
        .main_top{
            width: 100%;
            float: left;
            padding-bottom: 20px;
            border-bottom: 1px solid #8D8D8D;

        }
        .img_box{
            width: 150px;
            padding-left: 30px;
            padding-top: 30px;
            float: left;
        }
        .user_box{
            float: left;
            height: 200px;
            width: 75%;
            padding-left: 30px;
            padding-top: 30px;
        }
        .main_botom{
            width: 100%;
            float: left;
            padding-bottom: 30px;
        }
        .title_box p{
            line-height: 70px;
            padding-left: 40px;
            font-size: 26px;
        }
        .table_box{
            padding-left: 30px;
            width: 100%;
        }
        .user_box table{
            border-collapse: separate;
            border-spacing: 30px;
            width: 100%;
        }
        .table_box table{
            border-collapse: separate;
            border-spacing: 10px;
            width: 100%;
        }
        .top_rigth p{
            display: inline-block;
            font-size: 24px;
            width: 200px;
        }
        .select_box{
            width: 385px;
            height: 70px;
        }
    </style>
</head>
<body>
<div class="big_box">
    <div class="box_top">
        <div class="top_left">
            <p>用户信息</p>
        </div>
        <div class="top_rigth">
            <c:if test="${infoList.get(0).status == 0}">
                <button onclick="sub(1)" class="layui-btn">确认</button>
                <button onclick="sub(-1)" class="layui-btn layui-btn-danger">否认</button>
                <button onclick="javascript:history.back(-1)" class="layui-btn layui-btn-warm">返回</button>
            </c:if>
            <c:if test="${infoList.get(0).status != 0}">
                <div class="select_box">
                    <p>该信息已经认证！</p>
                    <button onclick="javascript:history.back(-1)" class="layui-btn layui-btn-warm">返回</button>

                </div>
            </c:if>
        </div>
    </div>
    <div class="box_main">
        <div class="main_top">
            <div class="img_box">
                <img src="${ctx}/statics/images/back.jpg" width="150" height="200">
            </div>
            <div class="user_box">
                <table>
                    <colgroup>
                        <col width="40%">
                        <col width="30%">
                        <col width="30%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td>
                            <span>真实姓名：</span>
                            <span>${userInfo.trueName}</span>
                        </td>
                        <td>
                            <span>性别：</span>
                            <span>
                                        <c:if test="${userList.sex}">男</c:if>
                                        <c:if test="${!userList.sex}">女</c:if>
                                    </span>
                        </td>
                        <td>
                            <span>年龄：</span>
                            <span>${userInfo.age}</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>地址：</span>
                            <span>${userInfo.address}</span>
                        </td>
                        <td>
                            <span>联系方式：</span>
                            <span>${userInfo.phone}</span>
                        </td>
                        <td>
                            <span>邮箱：</span>
                            <span>${userInfo.email}</span>
                        </td>
                    </tr>
                    <tr>
                        <td id="IDCart">
                            <span>身份证号码：</span>
                            <span>${userInfo.identityCard}</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="main_botom">
            <c:if test="${not empty infoList.get(0).position}">
                <div class="title_box">
                    <p>学习经历：</p>
                </div>
                <div class="table_box">
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="10%">
                            <col width="20%">
                            <col width="10%">
                            <col width="10%">
                            <col width="40%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>起始时间</th>
                            <th>终止时间</th>
                            <th>所在学校</th>
                            <th>学历</th>
                            <th>学位</th>
                            <th>描述</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${infoList}" var="infoList">
                            <input name="ids" type="hidden" value="${infoList.id}">
                            <tr>
                                <th class="startTime">${infoList.startTime}</th>
                                <th class="endTime">${infoList.endTime}</th>
                                <th>${infoList.company}</th>
                                <th>${infoList.education}</th>
                                <th>${infoList.position}</th>
                                <th>
                                    <c:if test=" ${empty infoList.description}">无</c:if>
                                    <c:if test=" ${not empty infoList.description}">${infoList.description}</c:if>
                                </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${empty infoList.get(0).position}">
                <div class="title_box">
                    <p>工作经历：</p>
                </div>
                <div class="table_box">
                    <table>
                        <colgroup>
                            <col width="13%">
                            <col width="13%">
                            <col width="20%">
                            <col width="13%">
                            <col width="40%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>起始时间</th>
                            <th>终止时间</th>
                            <th>所在单位</th>
                            <th>职务</th>
                            <th>描述</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${infoList}" var="infoList">
                            <input name="ids" type="text" style="display: none" value="${infoList.id}">
                            <tr>
                                <th class="startTime">${infoList.startTime}</th>
                                <th class="endTime">${infoList.endTime}</th>
                                <th>${infoList.company}</th>
                                <th>${infoList.education}</th>
                                <th>${infoList.position}</th>
                                <th>
                                    <c:if test=" ${infoList.description == ''}">无</c:if>
                                    <c:if test=" ${infoList.description}">${infoList.description}</c:if>
                                </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
</div>


<script>
    //获取端口
    var host = getHttpHost();
    $(document).ready(function () {
        $('.startTime').each(function () {
            var startTime = $(this).text();
            $(this).text(startTime.substring(0,10))
        })
        $('.endTime').each(function () {
            var endTime = $(this).text();
            $(this).text(endTime.substring(0,10))
        })

    })


    function sub(status) {
        var ids = "";
        $("input[name='ids']").each(function () {
            ids += $(this).val() + ',';
        });
        var idNum = ids.length;
        ids = ids.substring(0,idNum - 1);
        $.ajax({
            type: 'post',
            url: host+"/resume/organization/updateStatusById",
            data: {'infoIds': ids,'status': status},
            async: false,
            success : function (re) {
                if(re.success){
                    /*layui.layer.msg(re.message, {icon: 1, time: 2000, title: '提示'});*/
                    $('.top_rigth').html("");
                    $('.top_rigth').html('<div class="select_box">\n' +
                        '                        <p>该信息已经认证！</p>\n' +
                        '                        <button onclick="javascript:history.back(-1)" class="layui-btn layui-btn-warm">返回</button>\n' +
                        '\n' +
                        '                    </div>');
                }else{
                    layui.layer.msg(re.message, {icon: 2, time: 2000, title: '提示'});
                }
            }
        })
    }
</script>

</body>
</html>
