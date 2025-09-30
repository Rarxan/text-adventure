<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.javarush.textadventure.service.GameService" %>
<%
    GameService game = (GameService) session.getAttribute("game");
    if (game == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }

    String resultBackground;
    if (game.isGameOver()) {
        resultBackground = "images/GameOver.jpg";
    } else {
        resultBackground = "images/q12_King.jpg";
    }
%>

<html>
<head>
    <meta charset="utf-8">
    <title>Text Adventure - Result</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('<%= resultBackground %>') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.35);
            padding: 30px 50px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border: 2px solid #4CAF50;
            text-align: center;
            width: auto;
            max-width: 600px;
            margin-bottom: 50px;
        }

        h1 {
            font-family: 'Georgia', serif;
            font-size: 36px;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin: 20px 0;
        }

        .restart-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            border-radius: 5px;
            transition: background 0.3s;
            font-size: 16px;
        }

        .restart-btn:hover {
            background-color: #45a049;
        }

        .result-text{
            font-weight: bold;
        }
    </style>

</head>
<body>
<div class="container">
    <h1>Game Over!</h1>

    <%if (game.isGameOver()) {%>
    <p><%= game.getDeathMessage() %></p>
    <%
    } else {
    %>
    <h2>Congratulations, <%= game.getPlayerName() %>!</h2>
    <h1>YOU ARE THE NEW KING OF THE CASTLE!</h1>
    <p class="result-text">The throne is yours, and the fire of the hall bows before your power...</p>

    <%
        }
    %>

    <a class="restart-btn" href="<%= request.getContextPath() %>/welcome.jsp">Play Again</a>
</div>
</body>
</html>
