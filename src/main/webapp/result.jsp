<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.javarush.textadventure.service.GameService" %>
<%
    GameService game = (GameService) session.getAttribute("game");
    if (game == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<html>
<head>
    <meta charset="utf-8">
    <title>Text Adventure - Result</title>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to bottom right, #a1c4fd, #c2e9fb);
            text-align: center;
            padding-top: 100px;
        }

        h1, h2, p {
            font-family: 'Lobster', cursive;
            color: #333;
        }

        .container {
            background-color: #fff;
            padding: 50px;
            display: inline-block;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border: 2px solid #4CAF50;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            border-radius: 5px;
        }

        a:hover {
            background-color: #45a049;
        }
    </style>

</head>
<body>

<h1>Game Over!</h1>
<p>Congratulations, <%= game.getPlayerName() %>! You finished the adventure.</p>
</body>
</html>
