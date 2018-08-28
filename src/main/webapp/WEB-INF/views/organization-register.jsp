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
    <script type="text/javascript" src="${ctx}/statics/js/area.js"></script>
</head>
<body>
    <div class="talent_register">
        <div class="back"><img src="${ctx}/statics/images/back.jpg" width="60"></div>
        <div class="t_top">
            <p><strong>机构注册</strong></p>
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
                            <input type="text" id="username" name="username" onblur="inputIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_username"></span></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td>
                            <input type="password" id="password" name="password" onblur="inputIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_pass"></span></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td>
                            <input type="password" id="repass" name="repass" onblur="inputIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_repass"></span></td>
                    </tr>
                    <tr>
                        <td>机构名称：</td>
                        <td>
                            <input type="text" id="organizaName" name="organizaName" onblur="inputIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_organizaName"></span></td>
                    </tr>
                    <tr>
                        <td>机构码：</td>
                        <td>
                            <input type="text" id="organizaKey" name="organizaKey" onblur="inputIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_organizaKey"></span></td>
                    </tr>
                    <%--<tr>
                        <td>机构logo：</td>
                        <td>
                            <img class="layui-upload-img" id="demo1">
                            <p id="demoText"></p>
                        </td>
                        <td><button type="button" class="layui-btn" id="test1">上传图片</button></td>
                    </tr>--%>
                    <tr>
                        <td>机构地址：</td>
                        <td>
                            <div id="area"></div>
                        </td>
                        <td><span class="msg" id="msg_organizaAddress"></span></td>
                    </tr>
                    <tr>
                        <td>机构号码：</td>
                        <td>
                            <input type="text" id="organizaPhone" name="organizaPhone" onblur="inputIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_organizaPhone"></span></td>
                    </tr>
                    <tr>
                        <td>法人名称：</td>
                        <td>
                            <input type="text" id="legalPerson" name="legalPerson" onblur="inputIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_legalPerson"></span></td>
                    </tr>
                    <tr>
                        <td>联系人：</td>
                        <td>
                            <input type="text" id="contact" name="contact" onblur="inputIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_contact"></span></td>
                    </tr>
                    <tr>
                        <td>联系人号码：</td>
                        <td>
                            <input type="text" id="contactPhone" name="contactPhone" onblur="inputIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_contactPhone"></span></td>
                    </tr>
                    <tr>
                        <td>机构简介：</td>
                        <td>
                            <input type="text" id="description" name="description" onblur="inputIsNull()" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_description"></span></td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn_box">
                    <button id="btn_sub" type="button" class="layui-btn layui-btn-primary layui-btn-radius">提交</button>
                    <button id="btn_re" type="button" class="layui-btn layui-btn-primary layui-btn-radius">重置</button>
                </div>
            </form>
        </div>
    </div>
</body>
<script>
    function inputIsNull() {
        var username = $('#username').val();
        var repass = $('#repass').val();
        var organizaName = $('#organizaName').val();
        var organizaKey = $('#organizaKey').val();
        var organizaAddress = $('#organizaAddress').val();
        var organizaPhone = $('#organizaPhone').val();
        var legalPerson = $('#legalPerson').val();
        var contact = $('#contact').val();
        var contactPhone = $('#contactPhone').val();
        var description = $('#description').val();

    }

</script>
</html>
