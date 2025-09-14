package com.ecommerce.controller;

import com.ecommerce.bean.Product;
import com.ecommerce.dao.ProductDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get products from the DAO
        ProductDao productDao = new ProductDao();
        List<Product> productList = productDao.getAllProducts();

        // 2. Set the product list as a request attribute
        request.setAttribute("productList", productList);

        // 3. Forward the request to the JSP page to display the products
        request.getRequestDispatcher("products.jsp").forward(request, response);
    }
}