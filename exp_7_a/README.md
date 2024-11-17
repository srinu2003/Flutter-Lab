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
<video controls src="exp_7_a_output.mp4" title="Form Application"></video>

https://github.com/user-attachments/assets/2caf9952-4666-41d7-8fee-d36101af34bc


### Extra Practice

1. Add a constraint validator to the `CustomTextField` widget to validate the user input. For example, validate the phone number field to accept only 10 digits.

2. Add a `TextEditingController` to each `CustomTextField` widget and print the user input to the console when the submit button is pressed and also clear the text fields after submission.

<details>
  <summary>Solution 1</summary>

```dart
import 'package:flutter/foundation.dart';
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
        body: const SingleChildScrollView(
          // SafeArea widget to avoid UI elements from being hidden by the device's notch, etc.
          child: RegisterForm(),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // About Controllers: https://api.flutter.dev/flutter/widgets/TextEditingController-class.html
  final _firstNameController       = TextEditingController();
  final _lastNameController        = TextEditingController();
  final _emailController           = TextEditingController();
  final _phoneController           = TextEditingController();
  final _usernameController        = TextEditingController();
  final _passwordController        = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (kDebugMode) {
      print('''
    Form Values:
    First Name: ${_firstNameController.text}
    Last Name: ${_lastNameController.text}
    Email: ${_emailController.text}@mlritm.ac.in
    Phone: +91 ${_phoneController.text}
    Username: ${_usernameController.text}
    Password: ${_passwordController.text}
    Confirm Password: ${_confirmPasswordController.text}
    ''');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset('images/3d_avatar_21.png', width: 100, height: 100),
        CustomTextField(controller: _firstNameController, label: 'First Name'),
        CustomTextField(controller: _lastNameController, label: 'Last Name'),
        CustomTextField(
            controller: _emailController,
            label: 'Email ID',
            suffixText: '@mlritm.ac.in'),
        CustomTextField(
          controller: _phoneController,
          prefixText: '+91 ',
          label: 'Mobile Number',
          keyboardType: TextInputType.phone,
          maxLength: 10,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9*]')),
            LengthLimitingTextInputFormatter(10)
          ],
        ),
        const Divider(indent: 8, endIndent: 8),
        CustomTextField(controller: _usernameController, label: 'Username'),
        CustomTextField(
            controller: _passwordController,
            label: 'Password',
            obscureText: true,
            passwordVisibilityToggle: false),
        CustomTextField(
            controller: _confirmPasswordController,
            label: 'Confirm Password',
            obscureText: true,
            passwordVisibilityToggle: true),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton.icon(
                onPressed: _handleSubmit,
                icon: const Icon(Icons.login),
                label: const Text('Register'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller; // Add controller
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? prefixText, suffixText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool passwordVisibilityToggle;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller, // Add controller
    this.keyboardType,
    this.suffixText,
    this.prefixText,
    this.maxLength,
    this.obscureText = false,
    this.passwordVisibilityToggle = false,
    this.inputFormatters,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        controller: widget.controller, // Add controller
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.label,
          suffixText: widget.suffixText,
          prefixText: widget.prefixText,
          suffixIcon: widget.obscureText && widget.passwordVisibilityToggle
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}

```
</details>
<details>
  <summary>Solution 2</summary>

```dart
import 'package:flutter/foundation.dart';
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
        body: const SafeArea(
          child: SingleChildScrollView(
            // SafeArea widget to avoid UI elements from being hidden by the device's notch, etc.
            child: RegisterForm(),
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  /* About TextEditingController:
   * https://api.flutter.dev/flutter/widgets/TextEditingController-class.html
   */
  final List<TextEditingController> controllers = List.generate(
    7,
    (_) => TextEditingController(),
  );

  TextEditingController get _firstNameController       => controllers[0];
  TextEditingController get _lastNameController        => controllers[1];
  TextEditingController get _emailController           => controllers[2];
  TextEditingController get _phoneController           => controllers[3];
  TextEditingController get _usernameController        => controllers[4];
  TextEditingController get _passwordController        => controllers[5];
  TextEditingController get _confirmPasswordController => controllers[6];

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleSubmit() {
    if (kDebugMode) {
      print('''

    First Name: ${_firstNameController.text}
    Last Name: ${_lastNameController.text}
    Email: ${_emailController.text}@mlritm.ac.in
    Phone: +91 ${_phoneController.text}
    Username: ${_usernameController.text}
    Password: ${_passwordController.text}
    Confirm Password: ${_confirmPasswordController.text}
    ''');
    }
  }

  void _handleClear() {
    for (var controller in controllers) {
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset('images/3d_avatar_21.png', width: 100, height: 100),
        CustomTextField(controller: _firstNameController, label: 'First Name'),
        CustomTextField(controller: _lastNameController, label: 'Last Name'),
        CustomTextField(
            controller: _emailController,
            label: 'Email ID',
            suffixText: '@mlritm.ac.in'),
        CustomTextField(
          controller: _phoneController,
          prefixText: '+91 ',
          label: 'Mobile Number',
          keyboardType: TextInputType.phone,
          maxLength: 10,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9*]')),
            LengthLimitingTextInputFormatter(10)
          ],
        ),
        const Divider(indent: 8, endIndent: 8),
        CustomTextField(controller: _usernameController, label: 'Username'),
        CustomTextField(
            controller: _passwordController,
            label: 'Password',
            obscureText: true,
            passwordVisibilityToggle: false),
        CustomTextField(
            controller: _confirmPasswordController,
            label: 'Confirm Password',
            obscureText: true,
            passwordVisibilityToggle: true),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                    onPressed: _handleClear, child: const Text('Clear')),
              ),
              FilledButton.icon(
                onPressed: _handleSubmit,
                icon: const Icon(Icons.login),
                label: const Text('Register'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller; // Add controller
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? prefixText, suffixText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool passwordVisibilityToggle;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller, // Add controller
    this.keyboardType,
    this.suffixText,
    this.prefixText,
    this.maxLength,
    this.obscureText = false,
    this.passwordVisibilityToggle = false,
    this.inputFormatters,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        controller: widget.controller, // Add controller
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.label,
          suffixText: widget.suffixText,
          prefixText: widget.prefixText,
          suffixIcon: widget.obscureText && widget.passwordVisibilityToggle
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}

```
</details>

> [!NOTE]
> The above exercises are optional and can be done as an extension to the current experiment.

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
- [Flutter - FilteringTextInputFormatter](https://api.flutter.dev/flutter/services/FilteringTextInputFormatter-class.html)
- [Flutter - TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)
