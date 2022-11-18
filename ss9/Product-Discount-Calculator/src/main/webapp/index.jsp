<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form method="post" action="/CalculatorServlet">
    <label>Product Description: </label>
    <input type="text" name="description" ><br>
    <label>List price: </label>
    <input type="text" name="listPrice" ><br>
    <label>Discount Percent: </label>
    <input type="text" name="discountPercent" ><br>
    <input type="submit" name="Calculate Discount">
</form>
</body>
</html>