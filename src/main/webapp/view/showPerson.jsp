<%--
  Created by IntelliJ IDEA.
  User: Enzo
  Date: 2020/12/12
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show Person</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</head>
<body>
<table id="showPerson" lay-filter="test"></table>
</body>
<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#showPerson'
            , height: 500
            , url: '${pageContext.request.contextPath}/findAllPersonPage.do' //数据接口
            , page: true //开启分页
            , limit: 10
            , cols: [[ //表头
                {field: 'personid', title: 'id', width: 80, sort: true, fixed: 'left'}
                , {field: 'personname', title: 'name', width: 80}
                , {field: 'personage', title: 'age', width: 80, sort: true}
                , {field: 'personaddress', title: 'address', width: 100}
                , {field: 'areaname', title: 'areaName', width: 100}
            ]]
        });
    });
</script>
</html>
