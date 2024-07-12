# Dart Basics

Here is a basic dart program that covers some basic concepts like variables, functions, conditionals, loops, and classes:

```dart
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
```

### Explanation:

1. **Main Function**:
   - Entry point of the Dart program.

2. **Variables**:
   - `var name = 'Srinivas';`: String variable for the name.
   - `int age = 20;`: Integer variable for age.
   - `double height = 5.9;`: Double variable for height.
   - `bool isAdult = age > 18 ? true : false;`: Boolean variable using a ternary operator to check if age is greater than 18.

3. **Print Statements**:
   - `print('Name: $name');`: Prints the name.
   - `print('Age: $age');`: Prints the age.
   - `print('Height: $height');`: Prints the height.

4. **Conditional Statement**:
   - Checks if `isAdult` is true.
   - If true, prints that the person is an adult.
   - Otherwise, prints that the person is not an adult.

5. **Function Call**:
   - Calls the `greet` function with `name` as the argument.

6. **Loop**:
   - `for (int i = 1; i <= 5; i++)`: Loop from 1 to 5.
   - `print('Loop iteration $i');`: Prints the current iteration.
   - `if (i == 3) break;`: Breaks the loop if `i` equals 3.

7. **Friends Array**:
   - `List<String> friends = ['Bhanu', 'Amar', 'Amulya', 'Kiran', 'Sandeep'];`: List of friends' names.

8. **Looping Through the Friends Array**:
   - `for (String friend in friends)`: Iterates over each friend in the array.
   - `print('Hello, $friend!');`: Prints a greeting for each friend.

9. **Object Creation**:
   - Creates an object `person` of the `Person` class.
   - Calls the `introduce` method of the `Person` class.

10. **Exception Handling**:
    - `try`: Code that may throw an exception.
    - `int result = 10 ~/ 0;`: Floor division by zero (will throw an exception).
    - `catch (e)`: Catches the exception and prints an error message.

11. **Function Definition**:
    - `void greet(String name)`: Function that takes a string parameter.
    - Prints a welcome message with the provided name.

12. **Class Definition**:
    - `class Person`: Defines a `Person` class.
    - **Properties**: `name`, `age`, `height`, and `isAdult`.
    - **Constructor**: Initializes the properties and sets `isAdult` based on the age.
    - **Method**: `introduce`: Prints the person's details.

This program provides a basic introduction to Dart's syntax and some fundamental programming concepts. You can run this code in any Dart environment, such as the DartPad online editor (https://dartpad.dev/).

After understanding these basic concepts, you can explore more advanced topics in Dart on Dart's official website (https://dart.dev/language).