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
            background: url('images/Welcome.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0;
            animation: fadeIn 1s forwards;

        }
        @keyframes fadeIn {
            to{
                opacity: 1;
            }
        }

        .container {
            background-color: rgba(255, 255, 255, 0.2);
            padding: 50px 60px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            text-align: center;
        }

        h1 {
            font-family: 'Cinzel', serif;
            font-size: 2.5em;
            margin-bottom: 30px;
            color: #333;
        }

        input[type=text] {
            padding: 12px;
            width: 250px;
            margin: 15px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1em;
        }

        input[type=submit] {
            padding: 12px 25px;
            font-size: 1em;
            cursor: pointer;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 8px;
            transition: transform 0.2s, box-shadow 0.2s, background-color 0.2s;
        }

        input[type=submit]:hover {
            transform: scale(1.1);
            box-shadow: 0 0 15px rgba(0,0,0,0.4);
            background-color: #45a049;
        }

        ::placeholder {
            color: #aaa;
            font-style: italic;
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
