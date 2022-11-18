<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17/11/2022
  Time: 4:14 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="C:\Users\Admin\Desktop\Codegym\Module 3\ss10\BaiTap1\Show_List_Customer\web\css\style.css">
    <title>Title</title>
</head>
<body>
    <table>
        <tr>
            <th>Name</th>
            <th>Date Of Birth</th>
            <th>Address</th>
            <th>Avatar</th>
        </tr>
        <c:forEach items="${customerList}" var="customer">
            <tr>
                <td>${customer.name}</td>
                <td>${customer.dateOfBirth}</td>
                <td>${customer.address}</td>
                <td><img src="${customer.avatarPath}" alt="Avatar"></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
