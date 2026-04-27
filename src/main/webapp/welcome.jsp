<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Welcome</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@700&family=Roboto&display=swap" rel="stylesheet">

    <style>

        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Roboto', sans-serif;
            background: #111;
            overflow: hidden;
        }

        .bg-layer {
            position: fixed;
            inset: 0;
            background: url('images/Welcome.jpg') no-repeat center center;
            background-size: cover;
            z-index: 1;
            opacity: 0;
            transition: 1.2s ease-in-out;
            transform: scale(1.08);
        }

        video.fire, video.smoke {
            position: fixed;
            inset: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: 2;
            opacity: 0;
            transition: 1.2s ease-in-out;
            pointer-events: none;
        }

        video.smoke {
            z-index: 3;
            mix-blend-mode: screen;
        }

        .overlay {
            position: fixed;
            inset: 0;
            background: radial-gradient(circle,
            rgba(0, 0, 0, 0.05),
            rgba(0, 0, 0, 0.45)
            );
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
                    radial-gradient(circle at 30% 30%, rgba(255, 180, 90, 0.10), transparent 60%),
                    radial-gradient(circle at 70% 70%, rgba(120, 200, 255, 0.08), transparent 55%);
        }

        .vignette {
            position: fixed;
            inset: 0;
            z-index: 5;
            pointer-events: none;
            background: radial-gradient(circle,
            rgba(0, 0, 0, 0) 45%,
            rgba(0, 0, 0, 0.25) 75%,
            rgba(0, 0, 0, 0.45) 100%
            );
        }

        .container {
            position: relative;
            z-index: 6;
            padding: 60px 70px;
            border-radius: 15px;
            border: 3px solid #6b4226;
            text-align: center;
            box-shadow: 0 0 35px rgba(255, 215, 0, 0.55);

            opacity: 0;
            transform: translateY(25px);
            transition: 1.2s ease-in-out;
        }

        .container::before {
            content: "";
            position: absolute;
            inset: 0;
            background: url('images/parchment_texture.jpg') no-repeat center center;
            background-size: cover;
            opacity: 0.35;
            mix-blend-mode: multiply;
            z-index: -1;
        }

        /* ПЛАВНОЕ ПОЯВЛЕНИЕ ЗАГОЛОВКА */
        h1 {
            font-family: 'Cinzel', serif;
            font-size: 2.6em;
            color: #f5d7a1;
            margin-bottom: 20px;

            opacity: 0;
            transform: translateY(10px);

            animation: fadeInTitle 1.5s ease forwards;
        }

        @keyframes fadeInTitle {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        input[type=text] {
            width: 60%;
            max-width: 260px;
            padding: 12px;
            border-radius: 10px;
            border: 2px solid #6b4226;
            font-size: 18px;
            font-weight: 600;
            font-family: Georgia;
            text-align: center;
            background: rgba(255, 245, 220, 0.95);
            color: #2b1a0b;
            outline: none;
        }

        input[type=submit] {
            margin-top: 16px;
            padding: 10px 24px;
            font-size: 15px;
            font-weight: 700;
            font-family: Cinzel;
            color: #f5d7a1;
            background: linear-gradient(145deg, #1a0f08, #3b1f0f);
            border: 2px solid #bfa76f;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.2s ease;
        }

        input[type=submit]:hover {
            transform: scale(1.05);
            box-shadow:
                    0 0 12px rgba(255, 215, 120, 0.45),
                    0 0 22px rgba(255, 180, 90, 0.25);
            border-color: #fff3c4;
        }

        .show .bg-layer { opacity: 1; }
        .show video.fire { opacity: 0.7; }
        .show video.smoke { opacity: 0.35; }
        .show .overlay { opacity: 1; }
        .show .container {
            opacity: 1;
            transform: translateY(0);
        }

        .music-controls {
            margin-top: 15px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .music-btn {
            padding: 9px 14px;
            border: 2px solid #bfa76f;
            background: black;
            color: gold;
            cursor: pointer;
            font-family: Cinzel;
            transition: 0.2s ease;
        }

        .music-btn:hover {
            transform: scale(1.06);
            box-shadow:
                    0 0 10px rgba(255, 215, 120, 0.4),
                    0 0 20px rgba(255, 180, 90, 0.25);
            border-color: #fff3c4;
        }

        .music-btn.start {
            padding: 8px 12px;
            font-size: 13px;
        }

    </style>
</head>

<body>

<div class="bg-layer" id="bg"></div>

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

    <h1>Welcome to the Adventure!</h1>

    <form action="${pageContext.request.contextPath}/start" method="post">
        <input type="text" name="playerName" placeholder="Enter your name" required>
        <br>
        <input type="submit" value="Start Game">
    </form>

    <div class="music-controls">
        <button class="music-btn start" onclick="startMusic()">Start Music</button>
        <button class="music-btn" onclick="stopMusic()">Stop Music</button>
    </div>

</div>

<audio id="bgMusic" loop preload="auto">
    <source src="${pageContext.request.contextPath}/audio/Dark_Fantasy.mp3" type="audio/mpeg">
</audio>

<script>

    const music = document.getElementById("bgMusic");

    function startMusic() {
        music.volume = 0.6;

        const savedTime = localStorage.getItem("musicTime");
        if (savedTime) music.currentTime = parseFloat(savedTime);

        music.play().then(() => {
            localStorage.setItem("music", "on");
        });
    }

    function stopMusic() {
        music.pause();
        localStorage.setItem("music", "off");
    }

    window.addEventListener("load", () => {
        setTimeout(() => document.body.classList.add("show"), 30);

        if (localStorage.getItem("music") === "on") {
            startMusic();
        }
    });

    setInterval(() => {
        if (!music.paused) {
            localStorage.setItem("musicTime", music.currentTime);
        }
    }, 500);

    const bg = document.getElementById("bg");

    document.addEventListener("mousemove", (e) => {
        const x = (e.clientX / window.innerWidth - 0.5) * 12;
        const y = (e.clientY / window.innerHeight - 0.5) * 8;
        bg.style.transform = `translate(${x}px, ${y}px) scale(1.08)`;
    });

</script>

</body>
</html>