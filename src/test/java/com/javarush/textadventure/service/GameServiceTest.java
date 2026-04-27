package com.javarush.textadventure.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class GameServiceTest {

    private GameService game;

    @BeforeEach
    void setUp(){
        game = new GameService();
        game.startGame("TestPlayer");
    }

    @Test
    void startGame_shouldBeginAtFirstQuestion_whenNewGameIsStarted(){
        assertEquals("You stand before an ancient castle. " +
                "Do you enter through the main gate or search for another way in?<br>Options: *MAIN* / *SEARCH*",game.getCurrentQuestion());
    }

    @Test
    void answerQuestion_shouldMoveToNextQuestion_whenNewAnswerIsCorrect(){
        game.answerQuestion("SEARCH");
        assertEquals("Inside it is completely dark. " +
                "Do you light a torch or walk blindly?<br>Options: *TORCH* / *BLIND*",game.getCurrentQuestion());
    }

    @Test
    void answerQuestion_shouldEndGame_whenAnswerIsWrong(){
        game.answerQuestion("MAIN");
        assertTrue(game.isGameOver());
        assertEquals("You entered the main gate and got ambushed by guards!", game.getDeathMessage());
    }

    @Test
    void game_shouldFinishWithVictory_whenAllAnswersIsCorrect(){
        game.answerQuestion("search");
        game.answerQuestion("torch");
        game.answerQuestion("sword");
        game.answerQuestion("up");
        game.answerQuestion("book");
        game.answerQuestion("key");
        game.answerQuestion("use");
        game.answerQuestion("forward");
        game.answerQuestion("hide");
        game.answerQuestion("spell");
        game.answerQuestion("throne");

        assertTrue(game.isGameFinished());
        assertFalse(game.isGameOver());
    }

    @Test
    void game_shouldFinishWithVictory_alternativeAnswersIsCorrect(){
        game.answerQuestion("search");
        game.answerQuestion("torch");
        game.answerQuestion("sword");
        game.answerQuestion("up");
        game.answerQuestion("book");
        game.answerQuestion("key");
        game.answerQuestion("use");
        game.answerQuestion("forward");
        game.answerQuestion("hide");
        game.answerQuestion("key");
        game.answerQuestion("throne");

        assertTrue(game.isGameFinished());
        assertFalse(game.isGameOver());
    }

    @Test
    void answerQuestion_shouldBeCaseInsensitive_whenAnswerIsCorrectInDifferentCase(){
        game.answerQuestion("SeArCh");
        assertEquals("Inside it is completely dark. " +
                "Do you light a torch or walk blindly?<br>Options: *TORCH* / *BLIND*",game.getCurrentQuestion());
    }

    @Test
    void getPlayerName_shouldReturnCorrectPlayerName(){
        assertEquals("TestPlayer", game.getPlayerName());
    }

    @Test
    void isGameFinished_shouldReturnFalse_whenGameJustStarted(){
        assertFalse(game.isGameFinished());
    }
}