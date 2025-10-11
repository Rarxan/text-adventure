<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.javarush.textadventure.service.GameService" %>
<%
    GameService game = (GameService) session.getAttribute("game");
    if (game == null) {
        response.sendRedirect(request.getContextPath() + "/welcome.jsp");
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
            transition: background 1.5s ease-in-out;
        }

        .container {
            position: relative;
            border: 3px solid #bfa76f;
            border-radius: 15px;
            padding: 40px 60px;
            box-shadow: 0 0 25px rgba(0,0,0,0.5);
            text-align: center;
            animation: fadeIn 1s forwards;
            max-width: 600px;
            margin-bottom: 50px;
            color: #5b3a00;
            background: none;
            overflow: hidden;
        }

        .container::before {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: url('images/parchment_texture.jpg') no-repeat center center;
            background-size: cover;
            opacity: 0.8;
            border-radius: 15px;
            z-index: -1;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        h1, h2, p {
            text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
            font-family: 'Georgia', serif;
            margin: 10px 0;
            color: #5b3a00;
        }

        .restart-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            border-radius: 5px;
            transition: background 0.3s, transform 0.2s, box-shadow 0.2s;
            font-size: 16px;
        }

        .restart-btn:hover {
            background-color: #45a049;
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(0,0,0,0.4);
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
