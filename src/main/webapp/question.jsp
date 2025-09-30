<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.javarush.textadventure.service.GameService" %>

<%
    GameService game = (GameService) session.getAttribute("game");
    if (game == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>

<html>
<head>
    <meta charset="utf-8">
    <title>Text Adventure - Question</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom right, #a1c4fd, #c2e9fb);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;

            background: url('<%= game.getCurrentBackground() %>') no-repeat center center fixed;
            background-size: cover;

            opacity: 0;
            animation: fadeIn 1s forwards;
        }

        @keyframes fadeIn {
            to{
                opacity: 1;
            }
        }

        h1, p {
            font-family: 'Georgia', serif;
            color: #333;
            font-weight: bold;
        }

        input[type=text] {
            padding: 10px;
            width: 200px;
            margin: 10px 0;
        }

        input[type=submit], button {
            padding: 10px 20px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
        }

        input[type=submit]:hover, button:hover {
            background-color: #45a049;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.5);
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border: 2px solid #4CAF50;
            text-align: center;
            width: 400px;
        }
    </style>
</head>
<body style="background: url('<%= game.getCurrentBackground() %>') no-repeat center center fixed; background-size: cover;">

<div class="container">
    <h1>Question</h1>
    <p><%= game.getCurrentQuestion() %></p>

    <form action="<%= request.getContextPath() %>/question" method="POST">
        <input type="text" name="answer" placeholder="Your answer here" required>
        <br>
        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>
