package example

object Recursion {

  def rec(x:Int, y:Int): Int=
  {
    if (y == 0) x
    else rec(y, x % y)
  }

  // Main method
  def main(args:Array[String])
  {
    println(rec(12, 18))
  }

}
