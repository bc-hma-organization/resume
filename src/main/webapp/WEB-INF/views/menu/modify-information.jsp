    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ include file="/WEB-INF/views/menu/taglib.jsp" %>
        <html>
        <head>
        <title>修改个人信息界面</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${ctx}/statics/css/font.css">
        <link rel="stylesheet" href="${ctx}/statics/css/modify-information_xadmin.css">
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
        autocomplete="off" class="layui-input" value="${user.userName}">
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
        <input type="password" id="newpass" name="newpass" onblur="newpassIsNull()" lay-verify="required"
        autocomplete="off" class="layui-input">
        </td>
        <td><span class="msg" id="msg_newpass"></span></td>
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
            <td>真实姓名：</td>
            <td>
            <input type="text" id="turename" name="turename" onblur="turenameIsNull()" lay-verify="required"
            autocomplete="off" class="layui-input">
            </td>
            <td><span class="msg" id="msg_turename"></span></td>
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
        <button id="btn_sub" type="button" class="layui-btn layui-btn-primarylayui-btn-lg">提交</button>
        <button id="btn_re" type="button" class="layui-btn layui-btn-primarylayui-btn-lg">重置</button>
        </div>

        </form>
        </div>
        </div>
        </body>
        <script>
         /*
        *用户名
         */
         var host = getHttpHost();
                function usernameIsNull() {
                var username = $('#username').val();
        if (username == "") {
                return false
        }
        }
        /*
        *密码
         */
        function passIsNull() {
        var pass = $('#password').val();
        if (pass == "") {
        return false
        }
        }
        /*
        * 新密码
        */

        function passIsNull() {
        var newpassword = $('#newpassword').val();
        if (newpassword == "") {
        return false
        }
        }
            /*
            * 确认密码
            */

            function repassIsNull() {
        var repass = $('#repass').val();
        var repass = $('#newpassword').val();
        if (repass == "") {
        return false
        }
        if (repass != newpassword) {
        layui.layer.msg("确认密码要与新密码一致！", {icon: 3, time: 2000, title: "提示"});
        return false
        }
        }

            /*
            * 真实姓名
            */

            function turenameIsNull() {
            var turename = $('#turename').val();
            if (turename == "") {
            return false
            }
            }

            /*
            * 身份证
            */

            function identitycardIsNull() {
        var identitycard = $('#identitycard').val();
        if (identitycard == "") {
                return false
        }
        }
            /*
            * 邮箱
            */
            function emailIsNull() {
        var email = $('#email').val();
        if (email == "") {
        return false
        }
        }
            /*
            * 地址
            */

            function useradressIsNull() {
        var useradress = $('#useradress').val();
        if (useradress == "") {
        return false
        }
        }
            /*
            * 电话
            */
            function phoneIsNull() {
        var phone = $('#phone').val();
        if (phone == "") {
        return false
        }
        }
            /*
            * 年龄
            */
            function ageIsNull() {
        var age = $('#age').val();
        if (age == "") {
        return false
        }
        }


        $('#btn_sub').click(function () {

            /*usernameIsNull();
            passIsNull();
            repassIsNull();
            identitycardIsNull();
            emailIsNull();
            phoneIsNull();
            ageIsNull();*/

            var user = {'id':id,'userName': username, 'password': pass, 'newpassword':newpassword,'turename':turename,'identitycard':identitycard ,'email':email,'useradress':useradress,'phone':phone,'age':age,'status': 1};

            var user;
            var id = "${user.id}"
            var username = $('#username').val();
            var newpassword = $('#newpassword').val();
            var pass = $('#password').val();
            var turename = $('#turename').val();
            var identitycard = $('#identitycard').val();
            var email = $('#email').val();
            var useradress = $('#useradress').val();
            var phone = $('#phone').val();
            var age = $('#age').val();

            $.ajax({
            type : 'post',
            url : host+"/resume/edit",
            data : {"user": user,"newpassword":newpassword,},
            async: false,
            success: function (re){
            if(re.success){
            layui.layer.msg(re.message, {icon: 1, time: 2000, title: '提示'});
            }else{
            layui.layer.msg(re.message, {icon: 2, time: 2000, title: '提示'});
            }
            }
            })
            });

        </script>
        </html>
