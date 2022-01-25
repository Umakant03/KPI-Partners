package example

object List1 {

  def main(args:Array[String])
  {
    // Creating and initializing immutable lists
    val mylist1: List[String] = List("AB", "CD",
      "EF", "XY")
    val mylist2 = List("C", "C#", "Java", "Scala")

    // Display the value of mylist1
    println("List 1:")
    println(mylist1)

    // Display the value of mylist2 using for loop
    println("\nList 2:")
    for(mylist<-mylist2)
    {
      println(mylist)
    }
  }

}
