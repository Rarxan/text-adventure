package com.javarush.servlets;

import com.javarush.textadventure.service.GameService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/question")
public class QuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        GameService game = (GameService) session.getAttribute("game");

        if (game == null) {
            response.sendRedirect("welcome.jsp");
            return;
        }

        String answer = request.getParameter("answer");

        if (answer != null) {
            game.answerQuestion(answer);
        }

        if (game.isGameFinished()) {
            response.sendRedirect("result.jsp");
        } else {
            response.sendRedirect("question.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("question.jsp");
    }
}