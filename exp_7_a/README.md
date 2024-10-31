# Experiment 7 - Part A:  **Form Application**

## Aim
To create a Flutter application that includes a form with various input fields and a submit button.

## Objective
To understand how to create and use custom text fields in a Flutter application and handle user input format.

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
    import 'package:flutter/services.dart';

    void main() => runApp(const MainApp());

    class MainApp extends StatelessWidget {
      const MainApp({super.key});

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('Form Application')),
            body: Column(
              children: <Widget>[
                Image.asset('images/3d_avatar_21.png', width: 100, height: 100),
                // Custom text fields for user input
                const CustomTextField(label: 'First Name'),
                const CustomTextField(label: 'Last Name'),
                const CustomTextField(label: 'Email', suffixText: '@mlritm.ac.in'),
                const CustomTextField(
                  prefixText: '+91 ',
                  label: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                ),
                const Divider(indent: 8, endIndent: 8), // Divider
                const CustomTextField(label: 'Username'),
                const CustomTextField(label: 'Password', obscureText: true),
                const CustomTextField(label: 'Confirm Password', obscureText: true),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        );
      }
    }

    // Custom text field widget
    class CustomTextField extends StatelessWidget {
      final String label;
      final TextInputType? keyboardType;
      final bool obscureText;
      final String? prefixText, suffixText;
      final int? maxLength;

      const CustomTextField({
        super.key,
        required this.label,
        this.keyboardType,
        this.suffixText,
        this.prefixText,
        this.maxLength,
        this.obscureText = false,
      });

      @override
      Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: TextFormField(
            keyboardType: keyboardType,
            obscureText: obscureText,
            inputFormatters: maxLength != null
                ? [LengthLimitingTextInputFormatter(maxLength)]
                : null,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: label,
              suffixText: suffixText,
              prefixText: prefixText,
            ),
          ),
        );
      }
    }
    ```
    Save the file.

5. Get the image `3d_avatar` from [3d_avatar_21.png](https://github.com/srinu2003/Flutter-Lab/blob/main/exp_7_a/images/3d_avatar_21.png) and save it as the `images/3d_avatar_21.png` in your Flutter project.

6. Open the `pubspec.yaml` file in your Flutter project and add the following lines after `flutter:` to include the image asset in your project:

    ```yaml
    flutter:
      # ...
      assets:
        - images/3d_avatar_21.png <-- Add this line
    ```
    Save the file.

7. Run your Flutter project using the following command:
    ```cmd
    flutter run
    ```
    Select the appropriate device to run the app.

8. During the app execution, you can use the following commands:
    - Enter `r` to hot reload the app and see the changes you made to the code.
    - Enter `q` to quit the app.

## Output
![exp_2_b_output](images/exp_2_b_output.png)

## Conclusion
By following the above steps, you have successfully created a Flutter application with a form that includes custom text fields and a submit button. This exercise helps in understanding the creation and usage of custom widgets in Flutter.

## References
- [Flutter - TextField class](https://api.flutter.dev/flutter/material/TextField-class.html)
- [Flutter - TextFormField](https://api.flutter.dev/flutter/material/TextFormField-class.html)
- [Flutter - InputDecoration](https://api.flutter.dev/flutter/material/InputDecoration-class.html)
- [Flutter - Form](https://flutter.dev/docs/cookbook/forms/validation)
- [Flutter - Image.asset](https://api.flutter.dev/flutter/widgets/Image/Image.asset.html)
- [Flutter - Image class](https://api.flutter.dev/flutter/widgets/Image-class.html)
- [Flutter - LengthLimitingTextInputFormatter](https://api.flutter.dev/flutter/services/LengthLimitingTextInputFormatter-class.html)
- [Flutter - FilteringTextInputFormatter](https://api.flutter.dev/flutter/services/FilteringTextInputFormatter-class.html)
- [Flutter - TextInputType](https://api.flutter.dev/flutter/services/TextInputType-class.html)
- [Flutter - Controller](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)