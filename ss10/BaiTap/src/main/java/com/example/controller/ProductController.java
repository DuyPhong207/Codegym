package com.example.controller;

import com.example.model.Product;
import com.example.service.Impl.ProductServiceImpl;
import com.example.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "list":
                    showList(request, response);
                break;
            case "remove":
                break;
            case "search":
                break;
            default:
                showList(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("/product?action=list");
            return;
        }

        switch (action) {
            case "create":
                doCreate(request, response);
                break;
            case "edit":
                try {
                    doEdit(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "remove":
                break;
            case "search":
                break;
            default:
                response.sendRedirect("/product?action=list");
        }
    }

    private void doCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        Float price = Float.parseFloat(request.getParameter("price"));
        String desc = request.getParameter("desc");
        Product product = new Product(id, name, price, desc);
        productService.create(product);
        response.sendRedirect("product?action=list");
    }

    private void doEdit(HttpServletRequest request, HttpServletResponse response) throws Exception, ServletException {
        String idEdit = request.getParameter("idEdit");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        Float price = Float.parseFloat(request.getParameter("price"));
        String desc = request.getParameter("desc");
        Product product = new Product(id, name, price, desc);
        productService.edit(idEdit, product);
        response.sendRedirect("product?action=list");
    }

    private void showEdit (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product/edit.jsp").forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product/create.jsp").forward(request, response);
    }

    private void showList (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("productList", productService.findAll());
        request.getRequestDispatcher("product/list.jsp").forward(request, response);
    }
}
