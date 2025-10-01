package com.javarush.textadventure.service;

import java.util.HashMap;
import java.util.Map;


public class GameService {
    private String playerName;
    private int currentQuestionIndex;
    private boolean gameOver;
    private String deathMessage;
    private String resultBackground;
    private static final int DRAGON_BATTLE_QUESTION = 10;
    private static final String ANSWER_SPELL = "spell";
    private static final String ANSWER_KEY = "key";

    private final Map<Integer, String> questions = new HashMap<>();
    private final Map<Integer, String> correctAnswers = new HashMap<>();
    private final Map<Integer, String> deathMessages = new HashMap<>();
    private final Map<Integer, String> questionsBackgrounds = new HashMap<>();

    public GameService() {
        questions.put(1, "You stand before an ancient castle. " +
                "Do you enter through the main gate or search for another way in?<br>Options: *MAIN* / *SEARCH*");
        correctAnswers.put(1, "search");
        deathMessages.put(1, "You entered the main gate and got ambushed by guards!");

        questions.put(2, "Inside it is completely dark. Do you light a torch or walk blindly?" +
                "<br>Options: *TORCH* / *BLIND*");
        correctAnswers.put(2, "torch");
        deathMessages.put(2, "You did not light the torch and fell into a pit!");

        questions.put(3, "Stone knights stand in the corridor. Do you touch the sword of one knight or walk past?" +
                "<br>Options: *SWORD* / *WALK*");
        correctAnswers.put(3, "sword");
        deathMessages.put(3, "You ignored the sword and got trapped by the stone knights!");

        questions.put(4, "Two paths ahead: stairs leading up or stairs going down?" +
                "<br>Options: *UP* / *DOWN*");
        correctAnswers.put(4, "up");
        deathMessages.put(4, "You went down into a deadly trap in the dungeon!");

        questions.put(5, "You find an ancient library. Do you take the magic book or ignore it?" +
                "<br>Options: *BOOK* / *IGNORE*");
        correctAnswers.put(5, "book");
        deathMessages.put(5, "You ignored the magic book and faced the dragon unprepared!");

        questions.put(6, "You find a skeleton with a key. Do you take the key or leave it?" +
                "<br>Options: *KEY* / *LEAVE*");
        correctAnswers.put(6, "key");
        deathMessages.put(6, "You left the key behind and couldn't unlock the next door!");

        questions.put(7, "You reach a massive door with strange symbols. Do you use the item you found or try to break it?" +
                "<br>Options: *USE* / *BREAK*");
        correctAnswers.put(7, "use");
        deathMessages.put(7, "You tried to break the door and triggered a deadly trap!");

        questions.put(8, "A hall filled with gold and chests appears. Do you open a chest or continue forward?" +
                "<br>Options: *OPEN* / *FORWARD*");
        correctAnswers.put(8, "forward");
        deathMessages.put(8, "You opened a cursed chest and were consumed by dark magic!");

        questions.put(9, "The dragon awakens! Do you attack immediately or hide?<br>Options: *ATTACK* / *HIDE*");
        correctAnswers.put(9, "hide");
        deathMessages.put(9, "You attacked the dragon without preparation and got incinerated!");

        questions.put(10, "The dragon is vulnerable. Do you read the spell, use the key mechanism, or attack bare-handed?" +
                "<br>Options: *SPELL* / *KEY* / *ATTACK*");
        correctAnswers.put(10, "spell"); // also "key" valid
        deathMessages.put(10, "You attacked the dragon unprepared and died!");

        questions.put(11, "The dragon is defeated. Do you sit on the throne or leave the castle?" +
                "<br>Options: *THRONE* / *LEAVE*");
        correctAnswers.put(11, "throne");
        deathMessages.put(11, "You left the castle without claiming your victory!");

        questionsBackgrounds.put(0, "images/Welcome.jpg");
        questionsBackgrounds.put(1, "images/q1.jpg");
        questionsBackgrounds.put(2, "images/q2.jpg");
        questionsBackgrounds.put(3, "images/q3.jpg");
        questionsBackgrounds.put(4, "images/q4.jpg");
        questionsBackgrounds.put(5, "images/q5.jpg");
        questionsBackgrounds.put(6, "images/q6.jpg");
        questionsBackgrounds.put(7, "images/q7.jpg");
        questionsBackgrounds.put(8, "images/q8.jpg");
        questionsBackgrounds.put(9, "images/q9.jpg");
        questionsBackgrounds.put(10, "images/q10.jpg");
        questionsBackgrounds.put(11, "images/q11.jpg");
        questionsBackgrounds.put(12, "images/q12_King.jpg");
        questionsBackgrounds.put(13, "images/GameOver.jpg");

    }

    public void startGame(String playerName) {
        this.playerName = playerName;
        this.currentQuestionIndex = 1;
        this.gameOver = false;
        this.deathMessage = "";
        LoggerService.log(playerName, "START", "Game started");
    }

    public String getCurrentQuestion() {
        return questions.get(this.currentQuestionIndex);
    }

    public void answerQuestion(String answer) {
        //LoggerService.log(playerName, "Answer", "Question : " + currentQuestionIndex + ", answer : " + answer);

        if (currentQuestionIndex == DRAGON_BATTLE_QUESTION) {
            if (answer.equalsIgnoreCase(ANSWER_SPELL) || answer.equalsIgnoreCase(ANSWER_KEY)) {
                currentQuestionIndex++;
                return;
            } else {
                handleGameOver();
                return;
            }
        }

        String correct = correctAnswers.get(currentQuestionIndex);

        if (correct != null && correct.equalsIgnoreCase(answer.trim())) {
            currentQuestionIndex++;
        } else {
            handleGameOver();
            return;
        }

        LoggerService.log(playerName, "ANSWER", "Question " + currentQuestionIndex + ", answer : " + answer);
    }

    public boolean isGameFinished() {
        if (currentQuestionIndex > questions.size() && !gameOver) {
            LoggerService.log(playerName, "VICTORY", " The player become a new king");
        }
        return currentQuestionIndex > questions.size() || gameOver;
    }

    public boolean isGameOver() {
        return gameOver;
    }

    public String getPlayerName() {
        return playerName;
    }

    public String getDeathMessage() {
        return deathMessage;
    }

    public String getCurrentBackground() {
        if (gameOver) {
            return questionsBackgrounds.get(13);
        } else if (currentQuestionIndex == questionsBackgrounds.size()) {
            return questionsBackgrounds.get(12);
        } else if (currentQuestionIndex == 0) {
            return questionsBackgrounds.get(0);
        } else {
            return questionsBackgrounds.get(currentQuestionIndex);
        }
    }

    public String getResultBackground() {
        return resultBackground;
    }

    public void setResultBackground(String resultBackground) {
        this.resultBackground = resultBackground;
    }

    private void handleGameOver(){
        gameOver = true;
        deathMessage = deathMessages.get(currentQuestionIndex);
        LoggerService.log(playerName, "GAME_OVER", "Reason: " + deathMessage);
    }
}
