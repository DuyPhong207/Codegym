<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17/11/2022
  Time: 3:09 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form method="post" action="/CalculatorDiscountServlet">
    <label>Description</label>
    <input type="text" name="desc"><br>
    <label>Price</label>
    <input type="text" name="price"><br>
    <label>Discount Percent</label>
    <input type="text" name="discountPercent"><br>
    <input type="submit" value="Calculator Discount">
  </form>
  </body>
</html>
