# Experiment 2 - Part A: **Exploring Flutter Widgets**

## Aim
To explore various Flutter widgets such as `Text`, `Image`, and `Container`.

## Objective
In this lab experiment, we will explore various Flutter widgets such as `Text`, `Image`, and `Container`. Follow the steps below to set up a basic Flutter application and customize it according to your needs.

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
    void main() {
    runApp(const MainApp()); // Run the MainApp widget as the root of the application
    }

    class MainApp extends StatelessWidget {
    const MainApp({super.key}); // Constructor for the MainApp widget

    @override
    Widget build(BuildContext context) {
        return MaterialApp( // Create a MaterialApp widget
        home: Scaffold(
            body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
                children: [
                const Text( // Display a text widget with the given text
                    'Welcome to Flutter!',
                    style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 16),
                Image.asset( // Display an image from the assets folder
                    'assets/images/flutter_logo.png',
                    width: 200, // Set the width, height of the image
                    height: 200,
                ),
                const SizedBox(height: 16),
                Container( // Create a container widget
                    width: 200,
                    height: 50,
                    color: Colors.blue, // Set the background color of the container
                    child: const Center(
                    child: Text( // Display a text widget
                        'Start',
                        style: TextStyle(color: Colors.white), // Set the text color
                    ),
                    ),
                ),
                ],
            ),
            ),
        ),
        );
    }
    }
    ```
5. Get the image `flutter_logo.png` from [wikipedia](https://en.wikipedia.org/wiki/File:Google-flutter-logo.png) and save it in the `assets/images/` directory of your Flutter project or replace the image path `'assets/images/flutter_logo.png'` with the actual path to your image file and then save the file.

6. Open the `pubspec.yaml` file in your Flutter project and add the following lines after `flutter:` to include the image asset in your project:

    ```yaml
    flutter:
      uses-material-design: true
      assets: <-- Add this line
        - assets/images/flutter_logo.png <-- Add this line
    ```
    Save the file.

7. Run your Flutter project using the following command:
    ```cmd
    flutter run
    ```
    Select the appropriate device to run the app.

8.  - Enter `r` to hot reload the app and see the changes you made to the code.
    - Enter `q` to quit the app.

## Output
![exp_2_a_output](image.png)

## Conclusion
You have successfully set up a basic Flutter application and explored various Flutter widgets. Feel free to customize the code further and experiment with different widgets to create your desired UI. 

Remember to refer to the official Flutter documentation for more information on available widgets and their usage.

For additional practice, you can watch this [Positioned class](https://youtu.be/EgtPleVwxBQ) on Flutter development.