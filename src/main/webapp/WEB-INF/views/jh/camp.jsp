<%--
  Created by IntelliJ IDEA.
  User: butterflakes
  Date: 2023/12/11
  Time: 0:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Spring Boot 3 JSP Page</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/camp.css">
</head>
<body>
    <h1>This is JSP Page with Spring Boot 3</h1>
    <h2 id="aaa">From ${msg} controller...</h2>
    <c:forEach var="i" begin="1" end="10" step="1">
        <div>${i}</div>
    </c:forEach>
</body>
</html>
