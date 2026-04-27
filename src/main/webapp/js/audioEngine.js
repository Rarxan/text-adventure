const AudioEngine = (() => {

    const audio = new Audio();
    audio.src = window.APP_AUDIO_PATH || "/audio/Dark_Fantasy.mp3";
    audio.loop = true;
    audio.preload = "auto";
    audio.volume = 0;

    let targetVolume = 0.6;
    let fading = false;

    function init() {
        const isOn = sessionStorage.getItem("musicOn");

        if (isOn === "true") {
            const savedTime = parseFloat(sessionStorage.getItem("musicTime") || "0");

            audio.currentTime = savedTime;

            audio.play().then(() => {
                fadeIn();
            }).catch(() => {
                console.log("Audio blocked until user interaction");
            });
        }

        setInterval(() => {
            if (!audio.paused) {
                sessionStorage.setItem("musicTime", audio.currentTime);
            }
        }, 500);
    }

    function start() {
        sessionStorage.setItem("musicOn", "true");

        audio.play().then(() => {
            fadeIn();
        });
    }

    function fadeIn() {
        fading = true;
        audio.volume = 0;

        const step = 0.03;

        const t = setInterval(() => {
            if (audio.volume < targetVolume) {
                audio.volume = Math.min(targetVolume, audio.volume + step);
            } else {
                clearInterval(t);
                fading = false;
            }
        }, 30);
    }

    function fadeOut(callback) {
        fading = true;

        const step = 0.05;

        const t = setInterval(() => {
            if (audio.volume > 0) {
                audio.volume = Math.max(0, audio.volume - step);
            } else {
                clearInterval(t);
                fading = false;
                if (callback) callback();
            }
        }, 30);
    }

    function getAudio() {
        return audio;
    }

    return {
        init,
        start,
        fadeOut,
        fadeIn,
        getAudio
    };

})();