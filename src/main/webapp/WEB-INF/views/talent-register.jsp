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
    <div class="talent_register">
        <div class="back"><img src="${ctx}/statics/images/back.jpg" onclick="javascript:history.back(-1)" width="60"></div>
        <div class="t_top">
            <p><strong>人才注册</strong></p>
        </div>
        <div class="t_main">
            <form class="layui-form layui-form-pane" method="post">
                <table>
                    <colgroup>
                        <col width="20%">
                        <col width="60%">
                        <col width="20%">
                        <col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <td>用户名：</td>
                        <td>
                            <input type="text" id="username" name="username" onblur="usernameIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_username"></span></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td>
                            <input type="password" id="password" name="password" onblur="passIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_pass"></span></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td>
                            <input type="password" id="repass" name="repass" onblur="repassIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_repass"></span></td>
                    </tr>
                    <tr>
                        <td>邮箱：</td>
                        <td>
                            <input type="text" id="email" name="eamil" onblur="emailIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_email"></span></td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn_box">
                    <button id="btn_sub" type="button" class="layui-btn layui-btn-radius">提交</button>
                    <button id="btn_re" type="button" class="layui-btn layui-btn-warm layui-btn-radius">重置</button>
                </div>
            </form>
        </div>
    </div>
</body>
<script>
    //获取端口
    var host = getHttpHost();
    //判空
    function usernameIsNull() {
        var username = $('#username').val();
        if (username == "") {
            layui.layer.msg("请填写用户名！", {icon: 3, time: 2000, title: "提示"});
            return false
        }
    }
    function passIsNull() {
        var pass = $('#password').val();
        if (pass == "") {
            layui.layer.msg("请填写密码！", {icon: 3, time: 2000, title: "提示"});
            return false
        }
    }
    function repassIsNull() {
        var repass = $('#repass').val();
        var pass = $('#password').val();
        if (repass == "") {
            layui.layer.msg("请填写确认密码！", {icon: 3, time: 2000, title: "提示"});
            return false
        }
        if (repass != pass) {
            layui.layer.msg("确认密码要与密码一致！", {icon: 3, time: 2000, title: "提示"});
            return false
        }
    }
    function emailIsNull() {
        var email = $('#email').val();
        if (email == "") {
            layui.layer.msg("请填写邮箱！", {icon: 3, time: 2000, title: "提示"});
            return false
        }
    }
    //保存数据
    $('#btn_sub').click(function () {

        usernameIsNull();
        passIsNull();
        repassIsNull();
        emailIsNull();
        var user;
        user
        var username = $('#username').val();
        var pass = $('#password').val();
        var email = $('#email').val();
        $.ajax({
            type : 'post',
            url :  host+"/resume/talent-register",
            data : {'userName': username, 'password': pass, 'email': email, 'status': 1},
            async: false,
            success: function (re) {
                if(re.success){
                    layui.layer.msg(re.message, {icon: 1, time: 2000, title: '提示'});
                    location.href = "/resume/login"
                }else{
                    layui.layer.msg(re.message, {icon: 2, time: 2000, title: '提示'});
                }
            }
        })
    })
</script>
</html>
