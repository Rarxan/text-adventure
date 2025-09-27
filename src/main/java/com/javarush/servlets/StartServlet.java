package com.javarush.servlets;

import com.javarush.textadventure.service.GameService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/start")
public class StartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String playerName = request.getParameter("playerName");
        if (playerName == null || playerName.isEmpty()) {
            response.sendRedirect("index.jsp");
            return;
        }

        GameService game = new GameService();
        game.startGame(playerName);

        HttpSession session = request.getSession();
        session.setAttribute("game", game);

        response.sendRedirect("question.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}