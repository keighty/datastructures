package com.kapps.palindrome;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class PalindromeTest {
  Palindrome pal;
  
  @Before
  public void setUp() throws Exception {
    pal = new Palindrome();
  }

  @Test
  public void testIsPalindromeReturnsTrue() {
    assertEquals(pal.isPalindrome("abba"), true);
  }
  
  @Test
  public void testIsPalindromeReturnsFalse() {
    assertEquals(pal.isPalindrome("moon"), false);
  }
}
