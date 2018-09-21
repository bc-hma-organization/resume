<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/menu/taglib.jsp" %>
<html>
<head>
<title>修改个人信息界面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${ctx}/statics/css/font.css">
<link rel="stylesheet" href="${ctx}/statics/css/modify-information_xadmin.css">
<link rel="stylesheet" href="${ctx}/statics/layui/css/layui.css">
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
                <span>${user.userName}</span>
                </td>
                <td><span class="msg" id="msg_username"></span></td>
        </tr>
        <tr>
                <td>真实姓名：</td>
                <td>
                <input type="text" id="truename" name="truename"  lay-verify="required" autocomplete="off" class="layui-input"value="${user.trueName}">
                </td>
                <td><span class="msg" id="msg_truename"></span></td>
        </tr>
        <tr>
                <td>性别：</td>
                <td>
                        <input type="radio" id="man" name="sex" value="1">男
                        <input type="radio" id="women" name="sex" value="0">女
                </td>
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
                <td>邮箱：</td>
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
                        <input type="text" id="phone" name="phone" lay-verify="required" autocomplete="off" class="layui-input"value="${user.phone}">
                </td>
                <td><span class="msg" id="msg_phone"></span></td>
        </tr>
        <tr>
                <td>年龄：</td>
                <td>
                        <input type="text" id="age" name="age" lay-verify="required" autocomplete="off" class="layui-input"value="${user.age}">
                </td>
                <td><span class="msg" id="msg_age"></span></td>
        </tr>
</tbody>
</table>
<div class="btn_box">
        <button id="btn_sub" type="button" class="layui-btn layui-btn-primary">提交</button>
</div>
</form>
</div>
</div>
</body>
<script>
var host = getHttpHost();

$(document).ready(function () {
    //判断是否已有默认性别
    var sex = "${user.sex}";
    if(sex == null){
        $("#man").attr('checked', 'checked');
    }else if(sex == "true"){
        $("#women").attr('checked', 'checked');
    }else{
        $("#man").attr('checked', 'checked');
    }
});

 /*
*用户名
 */
function usernameIsNull() {
    var username = $('#username').val();
        if (username == "") {
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
var user;
var id = "${user.id}";
var trueName = $('#truename').val();
var sex = $('[name="sex"]:checked').val();
var identitycard = $('#identitycard').val();
var email = $('#email').val();
var address = $('#address').val();
var phone = $('#phone').val();
var age = $('#age').val();
if(sex == 1){
    sex = false
}else{
    sex = true
}
var data = {
        'id':id,
        'trueName':trueName,
        'sex': sex,
        'identityCard':identitycard ,
        'email':email
        ,'address':address,
        'phone':phone,
        'age':age,
        'status': 1
    };
    $.ajax({
        type : 'post',
        url : host+"/resume/edit",
        data : data ,
        async: false,
        success: function (re){
            if(re.success){
                layui.layer.msg(re.message, {icon: 1, time: 2000, title: '提示'}, function () {
                    history.go(0)
                });
            }else{
                layui.layer.msg(re.message, {icon: 2, time: 2000, title: '提示'});
            }
        }
    })
});

</script>
</html>
