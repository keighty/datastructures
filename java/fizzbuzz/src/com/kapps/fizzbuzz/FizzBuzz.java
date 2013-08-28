package com.kapps.fizzbuzz;

public class FizzBuzz {

  public String checkMod(int number) {
    String message = "";

    if (number % 3 == 0)
      message += "fizz";

    if (number % 5 == 0)
      message += "buzz";

    if (message == "")
      message += number;

    return message;

  }

  public static void main(String[] args) {
    FizzBuzz fb = new FizzBuzz();
    System.out.println(fb.checkMod(3));
    System.out.println(fb.checkMod(5));
    System.out.println(fb.checkMod(15));
    System.out.println(fb.checkMod(2));
  }

}
