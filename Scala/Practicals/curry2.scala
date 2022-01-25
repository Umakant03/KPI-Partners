package example

object curry2 {
  def main(args: Array[String])
  {

    // Creating a Partially applied
    // function
    def mul(x: Double, y: Double)
    : Double =
    {
      x * y
    }

    // applying currying approach
    val m = (mul _).curried

    // Displays division
    println(m(2)(3))
  }
}
