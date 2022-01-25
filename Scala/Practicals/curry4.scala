package example

object curry4 {

  // Curring function declaration
  def add2(a: Int) (b: Int) = a + b;

  def main(args: Array[String])
  {
    // Partially Applied function.
    val sum=add2(2)_;
    println("partial")
    println(sum(5));
  }

}
