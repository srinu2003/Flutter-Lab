# Experiment 2 - Part A:  **Custom widgets for specific UI**

## Aim
Create custom widgets for specific UI elements.

## Objective
To understand how to create custom widgets for specific UI elements.


## Prerequisites
- Flutter SDK installed on your machine
- A code editor of your choice (e.g., Visual Studio Code)

## Procedure

1. Create a new Flutter project by running the following command in your terminal:
    ```cmd
    flutter create my_flutter_app
    ```
    The command creates a Flutter project directory called `my_flutter_app` that contains a simple demo app that uses [Material Components](https://m3.material.io/components).

2. Change to the Flutter project directory.
    ```cmd
    cd my_flutter_app
    ```
3. Open the `lib/main.dart` file in your Flutter project.

4. Replace the existing code with the following code snippet:
    ```dart
    import 'package:flutter/foundation.dart'; // Required for kDebugMode
    import 'package:flutter/material.dart';

    void main() {
      runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
      const MyApp({super.key});

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('Custom Button Widget')),
            body: Center(
              child: CustomButton(
                text: 'Click Me',
                icon: Icons.circle_outlined,
                color: Colors.lightBlue[600],
                onPressed: () {
                  if (kDebugMode) {
                    // Check if the app is running in debug mode
                    print('Button Pressed!');
                  }
                },
              ), // CustomButton
            ), // Center
          ), // Scaffold
        ); // MaterialApp
      }
    }

    // Custom Button Widget
    class CustomButton extends StatelessWidget {
      final String text;
      final IconData icon;
      final VoidCallback onPressed;
      final Color? color, textColor;

      const CustomButton(
          {super.key,
          required this.text,
          required this.icon,
          required this.onPressed,
          this.color = Colors.blueAccent,
          this.textColor = Colors.white});

      @override
      Widget build(BuildContext context) {
        return ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, color: textColor),
          label: Text(text, style: TextStyle(color: textColor)),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ), // RoundedRectangleBorder
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
        ); // ElevatedButton.icon
      }
    }
    ```

5. Save the file.

6. Run your Flutter project using the following command:
    ```cmd
    flutter run
    ```
    Select the appropriate device to run the app.

7. During the app execution, you can use the following commands:
    - Enter `r` to hot reload the app and see the changes you made to the code.
    - Enter `q` to quit the app.


## Output
![exp_6_a_output]()


## Conclusion
In this experiment, you learned how to create custom widgets for specific UI elements in Flutter.


## References
- [Flutter User Interface](https://flutter.dev/docs/development/ui)
- [ElevatedButton class](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)
- [Material Components](https://m3.material.io/components)
