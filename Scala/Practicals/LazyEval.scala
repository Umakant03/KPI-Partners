package example

object LazyEval {

  def main(args: Array[String]): Unit = {
    demo1
  }


  def demo1 = {

    val x = {println("x"); 1}
    lazy val y = {println("y"); 2}
    def z = {println("z"); 3}

    println(x + y + z);

  }


}
