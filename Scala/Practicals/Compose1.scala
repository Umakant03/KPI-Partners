package example

object Compose1 {


  // Main method
  def main(args: Array[String])
  {
    println((add compose mul)(2))

    // adding more methods
    println((add compose mul compose sub)(2))
  }

  val add=(a: Int)=> {
    a + 1
  }

  val mul=(a: Int)=> {
    a * 2
  }

  val sub=(a: Int) =>{
    a - 1
  }

}
