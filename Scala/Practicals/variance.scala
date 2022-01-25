package example

abstract class Student
{
  def name: String
}

// Creating a sub-class Girls
// of Student
case class Girls(name: String) extends Student

// Creating a sub-class Boys
// of Student
case class Boys(name: String) extends Student

// Creating an Object Covariance
// that inherits main method of
// App
object variance extends App {
  // Creating a method
  def Studentnames(students: List[Student]): Unit = {
    students.foreach { student =>

      // Displays students name
      println(student.name)
    }
  }

  // Assigning names
  val boys: List[Boys] = List(Boys("Kanchan"), Boys("Rahul"))
  val girls: List[Girls] = List(Girls("Nidhi"), Girls("Geeta"))

  // Accessing list of boys
  Studentnames(boys)

  // Accessing list of girls
  Studentnames(girls)


}