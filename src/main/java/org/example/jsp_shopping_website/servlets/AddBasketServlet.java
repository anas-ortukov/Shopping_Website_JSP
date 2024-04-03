package org.example.jsp_shopping_website.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.jsp_shopping_website.entity.Basket;
import org.example.jsp_shopping_website.service.BasketService;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "AddBasket", urlPatterns = "/basket/add")
public class AddBasketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UUID productId = UUID.fromString(req.getParameter("productId"));
        Basket basket = BasketService.getBasket();
        BasketService.addBasketProduct(basket, productId);
        resp.sendRedirect("http://localhost:8080");
    }
}