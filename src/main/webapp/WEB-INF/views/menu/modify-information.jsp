    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ include file="/WEB-INF/views/menu/taglib.jsp" %>
        <html>
        <head>
        <title>修改个人信息界面</title>
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
        <div class="modify-information">
        <div class="back"><img src="${ctx}/statics/images/back.jpg" width="60"></div>
        <div class="t_top">
        <p><strong>修改个人信息界面</strong></p>
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
        <input type="text" id="username" name="username" onblur="usernameIsNull()" lay-verify="required"
        autocomplete="off" class="layui-input">
        </td>
        <td><span class="msg" id="msg_username"></span></td>
        </tr>

        <tr>
        <td>密码：</td>
        <td>
        <input type="password" id="password" name="password" onblur="passIsNull()" lay-verify="required"
        autocomplete="off" class="layui-input">
        </td>
        <td><span class="msg" id="msg_pass"></span></td>
        </tr>

        <tr>
        <td>新密码：</td>
        <td>
        <input type="password" id="newpassword" name="newpassword" onblur="newpasswordIsNull()" lay-verify="required"
        autocomplete="off" class="layui-input">
        </td>
        <td><span class="msg" id="msg_newpassword"></span></td>
        </tr>

        <tr>
        <td>确认密码：</td>
        <td>
        <input type="password" id="repass" name="repass" onblur="repassIsNull()" lay-verify="required"
        autocomplete="off" class="layui-input">
        </td>
        <td><span class="msg" id="msg_repass"></span></td>
        </tr>

        <tr>
        <td>身份证：</td>
        <td>
        <input type="text" id="identitycard" name="identitycard" onblur="identitycardIsNull()" lay-verify="required"
        autocomplete="off" class="layui-input">
        </td>
        <td><span class="msg" id="msg_identitycard"></span></td>
        </tr>

        <tr>
        <td>用户名邮箱：</td>
        <td>
        <input type="text" id="email" name="eamil" onblur="emailIsNull()" lay-verify="required" autocomplete="off"
        class="layui-input">
        </td>
        <td><span class="msg" id="msg_email"></span></td>
        </tr>

        <tr>
        <td>用户地址：</td>
        <td>
        <input type="text" id="useradress" name="useradress" onblur="useradressIsNull()" lay-verify="required"
        autocomplete="off" class="layui-input">
        </td>
        <td><span class="msg" id="msg_useradress"></span></td>
        </tr>

        <tr>
        <td>电话：</td>
        <td>
        <input type="text" id="phone" name="phone" onblur="phoneIsNull()" lay-verify="required"
        autocomplete="off" class="layui-input">
        </td>
        <td><span class="msg" id="msg_phone"></span></td>
        </tr>

        <tr>
        <td>年龄：</td>
        <td>
        <input type="text" id="age" name="age" onblur="ageIsNull()" lay-verify="required"
        autocomplete="off" class="layui-input">
        </td>
        <td><span class="msg" id="msg_age"></span></td>
        </tr>

        </tbody>
        </table>
        <div class="btn_box">
        <button id="btn_sub" onclick="goTest()" type="button" class="layui-btn layui-btn-primary layui-btn-radius">提交</button>
        <button id="btn_re" type="button" class="layui-btn layui-btn-primary layui-btn-radius">重置</button>
        </div>
        </form>
        </div>
        </div>
        </body>
        <script>

        var host = getHttpHost();
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

        function passIsNull() {
        var newpassword = $('#newpassword').val();
        if (newpassword == "") {
        layui.layer.msg("请填写新密码！", {icon: 3, time: 2000, title: "提示"});
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
        if (repass != newpassword) {
        layui.layer.msg("确认密码要与新密码一致！", {icon: 3, time: 2000, title: "提示"});
        return false
        }
        }

        function identitycardIsNull() {
        var identitycard = $('#identitycard').val();
        if (identitycard == "") {
        layui.layer.msg("请填写用户名！", {icon: 3, time: 2000, title: "提示"});
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

        function useradressIsNull() {
        var useradress = $('#useradress').val();
        if (useradress == "") {
        layui.layer.msg("请填写用户地址！", {icon: 3, time: 2000, title: "提示"});
        return false
        }
        }

        function phoneIsNull() {
        var phone = $('#phone').val();
        if (phone == "") {
        layui.layer.msg("请填写电话！", {icon: 3, time: 2000, title: "提示"});
        return false
        }
        }

        function phoneIsNull() {
        var age = $('#age').val();
        if (age == "") {
        layui.layer.msg("请填写年龄！", {icon: 3, time: 2000, title: "提示"});
        return false
        }
        }


        $('#btn_sub').click(function () {

        usernameIsNull();
        passIsNull();
        newpasswordIsNull();
        repassIsNull();
        identitycardIsNull()
        emailIsNull();
        useradressISNull();
        phoneIsNull();
        ageIsNull();

        var user;
        user
        var username = $('#username').val();
        var newpassword = $('#newpassword').val();
        var pass = $('#password').val();
        var identitycard = $('#identitycard').val();
        var email = $('#email').val();
        var useradress = $('#useradress').val();
        var phone = $('#phone').val();
        var age = $('#age').val();

        $.ajax({
        type : 'post',
        url : host+"/resume/talent-register",
        data : {'userName': username, 'password': pass, 'newpassword':newpassword,'identitycard':identitycard,'email': email, 'useradress':useradress,'phone':phone,'age':age,'status': 1},
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
        function goTest(){
            location.href = 'info/upload-info'
        }

        </script>
        </html>
