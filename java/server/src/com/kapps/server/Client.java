package com.kapps.server;

import java.io.PrintWriter;
import java.net.Socket;

public class Client {
  private static Socket socket;
  private static PrintWriter pWriter;

  public static void main(String[] args) {
    try {
      socket = new Socket("localhost", 63400);
      pWriter = new PrintWriter(socket.getOutputStream(), true);

      pWriter.println("Hello World!");
    } catch (Exception e) {
      System.out.println(e);
    }
  }

}
