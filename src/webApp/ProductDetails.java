package webApp;

import dataLayer.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static java.lang.Integer.parseInt;

public class ProductDetails extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product myProduct = new Product();

        Integer productID = parseInt(request.getParameter("id"));
        myProduct = myProduct.getProduct(productID);

        request.setAttribute("MyProduct", myProduct);
        request.getRequestDispatcher("/product.jsp").forward(request, response);
    }
}
