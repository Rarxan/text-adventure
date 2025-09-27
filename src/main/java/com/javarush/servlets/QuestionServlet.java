package com.javarush.servlets;

import com.javarush.textadventure.service.GameService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/question")
public class QuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        GameService game = (GameService) session.getAttribute("game");

        if (game == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String answer = request.getParameter("answer");
        if (answer != null && !answer.isEmpty()) {
            game.answerQuestion(answer);
        }

        if (game.isGameFinished()) {
            response.sendRedirect("result.jsp");
        } else {
            response.sendRedirect("question.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("question.jsp");
    }
}
