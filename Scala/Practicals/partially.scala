package example

object partially {

  def main(args: Array[String])
  {

    def Mul(x: Double, y: Double, z: Double)
    : Double =
    {
      x * y * z
    }

    // applying some arguments
    val r = Mul(7, 8, _ : Double)

    println(r(10))

    // Displays Multiplication
//    println(r(10))
  }

}
