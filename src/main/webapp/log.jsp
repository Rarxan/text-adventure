<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    String action = request.getParameter("action");
    String player = request.getParameter("player");
    String message = request.getParameter("message");

    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String timestamp = dtf.format(LocalDateTime.now());

    if (action != null && player != null && message != null) {
        out.println("[" + timestamp + "] Player: " + player + "| Action : " + action + " | " + message);
    } else {
        out.println("No log data provided");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
