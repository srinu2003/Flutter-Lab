# Experiment 8 - Part A: **Add animations to UI elements using Flutter's animation framework**

## Aim
To add animations to UI elements using Flutter's animation framework.
## Objective
To understand how to add animations to UI elements using Flutter's animation framework.

## System Requirements
- **Flutter SDK**: version 2.0.0 or higher
- **Dart SDK**: version 2.12.0 or higher
- **IDE**: Visual Studio Code (latest version) or android studio (latest version)
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

    void main() => runApp(const MainApp());

    class MainApp extends StatefulWidget {
      const MainApp({super.key});

      @override
      State<MainApp> createState() => _MainAppState();
    }

    class _MainAppState extends State<MainApp> {
      bool _isBig = false;

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Beginner Animation'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Tap the box to animate',
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isBig = !_isBig;
                      });
                    },
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _isBig ? Colors.deepPurpleAccent : Colors.blueAccent,
                      ),
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOutBack,
                      width: _isBig ? 250 : 100,
                      height: _isBig ? 500 : 100,
                      alignment: Alignment.center,
                      child: const Text(
                        'Box',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
![exp_8_a_output]()

### Just for fun
- Try changing the duration of the animation and see how it affects the animation.
- Try changing the curve of the animation and see how it affects the animation.
- Try changing the width and height of the box and see how it affects the animation.

## Summary of Flutter Animation Classification
Flutter provides three types of animations:
- **Implicit animations**: These animations are built into the widgets and are triggered by changing the widget's properties.
- **Explicit animations**: These animations are controlled by an AnimationController and are used to animate properties that are not built into the widgets.
- **Custom animations**: These animations are created using the Animation class and are used to create complex animations that are not possible with the built-in animations.

The below is a rought classification of Flutter animations:
![Flutter Animation Classification](<Flutter Animations.jpg>)

### Choosing the Right Animation
- **Implicit**: Best for simple transitions where you want to animate from one state to another without manual control.
- **Explicit**: Suitable for complex animations that require precise control, synchronization, or custom behavior.

### Extra Practice
Try fading animation for Text widget.

<details>
  <summary>Solution</summary>

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
      home: Scaffold(
        body: Center(
          child: AnimatedText(),
        ),
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: const Text(
        'I disapper and reappear!',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
```
</details>

## Conclusion
In this experiment, we learned how to add animations to UI elements using Flutter's animation framework. We also learned how to change the duration and curve of the animation to create different effects.

## References
- [Flutter - Animation](https://flutter.dev/docs/development/ui/animations)
- [Flutter - Animations](https://docs.flutter.dev/ui/animations)
- [Flutter - AnimatedContainer](https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html)
- [Flutter - Animation Guide](https://medium.com/flutter-community/flutter-animations-comprehensive-guide-cb93b246ca5d)
- [Material Animation](https://m3.material.io/styles/motion/overview)
- [Flutter by Rivaan Ranawat](https://youtu.be/pv4NhV86ZKg?si=8evWu0kzmpfPoyJk)