# exp_3_a.  Responsive UI
## Aim

To design a responsive UI that adapts to different screen sizes.

## Objective

The objective of this experiment is to create a Flutter project that demonstrates the concept of responsive UI design. The UI should adjust its layout and appearance based on the screen size of the device.

## Prerequisites
- Flutter SDK installed on your machine
- A code editor of your choice (e.g., Visual Studio Code)

## Procedure

1. Create a new Flutter project by running the following command in your terminal:
    ```
    flutter create my_flutter_app
    ```
    This command will create a Flutter project directory called `my_flutter_app` that contains a simple demo app using [Material Components](https://m3.material.io/components).

2. Change to the Flutter project directory:
    ```
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
        title: 'Responsive UI',
        home: ResponsiveHomePage(),
        );
    }
    }

    class ResponsiveHomePage extends StatelessWidget {
    const ResponsiveHomePage({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text('Responsive UI'),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth >= 600) {
                // For Wide Screen (Tablet/Desktop)
                return _buildWideContainers();
            } else {
                // For Narrow Screen (Phone)
                return _buildNarrowContainers();
            }
            },
        ),
        );
    }

    Widget _buildWideContainers() {
        return Container(
        color: Colors.blue,
        child: const Center(
            child: Text(
            'You are using a Wide screen!',
            style: TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
            ),
        ),
        );
    }

    Widget _buildNarrowContainers() {
        return Container(
        color: Colors.green,
        child: const Center(
            child: Text(
            'You are using a Narrow screen!',
            style: TextStyle(fontSize: 16, color: Colors.white),
            ),
        ),
        );
    }
    }
    ```

5. Save the file.

6. Run your Flutter project using the following command:
    ```
    flutter run
    ```

7. To hot reload the app and see the changes you made to the code, enter `r`. To quit the app, enter `q`.

## Expected Output

![exp_3_a_output](/exp_3_a/exp_3_a_output.mp4)

## Conclusion

In this experiment, we successfully designed a responsive UI that adapts to different screen sizes using Flutter. The UI layout and appearance adjust dynamically based on the screen size of the device, providing an optimal user experience.

## References

- [Adaptive and responsive design (Flutter)](https://docs.flutter.dev/ui/adaptive-responsive)
- [Responsive design techniques (Microsoft)](https://learn.microsoft.com/en-us/windows/apps/design/layout/responsive-design)
