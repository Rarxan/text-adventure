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

        input[type=text] {
            padding: 10px;
            width: 200px;
            margin: 10px 0;
        }

        input[type=submit], button {
            padding: 10px 20px;
            cursor: pointer;
        }

        .container {
            background-color: #fff;
            padding: 50px;
            display: inline-block;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border: 2px solid #4CAF50;
        }
    </style>
</head>
<body>

<h1>Question</h1>
<p><%= game.getCurrentQuestion() %></p>

<form action="<%= request.getContextPath() %>/question" method="POST">
    <input type="text" name="answer" placeholder="Your answer here" required>
    <button type="submit">Submit</button>
</form>

</body>
</html>
