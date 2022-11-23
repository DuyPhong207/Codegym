<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21/11/2022
  Time: 10:35 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
  <form action="/product" method="post">
    <table border="1">
      <tr>
        <td>Id product need edit</td>
        <td><input type="text" name="idEdit"></td>
      </tr>
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
        <td>Description</td>
        <td><input type="text" name="desc"></td>
      </tr>
      <tr>
        <td><input type="submit" value="Update"></td>
        <td><input type="reset" value="Reset"></td>
      </tr>
    </table>
    <input type="hidden" name="action" value="edit">
  </form>
</body>
</html>
