void main() {
  // Variables
  var name = 'Srinivas';
  int age = 20;
  double height = 5.9;
  bool isAdult = age > 18 ? true : false;

  // Print statements
  print('Name: $name');
  print('Age: $age');
  print('Height: $height');

  // Conditional statement
  if (isAdult) {
    print('$name is an adult.');
  } else {
    print('$name is not an adult.');
  }

  // Function call
  greet(name);

  // Loop
  for (int i = 1; i <= 5; i++) {
    print('Loop iteration $i');
    if (i == 3) {
      break;
    }
  }

  // Friends array
  List<String> friends = ['Bhanu', 'Amar', 'Amulya', 'Kiran', 'Sandeep'];

  // Looping through the friends array
  for (String friend in friends) {
    print('Hello, $friend!');
  }

  // Creating an object of the Person class
  Person person = Person(name, age, height);
  person.introduce();

  // Exception handling
  try {
    // Code that may throw an exception
    int result = 10 ~/ 0; // Floor division by zero
    print('Result: $result');
  } catch (e) {
    // Handling the exception
    print('An error occurred: $e');
  }
}

// Function definition
void greet(String name) {
  print('Welcome to SDC, $name!');
}

// Class definition
class Person {
  String name;
  int age;
  double height;
  bool isAdult;

  // Constructor
  Person(this.name, this.age, this.height) : isAdult = age > 18;

  // Method
  void introduce() {
    print(
        'My name is $name, I am $age years old and my height is $height feet.');
  }
}
