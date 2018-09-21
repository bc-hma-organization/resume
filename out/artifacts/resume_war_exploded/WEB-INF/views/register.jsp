<%--
  Created by IntelliJ IDEA.
  User: 区块链培训学院
  Date: 2018/8/28
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/menu/taglib.jsp"%>
<html>
<head>
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ctx}/statics/css/font.css">
    <link rel="stylesheet" href="${ctx}/statics/css/register_xadmin.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/statics/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/request.js"></script>
</head>
<body>
    <div class="jump">
        <div class="j_top"><p>请选择入口：</p></div>
        <div class="j_main">
            <div class="to_talent">
                <img onclick="gotoTalent()" src="${ctx}/statics/images/img_talent.png" title="人才">
            </div>
            <div class="to_organiza">
                <img onclick="gotoOrganization()" src="${ctx}/statics/images/img_organiza.png" title="机构">
            </div>
        </div>
    </div>
</body>
<script>
    var host = getHttpHost();
    function gotoTalent() {
        $.ajax({
            type : 'post',
            url: host+"/resume/register",
            data : {"type" : "talent"},
            async: false,
            success: function (re) {
                location.href = "/resume/" + re;
            }
        })
    }
    function gotoOrganization() {
        $.ajax({
            type : 'post',
            url: host+"/resume/register",
            data : {type : "organization"},
            async: false,
            success: function (re) {
                location.href = "/resume/" + re;
            }
        })
    }

</script>
</html>
