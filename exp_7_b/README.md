# Experiment 7 - Part B:  **From VAlidation**
[![Try APK](https://img.shields.io/badge/Try%20APK-Download-blue)](#file:exp_7_b.apk)

## Aim
To design and implement a Flutter app that performs form validation and error handling.

## Objective
To understand the concept of form validation and error handling in Flutter.

## System Requirements
- **Flutter SDK**: version 2.0.0 or higher
- **Dart SDK**: version 2.12.0 or higher
- **IDE**: Visual Studio Code (latest version) or android studio (latest version)
- **Operating System**: Windows (7 or higher), macOS (10.12 or higher), or Linux (Ubuntu, Debian, Fedora, CentOS, or similar)

## Procedure

1. Create a new Flutter project by running the following command in your terminal:
    ```cmd
    flutter create exp_7_b
    ```
    The command creates a Flutter project directory called `exp_7_b` that contains a simple demo app that uses [Material Components](https://m3.material.io/components).

2. Change to the Flutter project directory.
    ```cmd
    cd exp_7_b
    ```
3. Open the `lib/main.dart` file in your Flutter project.

4. Replace the existing code with the following code snippet:
    ```dart
    import 'package:flutter/material.dart';

    void main() => runApp(const MainApp());

    class MainApp extends StatelessWidget {
      const MainApp({super.key});

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('Form Validation')),
            body: const SingleChildScrollView(
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
      final _formKey = GlobalKey<FormState>();
      final _nameController = TextEditingController(),
          _emailController = TextEditingController();

      @override
      Widget build(BuildContext context) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (!RegExp(r'^[a-zA-Z][a-zA-Z\s]*$').hasMatch(value)) {
                      return 'Name can only contain letters and spaces in between';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                            r'^[a-zA-Z0-9](?!.*\+\+)[a-zA-Z0-9._%+-]*[a-zA-Z0-9]@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data is valid')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
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
<video controls src="exp_7_b_output.mp4" title="Form Validation"></video>


https://github.com/user-attachments/assets/88920500-ded9-43f4-af9e-432a8c4eaf81



## Conclusion
In this experiment, we learned how to perform form validation and error handling in a Flutter app. We created a simple form that takes the user's name and email address as input and validates the input data. If the input data is valid, a success message is displayed; otherwise, an error message is displayed.


## References
- [Flutter - Form Validation](https://flutter.dev/docs/cookbook/forms/validation)
- [Flutter - SnackBar](https://api.flutter.dev/flutter/material/SnackBar-class.html)
- [Flutter - RegExp](https://api.flutter.dev/flutter/dart-core/RegExp-class.html)
- [Flutter - GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)
- [Flutter - ScaffoldMessenger](https://api.flutter.dev/flutter/material/ScaffoldMessenger-class.html)

