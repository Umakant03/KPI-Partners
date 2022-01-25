package example

object PureF {

  def main(args: Array[String])
  {
    def square(a:Int) = {
      var b:Int = a * a;
      println("Square of the number is " + b);
      println("Number is " + a);
    }
    square(4);
  }

}
