package com.kapps.fizzbuzz;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class FizzBuzzTest {
  FizzBuzz fb;
  
  @Before
  public void setUp(){
    fb  = new FizzBuzz();
  }

  @Test
  public void testCheckModReturnsFizz() {
    assertEquals(fb.checkMod(3), "fizz");
  }

  @Test
  public void testCheckModReturnsBuzz() {
    assertEquals(fb.checkMod(5), "buzz");
  }
  
  @Test
  public void testCheckModReturnsFizzBuzz() {
    assertEquals(fb.checkMod(15), "fizzbuzz");
  }
  
  @Test
  public void testCheckModReturnsNumber() {
    assertEquals(fb.checkMod(2), "2");
  }
  
  @Test
  public void testCheckModRunsThrough50() {
    for(int i = 1; i <= 50; i++){
      System.out.println(fb.checkMod(i));
    }
  }
}
