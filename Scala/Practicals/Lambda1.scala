package example

// Lambda expression
object Lambda1 {
  def main(args: Array[String]) {
    val values = List(1, 2, 3, 4, 5)
    val square = values.map((x:Int) => x*x)
    println("The list is : " + values)
    printf("The square list is : ")
    println(square)
  }

}
