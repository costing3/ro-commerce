package webApp;

import dataLayer.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("product-search");
        Product productObj = new Product();
        List<Product> products;
        products = productObj.getProducts(searchQuery); //TODO: Data validation

        request.setAttribute("uSearchedProducts", products);
        request.getRequestDispatcher("/productSearch.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("homepage");
    }
}
