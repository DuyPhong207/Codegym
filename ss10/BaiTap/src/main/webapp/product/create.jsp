<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/11/2022
  Time: 2:18 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
    <h1>Create New Product</h1>
    <form action="/product" method="post">
        <table border="1">
            <tr>
                <td>Id</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price"></td>
            </tr>
            <tr>
                <td>Id</td>
                <td><input type="text" name="desc"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Create"></td>
                <td><input type="reset" value="Reset"></td>
            </tr>
        </table>
        <input type="hidden" name="action" value="create">
    </form>
</body>
</html>
