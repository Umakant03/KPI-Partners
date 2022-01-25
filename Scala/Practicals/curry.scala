package example

object curry {

    // Define currying function
    def add(x: Int, y: Int) = x + y;

    def main(args: Array[String])
    {
      println(add(20, 19));
    }

}
