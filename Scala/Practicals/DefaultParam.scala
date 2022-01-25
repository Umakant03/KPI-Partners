package example

object DefaultParam {

  def main(args: Array[String]) {
    println( "Returned Value : " + addInt(3) );
  }

  def addInt( a:Int , b:Int = 7 ) : Int = {
    var sum:Int = 0
    sum = a + b

    return sum
  }

}
