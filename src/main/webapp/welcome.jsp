<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Welcome to the Adventure!</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@700&family=Roboto&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('images/Welcome.jpg') no-repeat center center fixed;
            background-size: cover;
            transition: background 1s ease-in-out;
        }

        .container {
            background: url('images/parchment_texture.jpg') no-repeat center center;
            background-size: cover;
            padding: 60px 70px;
            border-radius: 15px;
            border: 3px solid #6b4226;
            box-shadow: 0 0 30px rgba(255, 215, 0, 0.5);
            text-align: center;
            animation: fadeIn 1s forwards;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: scale(0.95);}
            to {opacity: 1; transform: scale(1);}
        }

        h1 {
            font-family: 'Cinzel', serif;
            font-size: 2.5em;
            margin-bottom: 30px;
            color: #4b2e0f;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.5);
        }

        input[type=text], input[type=submit] {
            font-family: 'Georgia', serif;
            font-size: 1em;
            border-radius: 8px;
            padding: 12px;
            margin: 15px 0;
            border: 2px solid #6b4226;
            transition: all 0.3s ease;
        }

        input[type=text]:focus {
            outline: none;
            box-shadow: 0 0 12px rgba(255, 215, 0, 0.7);
            border-color: #d4af37;
        }

        input[type=submit] {
            background-color: #8b4513;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
        }

        input[type=submit]:hover {
            transform: scale(1.05);
            box-shadow: 0 0 18px rgba(255, 215, 0, 0.9);
            background-color: #a0522d;
        }

        input[type=submit]:active {
            transform: scale(0.95);
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to the Adventure!</h1>
    <form action="${pageContext.request.contextPath}/start" method="post" onsubmit="this.querySelector('input[type=submit]').disabled = true;">
        <input type="text" name="playerName" placeholder="Enter your name" required>
        <br>
        <input type="submit" value="Start Game">
    </form>
</div>
</body>
</html>
