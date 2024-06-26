package org.example.jsp_shopping_website.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.jsp_shopping_website.service.SessionService;

import java.io.IOException;

@WebServlet(name = "ConfirmationOrder", urlPatterns = "/order/confirm")
public class OrderConfirmServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SessionService.createOrder(req.getSession());
        req.getSession().setAttribute("orderNotification",true);
        resp.sendRedirect("/");
    }
}
