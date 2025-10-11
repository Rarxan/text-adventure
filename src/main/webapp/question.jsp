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
            font-family: 'Georgia', serif;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('<%= game.getCurrentBackground() %>') no-repeat center center fixed;
            background-size: cover;
            transition: background 1s ease-in-out;
        }

        .container {
            position: relative;
            z-index: 0;
            border: 3px solid #6b4226;
            border-radius: 15px;
            padding: 50px;
            width: 400px;
            text-align: center;
            box-shadow: 0 0 30px rgba(255, 215, 0, 0.6);
            animation: fadeIn 1s forwards;
            overflow: hidden;
            background: none;
        }

        .container::before {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: url('images/parchment_texture.jpg') no-repeat center center;
            background-size: cover;
            opacity: 0.6;
            border-radius: 15px;
            z-index: -1;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: scale(0.95);}
            to {opacity: 1; transform: scale(1);}
        }

        h1 {
            font-family: 'Cinzel', serif;
            font-size: 2em;
            color: #4b2e0f;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.6);
        }

        p {
            font-size: 1.1em;
            color: #3a1f0b;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.5);
            margin-bottom: 30px;
        }

        input[type=text], input[type=submit] {
            font-family: 'Georgia', serif;
            font-size: 1em;
            border-radius: 8px;
            padding: 10px;
            margin: 10px 0;
            border: 2px solid #6b4226;
            transition: all 0.3s ease;
        }

        input[type=text]:focus {
            outline: none;
            box-shadow: 0 0 10px rgba(255, 215, 0, 0.7);
            border-color: #d4af37;
        }

        input[type=submit] {
            background-color: #8b4513;
            color: #fff;
            cursor: pointer;
            font-weight: bold;
        }

        input[type=submit]:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
            background-color: #a0522d;
        }

        input[type=submit]:active {
            transform: scale(0.95);
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
