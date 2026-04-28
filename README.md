# 🏰 Text Adventure Game

**Text Adventure** is a cinematic browser-based fantasy game where every decision shapes your fate.
Explore a mysterious castle, face deadly choices, and carve your own path to victory… or ruin.

---

## 🎮 Live Demo

👉 https://text-adventure-r4rq.onrender.com/

---

## ⚔️ Features

### 🧠 Gameplay

* Branching story with meaningful player choices
* Multiple outcomes: **Victory 👑 / Game Over ☠️**
* Stateful game logic handled via `GameService`
* Input processing through Servlets (`StartServlet`, `QuestionServlet`)

### 🎬 Cinematic Experience

* Layered **video background system** (fire + smoke)
* Smooth **fade transitions** between scenes
* Animated **word-by-word text rendering**
* Dynamic **background switching per scene**
* Subtle **camera shake feedback** on actions

### 🎨 Visual Design

* Parchment-style UI with depth and texture
* Cinematic color grading (contrast, saturation, vignette)
* Breathing background animation for immersion
* Carefully tuned readability (text contrast & overlays)

### 🔊 Audio

* Atmospheric musical accompaniment
* Enhances immersion in the gameplay

### 📊 System & Logging

* Logging system via `LoggerService` (`logs.txt`)
* Tracks player progress and decisions

---

## ⚙️ Tech Stack

* **Java (Servlets, JSP)**
* **HTML5 / CSS3 (animations, filters, layering)**
* **Vanilla JavaScript**
* **Apache Tomcat**
* **Maven**

---

## 🚀 Running Locally

### Requirements

* Java 17 (OpenJDK)
* Apache Tomcat 9+

### Setup

```bash
mvn clean install
```

### Configuration

| Setting  | Value                             |
| -------- | --------------------------------- |
| URL      | http://localhost:8080/welcome.jsp |
| Port     | 8080                              |
| Artifact | text-adventure:war exploded       |
| Context  | /                                 |

---

## 🎨 Screenshots

* 🏁 Welcome Page
* ⚔️ Game Scene
* 👑 Result Screen

---

## 🎯 Project Goal

The goal of this project was to create an **immersive interactive experience in the browser without using game engines**, relying only on Java web technologies and frontend effects.

---

## 👨‍💻 Author

**Yuri (Rarxan)**
* Game logic, UI/UX, visual effects, and overall design

---

## 🧠 Summary

This project demonstrates a complete **MVC-based Java web application** enhanced with:

* Interactive storytelling
* Cinematic visual presentation
* Smooth UI/UX transitions
* Full backend logic and state management

---

🔥 *Not just a servlet project — a small cinematic game experience in the browser.*
