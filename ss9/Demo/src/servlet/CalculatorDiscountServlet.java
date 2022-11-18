package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorDiscountServlet", value = "/CalculatorDiscountServlet")
public class CalculatorDiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String desc = request.getParameter("desc");
        Float price = Float.parseFloat(request.getParameter("price"));
        int discount = Integer.parseInt(request.getParameter("discountPercent"));
        Float discountAmount = price * discount / 100;
        Float total = price - discountAmount;
        request.setAttribute("desc", desc);
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("total", total);
        request.getRequestDispatcher("displayDiscount.jsp").forward(request, response);
    }
}
