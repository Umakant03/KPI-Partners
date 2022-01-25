package example

object callBy extends App {

  def check(i: => Int): Unit =
  {
    println("first " + i);
    println("Sec " + i);
    println("Third " + i);
    println("Forth " + i);


  }

  var amt = 0;
  check {amt +=1; amt}

}
