package com.kapps.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
  private static ServerSocket serverSocket;
  private static Socket clientSocket;
  private static BufferedReader bReader;
  private static String inputLine;

  public static void main(String[] args) {

    try {
      serverSocket = new ServerSocket(63400);
      clientSocket = serverSocket.accept();

      bReader = new BufferedReader(new InputStreamReader(
          clientSocket.getInputStream()));

      while ((inputLine = bReader.readLine()) != null) {
        System.out.println(inputLine);
      }
    } catch (IOException e) {
      System.out.println(e);
    }
  }

}
