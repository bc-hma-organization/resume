<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/menu/taglib.jsp"%>
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
        }
    </style>
</head>
<body>
    <fieldset class="layui-elem-field">
        <legend>学习经验</legend>
        <div style="width: 100%"><a type="button" class="layui-btn"><i class="layui-icon">&#xe654</i>新增经验</a></div>
        <div id="add_study" class="layui-field-box" style="text-align: center;" hide>
            <table class="layui-table experience_table" lay-even lay-skin="nob">
                <colgroup>
                    <col width="100px">
                    <col style="min-width: 250px;">
                    <col width="100px">
                    <col style="min-width: 250px;">
                </colgroup>
                <tbody>
                <tr>
                    <td style="float: right;">学校/机构</td>
                    <td><input type="text" class="layui-input" name="company"></td>
                    <td style="float: right;">学校key</td>
                    <td><input type="text" class="layui-input" name="companyKey" disabled></td>
                </tr>
                <tr>
                    <td style="float: right;">学历</td>
                    <td><input type="text" class="layui-input" name="position"></td>
                    <td style="float: right;">学位</td>
                    <td><input type="text" class="layui-input" name="education"></td>
                </tr>
                <tr>
                    <td style="float: right;">开始时间</td>
                    <td><input class="layui-input select_date" name="startTime" placeholder="年-月-日"></td>
                    <td style="float: right;">结束时间</td>
                    <td><input class="layui-input select_date" name="endTime" placeholder="年-月-日"></td>
                </tr>
                <tr>
                    <td style="float: right;">详细描述</td>
                    <td colspan="3">
                        <textarea name="description" style="width: 100%;min-height: 100px;resize: vertical;" placeholder="请描述一下您的学习经历"></textarea>
                    </td>
                </tr>
                </tbody>
            </table>
            <div>
                <input type="button" class="layui-btn" value="保存">
                <input type="button" class="layui-btn layui-btn-primary" value="取消" style="margin-left: 10px;">
            </div>
        </div>
    </fieldset>
    <fieldset class="layui-elem-field">
        <legend>工作经验</legend>
        <div style="width: 100%"><a type="button" class="layui-btn"><i class="layui-icon">&#xe654</i>新增经验</a></div>
        <div id="add_work" class="layui-field-box" style="text-align: center;" hide>
            <table class="layui-table experience_table" lay-even lay-skin="nob">
                <colgroup>
                    <col width="100px">
                    <col style="min-width: 250px;">
                    <col width="100px">
                    <col style="min-width: 250px;">
                </colgroup>
                <tbody>
                <tr>
                    <td style="float: right;">公司名</td>
                    <td><input type="text" class="layui-input" name="company"></td>
                    <td style="float: right;">公司key</td>
                    <td><input type="text" class="layui-input" name="companyKey" disabled></td>
                </tr>
                <tr>
                    <td style="float: right;">职位</td>
                    <td><input type="text" class="layui-input" name="position"></td>
                    <td style="float: right;">学位</td>
                    <td><input type="text" class="layui-input" name="education"></td>
                </tr>
                <tr>
                    <td style="float: right;">开始时间</td>
                    <td><input class="layui-input select_date" name="startTime" placeholder="年-月-日"></td>
                    <td style="float: right;">结束时间</td>
                    <td><input class="layui-input select_date" name="endTime" placeholder="年-月-日"></td>
                </tr>
                <tr>
                    <td style="float: right;">详细描述</td>
                    <td colspan="3">
                        <textarea name="description" style="width: 100%;min-height: 100px;resize: vertical;" placeholder="请描述一下您的工作经历"></textarea>
                    </td>
                </tr>
                </tbody>
            </table>
            <div>
                <input type="button" class="layui-btn" value="保存">
                <input type="button" class="layui-btn layui-btn-primary" value="取消" style="margin-left: 10px;">
            </div>
        </div>
    </fieldset>
<script>
    $(document).ready(function () {
         layui.use('laydate', function () {
             //name时间选择器
             var laydate = layui.laydate;
             laydate.render({
                 elem: 'input[name="startTime"]',
                 type: 'date'
             });
             laydate.render({
                 elem: 'input[name="endTime"]',
                 type: 'date'
             });
         });
    });
</script>
</body>
</html>
