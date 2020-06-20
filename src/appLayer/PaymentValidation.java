package appLayer;

import dataLayer.CreditCard;
import dataLayer.Product;
import dataLayer.Order;
import dataLayer.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class PaymentValidation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String ccNumber = request.getParameter("ccNumber");
        String ccExpMo = request.getParameter("ccExpMo");
        String ccExpYr = request.getParameter("ccExpYr");
        String cvv = request.getParameter("cvv");

        CreditCard cc = new CreditCard();
        if (cc.isValidCC(ccNumber, ccExpMo, ccExpYr, cvv)){
            System.out.print(">> Payment accepted!");

            HttpSession session = request.getSession();

            Order order = new Order();

            String userID = (String) session.getAttribute("userName");
            Integer orderValue = (Integer) session.getAttribute("orderPrice");

            User thisUser = new User();
            thisUser = thisUser.getUserDetailsByName(userID);

            System.out.print("\n>> Sending order to user with email "+ thisUser.getEmail());

            order.storeOrder(thisUser.getCustomerID(), (List<Product>) session.getAttribute("cartProducts"), orderValue);
            request.getRequestDispatcher("/orderPlaced.jsp").forward(request,response);
        }
    }
}
