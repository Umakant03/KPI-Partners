package example

object Implicit2 {

  def main(args: Array[String])
  {
    val message = "Hi "
    implicit val name = "Hello!"
    def disp(implicit nm : String) = message + nm

    // Implicit parameter will be passed here
    val result = disp

    // Implicit parameters will not be passed
    val result2 = disp("Team")
    println("With Implicit parameters:")
    println(result)
    println("Without Implicit parameters:")
    println(result2)
  }

}
