<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.javarush.textadventure.service.GameService" %>

<%
    GameService game = (GameService) session.getAttribute("game");
    if (game == null) {
        response.sendRedirect(request.getContextPath() + "/welcome.jsp");
        return;
    }

    boolean isGameOver = game.isGameOver();
    String background = isGameOver ? "images/GameOver.jpg" : "images/q12_King.jpg";
    String videoSrc = isGameOver
            ? request.getContextPath() + "/video/fire-dead.mp4"
            : request.getContextPath() + "/video/fire_intro.mp4";
%>

<html>
<head>
    <meta charset="utf-8">
    <title>Final Result</title>

    <style>
        body {
            margin: 0;
            height: 100vh;
            overflow: hidden;
            font-family: Georgia, serif;
            background: black;
        }

        .bg-layer {
            position: fixed;
            inset: 0;
            background: url('<%= background %>') no-repeat center center;
            background-size: cover;
            z-index: 1;
            opacity: 0;
            transition: 2s ease-in-out;
            animation: breathe 10s ease-in-out infinite alternate,
            lightShift 6s ease-in-out infinite alternate;
        }

        @keyframes breathe {
            0% { transform: scale(1.05); }
            100% { transform: scale(1.10); }
        }

        @keyframes lightShift {
            0% { filter: brightness(1.05) contrast(1.05); }
            50% { filter: brightness(1.18) contrast(1.08); }
            100% { filter: brightness(1.02) contrast(1.02); }
        }

        @keyframes glowPulse {
            0%   { filter: brightness(1.2) saturate(1.2); }
            50%  { filter: brightness(1.5) saturate(1.5); }
            100% { filter: brightness(1.2) saturate(1.2); }
        }

        .video-layer {
            position: fixed;
            inset: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: 2;
            pointer-events: none;
            opacity: 0;
            transition: 1.5s ease-in-out;
            mix-blend-mode: screen;
            animation: glowPulse 3s ease-in-out infinite;
        }

        .dark-overlay {
            position: fixed;
            inset: 0;
            background: radial-gradient(circle,
            rgba(0, 0, 0, 0.20),
            rgba(0, 0, 0, 0.88)
            );
            z-index: 3;
            opacity: 1;
        }

        .color-grade {
            position: fixed;
            inset: 0;
            z-index: 3;
            pointer-events: none;
            background:
                    radial-gradient(circle at 30% 30%, rgba(255,180,90,0.08), transparent 60%),
                    radial-gradient(circle at 70% 70%, rgba(120,200,255,0.06), transparent 55%);
        }

        .vignette {
            position: fixed;
            inset: 0;
            z-index: 4;
            pointer-events: none;
            background: radial-gradient(
                    circle,
                    rgba(0,0,0,0) 45%,
                    rgba(0,0,0,0.25) 70%,
                    rgba(0,0,0,0.55) 100%
            );
        }

        .depth-shadow {
            position: fixed;
            inset: 0;
            z-index: 3;
            pointer-events: none;
            background: radial-gradient(
                    circle at center,
                    rgba(255, 200, 120, 0.06),
                    rgba(0, 0, 0, 0.35)
            );
            mix-blend-mode: overlay;
        }

        .ui {
            position: relative;
            z-index: 5;
            height: 100%;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            flex-direction: column;
            opacity: 0;
            transform: translateY(40px);
            transition: opacity 2s ease, transform 2s ease;
        }

        .panel {
            margin-bottom: 60px;
            padding: 30px 50px;
            background: rgba(0,0,0,0.65);
            border: 2px solid #bfa76f;
            border-radius: 12px;
            text-align: center;
            color: #f5d7a1;
        }

        .win {
            color: gold;
            text-shadow: 0 0 25px gold;
        }

        .lose {
            color: crimson;
            text-shadow: 0 0 25px red;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 28px;
            border-radius: 10px;
            border: 2px solid #bfa76f;
            background: linear-gradient(145deg, #2a1a0f, #000);
            color: #f5d7a1;
            text-decoration: none;
            transition: 0.25s ease;
        }

        .btn:hover {
            transform: scale(1.05);
            color: #fff3c4;
            text-shadow:
                    0 0 8px rgba(255, 215, 120, 0.8),
                    0 0 18px rgba(255, 180, 90, 0.5);
            box-shadow: 0 0 18px rgba(255, 215, 120, 0.35);
        }

        .show-video .video-layer { opacity: 0.65; }
        .show-bg .bg-layer { opacity: 1; }
        .show-ui .ui { opacity: 1; transform: translateY(0); }
    </style>
</head>

<body>

<div class="bg-layer"></div>
<div class="depth-shadow"></div>

<video class="video-layer" autoplay muted loop playsinline>
    <source src="<%= videoSrc %>" type="video/mp4">
</video>

<div class="dark-overlay"></div>
<div class="color-grade"></div>
<div class="vignette"></div>

<div class="ui">
    <div class="panel">

        <% if (isGameOver) { %>
        <h1 class="lose">YOU DIED, <%= game.getPlayerName() %></h1>
        <p><%= game.getDeathMessage() %></p>
        <% } else { %>
        <h1 class="win">YOU ARE THE NEW KING, <%= game.getPlayerName() %></h1>
        <p>The throne is yours, and the fire of the hall bows before your power...</p>
        <% } %>

        <a href="<%= request.getContextPath() %>/welcome.jsp" class="btn">
            Play Again
        </a>

    </div>
</div>

<script src="${pageContext.request.contextPath}/js/audioEngine.js"></script>

<script>

    window.addEventListener("load", () => {

        document.body.classList.add("show-video");

        setTimeout(() => {
            document.body.classList.add("show-bg");
        }, 400);

        setTimeout(() => {
            document.body.classList.add("show-ui");
        }, 5000);

        if (sessionStorage.getItem("musicOn") === "true") {

            const audio = AudioEngine.getAudio();

            const savedTime = parseFloat(sessionStorage.getItem("musicTime") || "0");

            if (!isNaN(savedTime)) {
                try {
                    audio.currentTime = savedTime;
                } catch (e) {}
            }

            audio.volume = 0.6;

            const playPromise = audio.play();

            if (playPromise !== undefined) {
                playPromise.catch(() => {
                    document.addEventListener("click", () => {
                        audio.play();
                    }, { once: true });
                });
            }
        }

    });

</script>

</body>
</html>