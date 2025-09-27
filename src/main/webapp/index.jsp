<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Text Adventure</title>
</head>
<body>

<h1>Welcome to the Text Adventure!</h1>
<form action="<%= request.getContextPath() %>/start" method="POST">
    <label for="playername">Enter your name:</label>
    <input type="text" id="playername" name="playerName" required>
    <br><br>
    <button type="submit">Start Game</button>
</form>

</body>
</html>