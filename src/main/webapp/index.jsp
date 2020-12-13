<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>JSP - Hello World</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Hello World!</h1>--%>
<%--</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<div class="demoTable">
    用户ID：
    <div class="layui-inline">
        <input class="layui-input" name="id" id="demoReload" autocomplete="off">
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    用户名：
    <div class="layui-inline">
        <input class="layui-input" name="id" id="nameReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
    <button class="layui-btn layui-btn-primary" data-type="reset">重置</button>
</div>
<table class="layui-hide" id="showPerson" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="addPerson"><a
                href="${pageContext.request.contextPath}/insert.jsp">添加</a></button>
        <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deletePersons">删除</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="view">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#showPerson'
            , url: '${pageContext.request.contextPath}/findAllPersonPage.do'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports']
            , page: true
            , title: '用户数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'personid', title: 'id', width: 80, sort: true, fixed: 'left'}
                , {field: 'personname', title: 'name', width: 80}
                , {field: 'personage', title: 'age', width: 80, sort: true}
                , {field: 'personaddress', title: 'address', width: 100}
                , {field: 'areaname', title: 'areaName', width: 100}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 170}
            ]]
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'addPerson':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'deletePersons':
                    var data = checkStatus.data;
                    for (const x of data) {
                        fetch('${pageContext.request.contextPath}/deletePersonById.do?personId=' + x.personid);
                    }
                    location.href = "${pageContext.request.contextPath}/";
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    fetch('${pageContext.request.contextPath}/deletePersonById.do?personId=' + obj.data.personid);
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
            }
        });
    });
</script>

</body>
</html>