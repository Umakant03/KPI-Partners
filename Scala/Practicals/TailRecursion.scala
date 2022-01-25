package example

import scala.annotation.tailrec

object TailRecursion {

  def factorial(n: Int): Int =
  {
    // Using tail recursion
    @tailrec def factorialAcc(acc: Int, n: Int): Int =
    {
      if (n <= 1)
        acc
      else
        factorialAcc(n * acc, n - 1)
    }
    factorialAcc(1, n)
  }

  // Main method
  def main(args:Array[String])
  {
    println(factorial(5))
  }

}
