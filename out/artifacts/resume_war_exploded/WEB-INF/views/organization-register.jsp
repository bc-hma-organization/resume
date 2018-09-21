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
    <link rel="stylesheet" href="${ctx}/statics/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/statics/css/register_xadmin.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/statics/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/request.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/address.js"></script>
</head>
<body>
    <div class="talent_register">
        <div class="back"><img src="${ctx}/statics/images/back.jpg" onclick="javascript:history.back(-1)" width="60"></div>
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
                            <input type="text" id="username" name="username" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_username"></span></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td>
                            <input type="password" id="password" name="password" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_pass"></span></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td>
                            <input type="password" id="repass" name="repass" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_repass"></span></td>
                    </tr>
                    <tr>
                        <td>机构名称：</td>
                        <td>
                            <input type="text" id="organizaName" name="organizaName" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_organizaName"></span></td>
                    </tr>
                    <tr>
                        <td>机构码：</td>
                        <td>
                            <input type="text" id="organizaKey" name="organizaKey" lay-verify="required" autocomplete="off" class="layui-input">
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
                        <td>机构所在地区：</td>
                        <td>
                            <div class="layui-input-inline">
                                <select id="province" name="province" lay-filter="province" class="province">
                                    <option value="">请选择省</option>
                                </select>
                            </div>
                            <div class="layui-input-inline">
                                <select id="city" name="city" lay-filter="city" disabled>
                                    <option value="">请选择市</option>
                                </select>
                            </div>
                            <div class="layui-input-inline">
                                <select id="area" name="area" lay-filter="area" disabled>
                                    <option value="">请选择县/区</option>
                                </select>
                            </div>
                        </td>
                        <td><span class="msg" id="msg_organizaAddress"></span></td>
                    </tr>
                    <tr>
                        <td>街道地址：</td>
                        <td><input id="street" class="layui-input" placeholder="请填写街道地址，请勿重复填写省市区"></td>
                    </tr>
                    <tr>
                        <td>机构电话：</td>
                        <td>
                            <input type="text" id="organizaPhone" name="organizaPhone" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_organizaPhone"></span></td>
                    </tr>
                    <tr>
                        <td>法人名称：</td>
                        <td>
                            <input type="text" id="legalPerson" name="legalPerson" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_legalPerson"></span></td>
                    </tr>
                    <tr>
                        <td>联系人：</td>
                        <td>
                            <input type="text" id="contact" name="contact" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_contact"></span></td>
                    </tr>
                    <tr>
                        <td>联系人号码：</td>
                        <td>
                            <input type="text" id="contactPhone" name="contactPhone" lay-verify="required" autocomplete="off" class="layui-input">
                        </td>
                        <td><span class="msg" id="msg_contactPhone"></span></td>
                    </tr>
                    <tr>
                        <td>机构简介：</td>
                        <td>
                            <textarea id="description" name="description" style="width: 100%;min-height: 100px;resize: vertical;" placeholder="请描述一下您的机构"></textarea>
                        </td>
                        <td><span class="msg" id="msg_description"></span></td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn_box">
                    <button id="btn_sub" onclick="inputIsNull()" type="button" class="layui-btn layui-btn-radius">提交</button>
                    <button id="btn_re" type="button" class="layui-btn layui-btn-warm layui-btn-radius">重置</button>
                </div>
            </form>
        </div>
    </div>
</body>
<script>
    //获取端口
    var host = getHttpHost();
    //提交方法
    function inputIsNull() {
        //获取数据
        var username = $('#username').val();
        var pass = $('#password').val();
        var repass = $('#repass').val();
        var organizaName = $('#organizaName').val();
        var organizaKey = $('#organizaKey').val();
        var province = $('#province option:selected').text();
        var city = $('#city option:selected').text();
        var area = $('#area option:selected').text();
        var street = $("#street").val();
        var organizaAddress = province + city + area + street;
        var organizaPhone = $('#organizaPhone').val();
        var legalPerson = $('#legalPerson').val();
        var contact = $('#contact').val();
        var contactPhone = $('#contactPhone').val();
        var description = $('#description').val();

        //判空
        if (username == ""){
            layui.layer.msg("请填写用户名！", {icon: 3, time: 2000, title: "提示"});
            return false;
        } else if (pass == ""){
            layui.layer.msg("请填写密码！", {icon: 3, time: 2000, title: "提示"});
            return false;
        } else if (repass == ""){
            layui.layer.msg("请填写确认密码！", {icon: 3, time: 2000, title: "提示"});
            return false;
        }else if (pass != repass){
            layui.layer.msg("确认密码要与密码一致！", {icon: 3, time: 2000, title: "提示"});
            return false;
        }else if (organizaName == ""){
            layui.layer.msg("请填写机构名！", {icon: 3, time: 2000, title: "提示"});
            return false;
        }else if (organizaKey == ""){
            layui.layer.msg("请填写机构码！", {icon: 3, time: 2000, title: "提示"});
            return false;
        }else if (province == "请选择省"){
            layui.layer.msg("请选择省！", {icon: 3, time: 2000, title: "提示"});
            return false;
        }else if (city == "请选择市"){
            layui.layer.msg("请选择市！", {icon: 3, time: 2000, title: "提示"});
            return false;
        }else if (area == "请选择县/区"){
            layui.layer.msg("请选择县/区！", {icon: 3, time: 2000, title: "提示"});
            return false;
        }else if(street == ""){
            layui.layer.msg("请填写街道", {icon: 3, time:2000, title:'提示'});
        }else if (organizaPhone == ""){
            layui.layer.msg("请填写机构号码！", {icon: 3, time: 2000, title: "提示"});
            return false;
        }else if (legalPerson == ""){
            layui.layer.msg("请填写法人代表！", {icon: 3, time: 2000, title: "提示"});
            return false;
        }else if (contact == ""){
            layui.layer.msg("请填写联系人！", {icon: 3, time: 2000, title: "提示"});
            return false;
        }else if (contactPhone == ""){
            layui.layer.msg("请填写联系人号码！", {icon: 3, time: 2000, title: "提示"});
            return false;
        }
        //数据整合
        var data = {
            userName : username,
            password : pass,
            status : 1,
            organizaName: organizaName,
            organizaKey: organizaKey,
            organizaAddress: organizaAddress,
            organizaPhone: organizaPhone,
            legalPerson: legalPerson,
            contact: contact,
            contactPhone: contactPhone,
            description: description
            /*status: 1*/
        }
        //保存数据
        $.ajax({
            type: 'post',
            url: host+"/resume/organization-register",
            /*data: {
                "user": user,
                'organization': organization
            },*/
            data: data,
            async: false,
            success: function (re) {
                if(re.success){
                    layui.layer.msg(re.message, {icon: 1, time: 1000, title: '提示'}, function () {
                        location.href = "/resume/login"
                    });
                }else{
                    layui.layer.msg(re.message, {icon: 2, time: 2000, title: '提示'});
                }
            }

        })
    }

    //点击重置按钮，表单置空
    $("#btn_re").click(function () {
        layui.layer.confirm('重置信息？', {
            btn : [ '确定', '取消' ]//按钮
        }, function(index) {
            //清空数据
            $('#username').val("");
            $('#password').val('');
            $('#repass').val('');
            $('#organizaName').val('');
            $('#organizaKey').val('');
            $('#organizaPhone').val('');
            $('#legalPerson').val('');
            $('#contact').val('');
            $('#contactPhone').val('');
            $('#description').val('');
            layui.layer.close(index)
        });
    });

</script>
<script type="text/javascript" src="${ctx}/statics/js/address.js"></script>
<script type="text/javascript">
    layui.config({
        base : "${ctx}/statics/js/" //address.js的路径
    }).use([ 'layer', 'jquery', "address" ], function() {
        var layer = layui.layer, $ = layui.jquery, address = layui.address();

    });
</script>


</html>
