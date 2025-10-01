package com.javarush.textadventure.service;

import java.io.FileWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class LoggerService {

    private static final String LOG_FILE = "logs.txt";
    private static final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    public static void log(String player, String action, String message) {
        String time = dtf.format(LocalDateTime.now());
        String logEntry = String.format("[%s] Player : %s | Action : %s | %s%n", time, player, action, message);

        try (FileWriter writer = new FileWriter(LOG_FILE, true)) {
            writer.write(logEntry);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
