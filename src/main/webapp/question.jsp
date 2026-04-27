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
    <title>Question</title>

    <style>
        html, body {
            margin: 0;
            height: 100vh;
            overflow: hidden;
            background: #111;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Georgia, serif;

            cursor: url('images/Arrow.cur'),
            url('images/Arrow.png') 4 4,
            auto;
        }

        .bg-layer {
            position: fixed;
            inset: 0;
            background: url('<%= game.getCurrentBackground() %>') no-repeat center center;
            background-size: cover;
            z-index: 1;
            opacity: 0;
            transition: 1.2s ease-in-out;
            animation: breathe 10s ease-in-out infinite alternate,
            colorPulse 12s ease-in-out infinite;
            transform-origin: center;
            filter: brightness(1.25) contrast(1.05);
            transform: scale(1.08);
        }

        video.fire, video.smoke {
            position: fixed;
            inset: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            pointer-events: none;
        }

        video.fire {
            z-index: 2;
            opacity: 0;
            transition: 1.2s ease-in-out;
            filter: brightness(1.15) contrast(1.2) saturate(1.3);
        }

        video.smoke {
            z-index: 3;
            opacity: 0;
            transition: 1.2s ease-in-out;
            mix-blend-mode: screen;
            filter: brightness(1.05) contrast(1.1);
        }

        .overlay {
            position: fixed;
            inset: 0;
            background: radial-gradient(circle, rgba(0,0,0,0.05), rgba(0,0,0,0.45));
            z-index: 4;
            opacity: 0;
            transition: 1.2s ease-in-out;
        }

        .color-grade {
            position: fixed;
            inset: 0;
            z-index: 4;
            pointer-events: none;
            background:
                    radial-gradient(circle at 30% 30%, rgba(255,180,90,0.10), transparent 60%),
                    radial-gradient(circle at 70% 70%, rgba(120,200,255,0.08), transparent 55%);
        }

        .vignette {
            position: fixed;
            inset: 0;
            z-index: 5;
            pointer-events: none;
            background:
                    radial-gradient(circle, rgba(0,0,0,0) 50%,
                    rgba(0,0,0,0.22) 80%,
                    rgba(0,0,0,0.4) 100%);
        }

        .container {
            position: relative;
            z-index: 6;
            width: 460px;
            padding: 55px;
            border-radius: 15px;
            border: 3px solid #6b4226;
            text-align: center;
            opacity: 0;
            transform: translateY(15px);
            transition: 1.2s ease-in-out;
        }

        .container::before {
            content: "";
            position: absolute;
            inset: 0;
            background:
                    linear-gradient(rgba(255,255,255,0.15), rgba(0,0,0,0.15)),
                    url('images/parchment_texture.jpg') center/cover no-repeat;
            opacity: 0.5;
            filter: blur(0.3px);
            z-index: -1;
        }

        h1 { color: #2b160a; margin-bottom: 15px; }

        .question-text {
            color: #1a0e08;
            font-size: 18px;
            line-height: 1.6;
            min-height: 60px;
        }

        input[type=text] {
            width: 80%;
            padding: 12px;
            margin-top: 18px;
            border-radius: 10px;
            border: 2px solid #6b4226;
            background: rgba(255,250,235,0.98);
            font-family: Georgia;
            font-size: 17px;
            font-weight: 600;
            text-align: center;
            outline: none;
            transition: 0.25s ease;
        }

        input[type=text]:focus {
            border-color: gold;
            box-shadow: 0 0 18px rgba(255,215,120,0.6);
            transform: scale(1.03);
        }

        input[type=submit] {
            margin-top: 18px;
            padding: 12px 28px;
            border-radius: 10px;
            border: 2px solid #bfa76f;
            background: linear-gradient(145deg, #2a160b, #0f0804);
            color: #f5d7a1;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s ease;
        }

        input[type=submit]:hover {
            transform: scale(1.05);
            box-shadow: 0 0 18px rgba(255, 215, 120, 0.5);
            border-color: #fff3c4;
        }

        .show .bg-layer { opacity: 1; }
        .show video.fire { opacity: 0.7; }
        .show video.smoke { opacity: 0.35; }
        .show .container { opacity: 1; transform: translateY(0); }

        .word {
            display: inline-block;
            font-weight: 700;
            color: #fff3c4;
            text-shadow:
                    0 0 4px rgba(255, 215, 120, 0.35),
                    0 0 10px rgba(255, 180, 90, 0.25);
        }

    </style>
</head>

<body>

<div class="bg-layer"></div>

<video class="fire" autoplay muted loop playsinline>
    <source src="${pageContext.request.contextPath}/video/fire_intro.mp4">
</video>

<video class="smoke" autoplay muted loop playsinline>
    <source src="${pageContext.request.contextPath}/video/smoke.mp4">
</video>

<div class="overlay"></div>
<div class="color-grade"></div>
<div class="vignette"></div>

<div class="container">

    <h1>Question</h1>

    <p id="qtext" class="question-text"><%= game.getCurrentQuestion() %></p>

    <form id="form" action="${pageContext.request.contextPath}/question" method="POST">
        <input type="text" name="answer" placeholder="Your answer..." required>
        <br>
        <input type="submit" value="Submit">
    </form>

</div>

<audio id="bgMusic" loop preload="auto">
    <source src="${pageContext.request.contextPath}/audio/Dark_Fantasy.mp3" type="audio/mpeg">
</audio>

<script>

    const music = document.getElementById("bgMusic");

    window.addEventListener("load", () => {

        setTimeout(() => {
            document.body.classList.add("show");
            highlightOptions();
        }, 30);

        if (localStorage.getItem("music") === "on") {
            const t = localStorage.getItem("musicTime");
            if (t) music.currentTime = parseFloat(t);

            music.volume = 0.6;
            music.play();
        }
    });

    setInterval(() => {
        if (!music.paused) {
            localStorage.setItem("musicTime", music.currentTime);
        }
    }, 500);

    function highlightOptions() {
        const el = document.getElementById("qtext");

        let html = el.innerHTML;

        html = html.replace(/\*([A-Z]+)\*/g,
            '<span class="word">$1</span>'
        );

        el.innerHTML = html;
    }

</script>

</body>
</html>