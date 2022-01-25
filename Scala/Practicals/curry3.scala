package example

object curry3 {


  // Curring function declaration
  def add2(a: Int) (b: Int) = a + b;

  def main(args: Array[String])
  {
    println(add2(2)(5));
  }
}
