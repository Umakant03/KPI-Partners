package example

object Closure1 {

  def main(args: Array[String])
  {

    var x = 50

    // define closure function
    val func = (name: String) => println(s"name is $name"+
      s" and total count $x")

    func("Training")
  }

}
