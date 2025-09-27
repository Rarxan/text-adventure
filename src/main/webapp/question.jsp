<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.javarush.textadventure.service.GameService" %>
<%
    GameService game = (GameService) session.getAttribute("game");
    if (game == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<html>
<head>
    <title>Text Adventure - Question</title>
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