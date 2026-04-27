package com.javarush.servlets;

import com.javarush.textadventure.service.GameService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/start")
public class StartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String playerName = request.getParameter("playerName");

        if (playerName == null || playerName.trim().isEmpty()) {
            response.sendRedirect("welcome.jsp");
            return;
        }

        GameService game = new GameService();
        game.startGame(playerName);

        HttpSession session = request.getSession();
        session.setAttribute("game", game);

        response.sendRedirect("question.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("welcome.jsp");
    }
}