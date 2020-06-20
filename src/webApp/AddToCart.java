package webApp;

import dataLayer.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AddToCart extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session.getAttribute("userName") != null) {

            List<Product> cartProducts = new ArrayList<>();
            if (session.getAttribute("cartProducts") != null) //if the user has previously added some items to cart
                cartProducts = (List<Product>) session.getAttribute("cartProducts");  //get the previous items

            Product addedProduct = new Product();
            int pID = (Integer.parseInt(request.getParameter("idul")));
            addedProduct = addedProduct.getProduct(pID);

            cartProducts.add(addedProduct); //add this item (addedProduct) to user's list of cart items
            session.setAttribute("cartProducts", cartProducts); //then send it via session object

//        session.setAttribute("cartItem1", addedProduct);
            System.out.print(">> [DEBUG] cartProducts: " + cartProducts + ", this pID: " + pID + ", added product: " + addedProduct + ", NO. of products: " + session.getAttribute("cartItems"));
            session.setAttribute("cartItems", (Integer) session.getAttribute("cartItems") + 1);


            request.getRequestDispatcher("/shoppingCart.jsp").forward(request, response);
        } else {
            session.setAttribute("warningMessage", "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n" +
                    "  <strong>You're not logged in!<br></strong>In order to add products to cart, you must log in first\n" +
                    "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                    "    <span aria-hidden=\"true\">&times;</span>\n" +
                    "  </button>\n" +
                    "</div>");
            response.sendRedirect("login"); //log in first
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if((session.getAttribute("cartProducts") !=null ) && (session.getAttribute("userName"))!=null) //if the user has at least 1 item && is logged in
            request.getRequestDispatcher("/shoppingCart.jsp").forward(request, response); //let him in
        else if((session.getAttribute("userName"))!=null) //if the user is logged in, but no items
            request.getRequestDispatcher("/emptyShoppingCart.jsp").forward(request, response); //empty shopping cart
        else { //elseif the user is not logged in, bye
            request.setAttribute("warningMessage", "<div style=\"position: absolute; right: 362px; margin-top:10px\" class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\">\n" +
                    "  <strong>You're not logged in!<br></strong>In order to access the shopping cart, you need to be <a href=\"login\">signed in</a>\n" +
                    "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                    "    <span aria-hidden=\"true\">&times;</span>\n" +
                    "  </button>\n" +
                    "</div>");
            request.getRequestDispatcher("/homepage").forward(request, response);
        }
    }
}
