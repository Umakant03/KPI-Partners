package example

object FuncLiteral {
  def main(args: Array[String]) {

    List(1,2,3,4,5).filter((x: Int)=> {
println("x " + x);

      x > 3;})

  }
}
