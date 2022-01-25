package example

object curry1 {
  def sub(a: Int) = (b: Int) => a - b;

  // Main function
  def main(args: Array[String])
  {
    // Partially Applied function.
    val minus = sub(29);
    println(minus(5));
  }

}
