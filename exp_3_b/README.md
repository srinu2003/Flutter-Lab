# Experiment 3 - Part B:  **MediaQuery for responsive layout**
## Aim

The aim of this experiment is to implement media queries and breakpoints in a Flutter project to achieve responsiveness.

## Objective

The objective of this experiment is to understand how to use media queries and breakpoints to create a responsive layout in Flutter.

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
      runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
      const MyApp({super.key});

      @override
      Widget build(BuildContext context) {
        return const MaterialApp(
          home: ResponsiveHomePage(),
        );
      }
    }

    class ResponsiveHomePage extends StatelessWidget {
      const ResponsiveHomePage({super.key});

      static const colorCodes = (
        body: Color(0xFFF8E287), // Sweet Corn approx.
        navigation: Color(0XFFC5ECCE), // Padua approx.
        pane: Color(0XFFEEE2BC), // Chamois approx
      );
      static const _style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
      static const body = Center(child: Text('Body', style: _style));
      static const navigation = Center(child: Text('Navigation', style: _style));
      static const panes = Center(child: Text('Pane', style: _style));

      @override
      Widget build(BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: AppBar(
            title: () {
              // immediately-invoked function expression (IIFE)
              if (screenWidth < 600) {
                return const Text('Responsive UI - Phone');
              } else if (screenWidth < 840) {
                return const Text('Responsive UI - Tablet');
              } else if (screenWidth < 1200) {
                return const Text('Responsive UI - Landscape');
              } else {
                return const Text('Responsive UI - Large Desktop');
              }
            }(),
          ),
          body: () {
            // immediately-invoked function expression (IIFE)
            if (screenWidth < 600) {    <-- breakpoint
              return buildCompactScreen();
            } else if (screenWidth < 840) { <-- breakpoint
              return buildMediumScreen();
            } else if (screenWidth < 1200) { <-- breakpoint
              return buildExpandedScreen();
            } else {                        <-- breakpoint
              return buildLargeScreen();
            }
          }(),
        );
      }

      Widget buildCompactScreen() {
        return Column(
          children: [
            Expanded(
              child: Container(color: colorCodes.body, child: body),
            ),
            Container(height: 80, color: colorCodes.navigation, child: navigation),
          ],
        );
      }

      Widget buildMediumScreen() {
        return Row(
          children: [
            Container(width: 80, color: colorCodes.navigation),
            Expanded(
              child: Container(color: colorCodes.body, child: body),
            ),
          ],
        );
      }

      Widget buildExpandedScreen() {
        return Row(
          children: [
            Container(width: 80, color: colorCodes.navigation),
            Container(width: 360, color: colorCodes.body, child: body),
            Expanded(
              child: Container(color: colorCodes.pane, child: panes),
            ),
          ],
        );
      }

      Widget buildLargeScreen() {
        return Row(
          children: [
            Container(color: colorCodes.navigation, width: 360, child: navigation),
            Container(width: 360, color: colorCodes.body, child: body),
            Expanded(
              child: Container(color: colorCodes.pane, child: panes),
            ),
          ],
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
<video controls src="exp_3_b_output.mp4" title="exp_3_b_output"></video>


https://github.com/user-attachments/assets/f7dd73cd-c5cf-4571-b00d-86541c41dbaf



## Conclusion

In this experiment, we learned how to implement media queries and breakpoints in a Flutter project to achieve responsiveness. By using different screen widths, we were able to create a layout that adapts to different devices. This allows our app to provide a consistent user experience across various screen sizes.

### Practice
[Building an animated responsive app layout with Material 3](https://codelabs.developers.google.com/codelabs/flutter-animated-responsive-layout)

### Key Takeaways
- Media queries can be used to determine the screen size and adjust the layout accordingly.
- Breakpoints can be defined to switch between different layouts based on the screen width.
- Responsive design is essential for creating apps that work well on different devices.

## References
- [Flutter Layout](https://docs.flutter.dev/ui/layout)
- [Flutter Layout Cheat Sheet](https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e)
- [Responsive UI in Flutter](https://flutter.dev/docs/development/ui/layout/responsive)
- [MediaQuery Class](https://api.flutter.dev/flutter/widgets/MediaQuery-class.html)
- [Material Design - Layout](https://m3.material.io/foundations/layout/understanding-layout/parts-of-layout)
- [Material Design - Applying Layout](https://m3.material.io/foundations/layout/applying-layout/window-size-classes)
- [Responsive design techniques (Microsoft)](https://docs.microsoft.com/en-us/windows/uwp/design/layout/responsive-design)
