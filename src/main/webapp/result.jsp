<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.javarush.textadventure.service.GameService" %>
<%
    GameService game = (GameService) session.getAttribute("game");
    if (game == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Game Result</title>
</head>
<body>

<h1>Game Over!</h1>
<p>Congratulations, <%= game.getPlayerName() %>! You finished the adventure.</p>
</body>
</html>
