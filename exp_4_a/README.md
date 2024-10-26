# Experiment 4 - Part A:  **Navigating Screens**

## Aim
Set up navigation between different screens using Navigator

## Objective
To learn how to navigate between screens in a Flutter app using the Navigator class.

## System Requirements
- **Flutter SDK**: version 2.0.0 or higher
- **IDE**: Visual Studio Code (Supported) or android studio (Supported) or IntelliJ IDEA (Supported).
- **Operating System**: Windows (7 or higher), macOS (10.12 or higher), or Linux (Ubuntu, Debian, Fedora, CentOS, or similar)

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
    import 'package:flutter/material.dart';

    void main() {
      runApp(const MainApp());
    }

    class MainApp extends StatelessWidget {
      const MainApp({super.key});

      @override
      Widget build(BuildContext context) {
        return const MaterialApp(
          home: HomeScreen(),
        );
      }
    }

    class HomeScreen extends StatelessWidget {
      const HomeScreen({super.key});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Home')),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text('Go to Second Screen'),
            ),
          ),
        );
      }
    }

    class SecondScreen extends StatelessWidget {
      const SecondScreen({super.key});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Second Screen')),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ),
        );
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
<img height="800" alt="Home Page" src="https://github.com/user-attachments/assets/aec80f3b-f608-406b-a506-e28d3828d98f"><img height="800" alt="Second Screen" src="https://github.com/user-attachments/assets/0bd0735a-489d-405e-be1b-922529ab50a6">

<video controls src="exp_4_a_output.mp4" title="exp_4_a_output"></video>



https://github.com/user-attachments/assets/c1c12882-1d6c-4132-aeab-5d41f67fe20c




## Conclusion

In this lab, we learned how to set up navigation between different screens in a Flutter app using the Navigator class.

By following this lab, you should now have a good understanding of how to implement basic navigation in a Flutter app using the Navigator class and named routes.

## References
- [Flutter Navigator class](https://api.flutter.dev/flutter/widgets/Navigator-class.html)
- [Flutter ElevatedButton class](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)
- [MaterialPageRoute](https://api.flutter.dev/flutter/material/MaterialPageRoute-class.html)
