package com.javarush.textadventure.service;

import java.util.HashMap;
import java.util.Map;

public class GameService {
    private String playerName;
    private int currentQuestionIndex;

    private final Map<Integer, String> questions = new HashMap<>();

    public GameService() {
        questions.put(1, "Welcome to the adventure! First question: Do you go left or right?");
        questions.put(2, "Second question: Do you go left or right?");
        questions.put(3, "Third question: Open the door or run away?");
    }

    public void startGame(String playerName) {
        this.playerName = playerName;
        this.currentQuestionIndex = 1;
    }

    public String getCurrentQuestion() {
        return questions.get(this.currentQuestionIndex);
    }

    public void answerQuestion(String answer) {
        currentQuestionIndex++;
    }

    public boolean isGameFinished() {
        return currentQuestionIndex > questions.size();
    }

    public String getPlayerName() {
        return playerName;
    }
}
