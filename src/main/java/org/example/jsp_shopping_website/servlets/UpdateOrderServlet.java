package org.example.jsp_shopping_website.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.jsp_shopping_website.entity.enums.Status;
import org.example.jsp_shopping_website.repo.OrderRepo;
import java.io.IOException;

@WebServlet(name = "Update Order", value = "/admin/update/order")
public class UpdateOrderServlet extends HttpServlet {

    OrderRepo orderRepo = new OrderRepo();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newStatus = req.getParameter("orderStatus");
        if (newStatus == null) {
            resp.sendRedirect("/admin/orders.jsp");
        }else {
            boolean completed = Status.valueOf(newStatus).equals(Status.COMPLETED) ||
                    Status.valueOf(newStatus).equals(Status.ARCHIVED);
            int orderId = Integer.parseInt(req.getParameter("orderId"));
            orderRepo.changeStatus(newStatus, orderId, completed);
            resp.sendRedirect("/admin/orders.jsp");
        }
    }
}
