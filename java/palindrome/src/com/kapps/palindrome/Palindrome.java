/**
 * @author katherine
 * Palindrome checks to see if a string is equal to its reverse.
 */

package com.kapps.palindrome;


public class Palindrome {
  
  public static void main(String[] args) {
    Palindrome pal = new Palindrome();
    System.out.println(pal.isPalindrome("abba"));
  }
  
  public boolean isPalindrome(String phrase) {
    char[] chars = phrase.toCharArray();
    String reversed = "";
    for(int i = chars.length - 1; i >= 0; i--){
      reversed += chars[i];
    }
    return phrase.equals(reversed);
  }

}
