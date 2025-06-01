# Experiment 4 - Part B:  **Named Routes**
[![Try APK](https://img.shields.io/badge/Try%20APK-Download-blue)](https://srinu2003.github.io/Flutter-Lab/build-output/exp_4_b.apk)

## Aim
Implement navigation with named routes in a Flutter app.

## Objective
To understand how to navigate between different screens in a Flutter app using named routes.
Understand deep linking in Flutter apps.

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
        return MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            '/second': (context) => const SecondScreen(),
          },
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
                Navigator.pushNamed(context, '/second');
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
> [!TIP]
> Observe the code differences between the previous experiment and this experiment. In this experiment, we used named routes to navigate between different screens in a Flutter app. Is is quite easy by remembering the code style tranfroming from the traditional way of navigating between screens in a Flutter app.
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/user-attachments/assets/d6fb504d-2951-4b01-9896-633265bd6854">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/user-attachments/assets/1368d761-5ecd-4065-8bce-bf43222e7c84">
  <img alt="Code transformation to routes methos" src="https://github.com/user-attachments/assets/1368d761-5ecd-4065-8bce-bf43222e7c84">
</picture>

## Output

<video controls src="exp_4_b_output.mp4" title="exp_4_b_output"></video>


https://github.com/user-attachments/assets/9ae5fed4-6dd8-4eb9-8567-4b7f6df0e3d2




## Conclusion

In this lab, we learned how to navigate between different screens in a Flutter app using named routes.

We created two screens, `HomeScreen` and `SecondScreen`, and used the `Navigator` class to navigate between them. We defined the routes for the screens in the `MaterialApp` widget using the `routes` property. We used the `Navigator.pushNamed` method to navigate to the `SecondScreen` and the `Navigator.pop` method to go back to the previous screen.

By following this lab, you should now have a good understanding of how to implement navigation with named routes in a Flutter app.

## References
- [Navigation and routing](https://docs.flutter.dev/ui/navigation)
- [Deep linking in Flutter](https://docs.flutter.dev/ui/navigation/deep-linking)
- [Understanding navigation](https://m2.material.io/design/navigation/understanding-navigation.html) 
- [Learning Flutter's new navigation and routing system](https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade)
