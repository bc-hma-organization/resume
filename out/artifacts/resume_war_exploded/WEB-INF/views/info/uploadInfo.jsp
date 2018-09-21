<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/menu/taglib.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>个人经历</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ctx}/statics/css/font.css">
    <link rel="stylesheet" href="${ctx}/statics/layui/css/layui.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/Swiper/3.4.2/css/swiper.min.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
    <script src="${ctx}/statics/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/statics/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/request.js"></script>
    <style type="text/css">
        .select_date{
            width: 100px;
        }

        .experience_table{
            width: 80%;
            margin-left: 10%;
            border-collapse: separate;
            border-spacing: 20px;
        }

        .table_cell{
            float: right;
            line-height: 36px;
        }

        .experience_div{
            width: 80%;
            margin-left: 10%;
            margin-top: 15px;
            border-bottom: solid 1px black;
            padding-bottom: 5px;
        }

        .date_span{
            font-size: 15px;
            color: #c2c2c2;
        }

        .company_name{
            font-size: 20px;
        }
    </style>
</head>
<body>
    <fieldset class="layui-elem-field">
        <legend>学习经验</legend>
        <div style="width: 100%;text-align: right;margin-bottom: 10px;"><a type="button" class="layui-btn" onclick="add_study()" style="margin-right: 10px;"><i class="layui-icon">&#xe654</i>新增经验</a></div>
        <div id="add_study" class="layui-field-box" style="text-align: center;" hidden>
            <table class="experience_table">
                <colgroup>
                    <col width="100px">
                    <col style="min-width: 250px;">
                    <col width="100px">
                    <col style="min-width: 250px;">
                </colgroup>
                <tbody>
                <tr>
                    <td class="table_cell">学校/机构</td>
                    <td><input type="text" class="layui-input" name="company"></td>
                    <td class="table_cell">学校key</td>
                    <td><input type="text" class="layui-input" name="companyKey"></td>
                </tr>
                <tr>
                    <td class="table_cell">学历</td>
                    <td><input type="text" class="layui-input" name="position"></td>
                    <td class="table_cell">学位</td>
                    <td><input type="text" class="layui-input" name="education"></td>
                </tr>
                <tr>
                    <td class="table_cell">开始时间</td>
                    <td><input class="layui-input select_date" id="study_start" name="startTime" placeholder="年-月-日"></td>
                    <td class="table_cell">结束时间</td>
                    <td><input class="layui-input select_date" id="study_end" name="endTime" placeholder="年-月-日"></td>
                </tr>
                <tr>
                    <td class="table_cell">详细描述</td>
                    <td colspan="3">
                        <textarea name="description" style="width: 100%;min-height: 100px;resize: vertical;" placeholder="请描述一下您的学习经历"></textarea>
                    </td>
                </tr>
                </tbody>
            </table>
            <div>
                <input type="button" id="study_submit" class="layui-btn" value="保存">
                <input type="button" id="study_cancel" class="layui-btn layui-btn-primary" value="取消" style="margin-left: 10px;">
            </div>
        </div>
        <c:forEach items="${study_info}" var="study">
            <div class="experience_div">
                <span class="date_span"><fmt:formatDate value="${study.startTime}" pattern="yyyy年MM月dd日"/></span>
                <span class="date_span">-</span>
                <span class="date_span"><fmt:formatDate value="${study.endTime}" pattern="yyyy年MM月dd日"/></span><br/>
                <div style="margin-top: 10px;">
                    <label class="company_name">${study.company}</label>
                    <span style="margin-left: 10%;font-size: 20px;">${study.position}</span>
                    <span style="margin-left: 10%;font-size: 20px;">${study.education}</span>
                </div>
                <p style="margin-top: 10px;line-height: 1.5;letter-spacing:10px;">描述：<c:if test="${empty study.description}">无</c:if>${study.description}</p>
            </div>
        </c:forEach>
    </fieldset>
    <fieldset class="layui-elem-field">
        <legend>工作经验</legend>
        <div style="width: 100%;text-align: right;margin-bottom: 10px;"><a type="button" class="layui-btn" onclick="add_work()" style="margin-right: 10px;"><i class="layui-icon">&#xe654</i>新增经验</a></div>
        <div id="add_work" class="layui-field-box" style="text-align: center;" hidden>
            <table class="experience_table">
                <colgroup>
                    <col width="100px">
                    <col style="min-width: 250px;">
                    <col width="100px">
                    <col style="min-width: 250px;">
                </colgroup>
                <tbody>
                <tr>
                    <td class="table_cell">公司名</td>
                    <td><input type="text" class="layui-input" name="company"></td>
                    <td class="table_cell">公司key</td>
                    <td><input type="text" class="layui-input" name="companyKey"></td>
                </tr>
                <tr>
                    <td class="table_cell">职位</td>
                    <td><input type="text" class="layui-input" name="position"></td>
                    <td class="table_cell"></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="table_cell">开始时间</td>
                    <td><input class="layui-input select_date" id="work_start" name="startTime" placeholder="年-月-日"></td>
                    <td class="table_cell">结束时间</td>
                    <td><input class="layui-input select_date" id="work_end" name="endTime" placeholder="年-月-日"></td>
                </tr>
                <tr>
                    <td class="table_cell">详细描述</td>
                    <td colspan="3">
                        <textarea name="description" style="width: 100%;min-height: 100px;resize: vertical;" placeholder="请描述一下您的工作经历"></textarea>
                    </td>
                </tr>
                </tbody>
            </table>
            <div>
                <input type="button" id="work_submit" class="layui-btn" value="保存">
                <input type="button" id="work_cancel" class="layui-btn layui-btn-primary" value="取消" style="margin-left: 10px;">
            </div>
        </div>
        <c:forEach items="${work_info}" var="work">
            <div class="experience_div">
                <span class="date_span"><fmt:formatDate value="${work.startTime}" pattern="yyyy年MM月dd日"/></span>
                <span class="date_span">-</span>
                <span class="date_span"><fmt:formatDate value="${work.endTime}" pattern="yyyy年MM月dd日"/></span><br/>
                <div style="margin-top: 10px;">
                    <label class="company_name">${work.company}</label>
                    <span style="margin-left: 10%;font-size: 20px;">${work.position}</span>
                </div>
                <p style="margin-top: 10px;line-height: 1.5;letter-spacing:10px;">描述：<c:if test="${empty work.description}">无</c:if>${work.description}</p>
            </div>
        </c:forEach>
    </fieldset>
<script>
    var host = getHttpHost();
    $(document).ready(function () {
         layui.use('laydate', function () {
             //name时间选择器
             var laydate = layui.laydate;
             laydate.render({
                 elem: '#study_start',
                 type: 'date'
             });
             laydate.render({
                 elem: '#study_end',
                 type: 'date'
             });
             laydate.render({
                 elem: '#work_start',
                 type: 'date'
             });
             laydate.render({
                 elem: '#work_end',
                 type: 'date'
             });
         });
    });

    //显示添加学习经验
    function add_study() {
        $("#add_study").animate({opacity: "show"}, 1000);
    }

    //显示添加工作经验
    function add_work() {
        $("#add_work").animate({opacity: "show"}, 1000);
    }

    //取消添加学习经验
    $("#study_cancel").click(function () {
        $("#add_study").animate({opacity: "hide"}, 1000);
        $("input[name='company']").eq(0).val("");
        $('input[name="companyKey"]').eq(0).val("");
        $("#study_start").val("");
        $("#study_end").val("");
        $('input[name="position"]').eq(0).val("");
        $('input[name="education"]').val("");
        $('[name="description"]').eq(0).val("");
    });

    //取消添加工作经验
    $("#work_cancel").click(function () {
        $("#add_work").animate({opacity: "hide"}, 1000);
        $("input[name='company']").eq(1).val("");
        $('input[name="companyKey"]').eq(1).val("");
        $("#work_start").val("");
        $("#work_end").val("");
        $('input[name="position"]').eq(1).val("");
        $('[name="description"]').eq(1).val("");
    });

    //保存学习经历
    $("#study_submit").click(function () {
        var company = $("input[name='company']").eq(0).val();
        var companyKey = $('input[name="companyKey"]').eq(0).val();
        var startTime = $("#study_start").val();
        var endTime = $("#study_end").val();
        var position = $('input[name="position"]').eq(0).val();
        var education = $('input[name="education"]').val();
        var description = $('[name="description"]').eq(0).val();
        if(company == ""){
            layui.layer.msg("请填写学校/机构名", {icon: 2, time: 2000, title: '提示'});
            return false
        }else if(companyKey == ""){
            layui.layer.msg("请填写机构Key", {icon: 2, time: 2000, title: '提示'});
            return false
        }else if(startTime == ""){
            layui.layer.msg("请填写学习开始时间", {icon: 2, time: 2000, title: '提示'});
            return false
        }else if(endTime == ""){
            layui.layer.msg("请填写学习结束时间", {icon: 2, time: 2000, title: '提示'});
            return false
        }
        var info = {
            "company": company,
            "companyKey": companyKey,
            "startTime": startTime,
            "endTime": endTime,
            "position": position,
            "education": education,
            "description": description,
            "status": 0,
            "type": 0
        };
        $.ajax({
            type: 'post',
            url: host+"/resume/info/upload-info",
            data: info,
            async: false,
            success: function (re) {
                if(re.success){
                    layui.layer.msg(re.message, {icon: 1, time: 2000, title: '提示'}, function () {
                        history.go(0);
                    });
                }else{
                    layui.layer.msg(re.message, {icon: 2, time: 2000, title: '提示'})
                }
            }
        });
    });

    //保存工作经历
    $("#work_submit").click(function () {
        var company = $("input[name='company']").eq(1).val();
        var companyKey = $('input[name="companyKey"]').eq(1).val();
        var startTime = $("#work_start").val();
        var endTime = $("#work_end").val();
        var position = $('input[name="position"]').eq(1).val();
        var description = $('[name="description"]').eq(1).val();
        if(company == ""){
            layui.layer.msg("请填写公司名", {icon: 2, time: 2000, title: '提示'});
            return false
        }else if(companyKey == ""){
            layui.layer.msg("请填写机构Key", {icon: 2, time: 2000, title: '提示'});
            return false
        }else if(startTime == ""){
            layui.layer.msg("请填写开始时间", {icon: 2, time: 2000, title: '提示'});
            return false
        }else if(endTime == ""){
            layui.layer.msg("请填写结束时间", {icon: 2, time: 2000, title: '提示'});
            return false
        }else if(position == ""){
            layui.layer.msg("请填写职位", {icon: 2, time: 2000, title: '提示'});
            return false
        }
        var info = {
            "company": company,
            "companyKey": companyKey,
            "startTime": startTime,
            "endTime": endTime,
            "position": position,
            "description": description,
            "status": 0,
            "type": 1
        };
        $.ajax({
            type: 'post',
            url: host+"/resume/info/upload-info",
            data: info,
            async: false,
            success: function (re) {
                if(re.success){
                    layui.layer.msg(re.message, {icon: 1, time: 2000, title: '提示'}, function () {
                        history.go(0);
                    });
                }else{
                    layui.layer.msg(re.message, {icon: 2, time: 2000, title: '提示'})
                }
            }
        });
    });
</script>
</body>
</html>
