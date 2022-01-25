package example

object callByName1 {

  def main(args: Array[String])
  {
    def something() =
    {
      println("calling something")
      1
    }

    // Defined function
    def callByName(x: => Int) =
    {
      println("x1=" + x)
      println("x2=" + x)
    }

    // Calling function
    callByName(something)
  }

}
