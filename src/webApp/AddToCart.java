package webApp;

import dataLayer.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddToCart extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Product addedProduct = new Product();

        int pID = (Integer.parseInt(request.getParameter("idul")));
        addedProduct = addedProduct.getProduct(pID);

        session.setAttribute("cartItem1", addedProduct);
        session.setAttribute("cartItems", (Integer)session.getAttribute("cartItems")+1);
        request.getRequestDispatcher("/shoppingCart.jsp").forward(request, response);
    }
}
