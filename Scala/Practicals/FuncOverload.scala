package example


class Overload
{

  // function 1 with two parameters
  def fun(p:Int, q:Int)
  {
    var Sum = p + q;
    println("Sum in function 1 is:" + Sum);
  }

  // function 2 with three parameters
  def fun(p:Int, q:Int, r:Int)
  {
    var Sum = p + q + r;
    println("Sum in function 2 is:" + Sum);
  }
}


object FuncOverload {

  def main(args: Array[String])
  {

    // Creating object of GFG class
    var obj = new Overload();
    obj.fun(1, 2);
    obj.fun(5, 10, 15);
  }
}
