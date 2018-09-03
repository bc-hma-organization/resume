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
        <input type="text" id="username" name="username"  lay-verify="required"
        autocomplete="off" class="layui-input" value="${user.userName}">
        </td>
        <td><span class="msg" id="msg_username"></span></td>
        </tr>

            <tr>
            <td>真实姓名：</td>
            <td>
            <input type="text" id="turename" name="turename"  lay-verify="required"
            autocomplete="off" class="layui-input"value="${user.trueName}">
            </td>
            <td><span class="msg" id="msg_turename"></span></td>
            </tr>



            <tr>
        <td>身份证：</td>
        <td>
        <input type="text" id="identitycard" name="identitycard"  lay-verify="required"
        autocomplete="off" class="layui-input"value="${user.identityCard}">
        </td>
        <td><span class="msg" id="msg_identitycard"></span></td>
        </tr>

        <tr>
        <td>用户名邮箱：</td>
        <td>
        <input type="text" id="email" name="eamil" lay-verify="required" autocomplete="off"
        class="layui-input"value="${user.email}">
        </td>
        <td><span class="msg" id="msg_email"></span></td>
        </tr>

        <tr>
        <td>用户地址：</td>
        <td>
        <input type="text" id="address" name="address" lay-verify="required"
        autocomplete="off" class="layui-input"value="${user.address}">
        </td>
        <td><span class="msg" id="msg_address"></span></td>
        </tr>

        <tr>
        <td>电话：</td>
        <td>
        <input type="text" id="phone" name="phone" lay-verify="required"
        autocomplete="off" class="layui-input"value="${user.phone}">
        </td>
        <td><span class="msg" id="msg_phone"></span></td>
        </tr>

        <tr>
        <td>年龄：</td>
        <td>
        <input type="text" id="age" name="age" lay-verify="required"
        autocomplete="off" class="layui-input"value="${user.age}">
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

            function addressIsNull() {
        var address = $('#address').val();
        if (address == "") {
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

var flag = repassIsNull();
if(!flag) return false
var user;
var id = "${user.id}"
var username = $('#username').val();

var turename = $('#turename').val();
var identitycard = $('#identitycard').val();
var email = $('#email').val();
var address = $('#address').val();
var phone = $('#phone').val();
var age = $('#age').val();
var data;

            data = {
                'id':id,
                'userName': username,
                'turename':turename,
                'identitycard':identitycard ,
                'email':email
                ,'address':address,
                'phone':phone,
                'age':age,
                'status': 1
            }

    $.ajax({
        type : 'post',
        url : host+"/resume/edit",
        data : data ,
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
