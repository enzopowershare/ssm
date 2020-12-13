<%--
  Created by IntelliJ IDEA.
  User: Enzo
  Date: 2020/12/13
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<form class="layui-form" action="${pageContext.request.contextPath}/updatePersonInfo.do">
    <div class="layui-form-item">
        <label class="layui-form-label">id</label>
        <div class="layui-input-block">
            <input type="text" name="updatePersonId" required lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">name</label>
        <div class="layui-input-block">
            <input type="text" name="title" required lay-verify="updatePersonName" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">age</label>
        <div class="layui-input-block">
            <input type="text" name="title" required lay-verify="updatePersonAge" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">address</label>
        <div class="layui-input-block">
            <input type="text" name="updatePersonAddress" required lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">location</label>
        <div class="layui-input-block">
            <select name="updatePersonAreaId" lay-verify="required">
                <option value=""></option>
                <option value="1">丰台区</option>
                <option value="2">海淀区</option>
                <option value="3">房山区</option>
                <option value="4">西城区</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</body>
</html>
