package example

trait MyTrait
{
  // Abstract method
  def greeting

  // Non-abstract method
  def program
  {
    println("This is about " +
      "Traits in Scala")
  }
}


// MyClass inherits trait
class MyClass extends MyTrait
{

  // Implementation of abstract method
  // No need to implement a non-abstract
  // method because it already implemented
  def greeting()
  {
    println("Welcome to GeeksfoGeeks")
  }
}


object Trait1 {

  def main(args: Array[String])
  {
    val obj = new MyClass();
    obj.greeting
    obj.program
  }


}
