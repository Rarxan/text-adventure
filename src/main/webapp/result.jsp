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
        resultBackground = "images/q12_Arthas.jpg";
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
            text-align: center;
            padding-top: 100px;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.3);
            padding: 50px;
            display: inline-block;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border: 2px solid #4CAF50;
            text-align: center;
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
    <h1>YOU ARE THE NEW LICH KING!</h1>
    <p>The throne is yours, darkness bows before you...</p>

    <%
        }
    %>

    <a class="restart-btn" href="<%= request.getContextPath() %>/welcome.jsp">Play Again</a>
</div>
</body>
</html>
