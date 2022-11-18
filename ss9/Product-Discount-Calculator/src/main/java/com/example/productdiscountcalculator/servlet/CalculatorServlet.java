package com.example.productdiscountcalculator.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String desc = request.getParameter("description");
        Float listPrice = Float.parseFloat(request.getParameter("listPrice"));
        int discountPercent = Integer.parseInt(request.getParameter("discountPercent"));
        Float discountAmount = listPrice * discountPercent / 100;
        Float discountPrice = listPrice - discountAmount;
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("desc", desc);
        request.setAttribute("discountPrice", discountPrice);
        request.getRequestDispatcher("displayDiscount.jsp").forward(request, response);
    }
}
