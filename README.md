# 🏰 Text Adventure Game

**Text Adventure** is an immersive **fantasy survival game** where every decision can lead you to **glory or death**.  
You’ll explore a mysterious medieval castle, face deadly traps, and make fateful choices on your path to the throne.  
Only the strongest will claim the crown… 👑

---

## ⚔️ Features

- **Full game logic** implemented in `GameService`
- **User input** handled via `StartServlet` and `QuestionServlet`
- **Logging system** integrated via `LoggerService` (`logs.txt`)
- **Two dynamic endings:** Victory 👑 or Game Over ☠️
- **Fully styled UI:** Welcome page, Question page, and Result page
- **Enhanced UX/UI** with:
  - Smooth animations and hover effects  
  - Shadowed parchment-style containers  
  - Text shadows for readability  
  - Atmospheric medieval backgrounds  
  - Polished visual consistency across all pages  

---

## 🚀 Launching the Project

### Requirements

- **Java:** OpenJDK 17  
- **Application Server:** Apache Tomcat 9.0.98

### Configuration

| Setting | Value |
|----------|--------|
| Application Server | Tomcat 9.0.98 |
| URL | `http://localhost:8080/welcome.jsp` |
| HTTP Port | `8080` |
| Artifact | `text-adventure:war exploded` |
| Application Context | `/` |

If the artifact doesn’t appear automatically, run:
```bash
mvn clean install

```

🎨 Screenshots  
🏁 Welcome Page  
⚔️ In-Game Choices  
👑 Result Page  

👨‍💻 Authors
Yuri (Rarxan) — Game logic, UI/UX design, animations, and logging system

## 🧠 Summary  
This project demonstrates a complete MVC-based Java web application built with Servlets and JSP, featuring:
Interactive story-driven gameplay
Smooth transitions and immersive visuals
Fully functional logic and state management
