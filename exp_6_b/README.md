# Experiment 6 - Part B:  **Themes and Custom Styles**

## Aim
To understand how to apply themes and custom styles to a Flutter app.

## Objective
In this experiment, you will learn how to:
- Create a Flutter app with a custom theme.
- Apply custom styles to the app.

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
    import 'package:flutter/material.dart';

    void main() => runApp(const MainApp());

    class MainApp extends StatefulWidget {
      const MainApp({super.key});

      @override
      State<MainApp> createState() => _MainAppState();
    }

    class _MainAppState extends State<MainApp> {
      bool isDarkTheme = false;

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          theme: isDarkTheme
              ? ThemeData.dark()
              : ThemeData.light().copyWith(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent)),
          home: Builder(builder: (BuildContext context) {
            return Scaffold(
              appBar:
                  AppBar(title: Text(isDarkTheme ? 'Dark Theme' : 'Light Theme')),
              body: Column(
                // mainAxisAlignment: MainAxisAlignment.center, <-- Uncomment to center the widgets
                children: <Widget>[
                  OutlinedButton.icon(
                      onPressed: () {},
                      label: const Text('Button'),
                      icon: isDarkTheme
                          ? const Icon(Icons.dark_mode_rounded)
                          : const Icon(Icons.light_mode_rounded)),
                  const SizedBox(height: 20),
                  SwitchListTile(
                      title: const Text('Dark Theme'),
                      value: isDarkTheme,
                      onChanged: (value) {
                        setState(() {
                          isDarkTheme = value;
                        });
                      }),
                ]
              ),
            );
          }),
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
> `Theme.of()` is a static method that returns the current theme of the app.
> <details><summary>API reference</summary>
> 
> The data from the closest [Theme] instance that encloses the given
> context.
> 
> If the given context is enclosed in a [Localizations] widget providing
> [MaterialLocalizations], the returned data is localized according to the
> nearest available [MaterialLocalizations].
> 
> Defaults to [ThemeData.fallback] if there is no [Theme] in the given
> build context.
> 
> Typical usage is as follows:
> 
> ```dart
> @override
> Widget build(BuildContext context) {
> return Text(
>     'Example',
>     style: Theme.of(context).textTheme.titleLarge,
> );
> }
> ```
> 
> When the [Theme] is actually created in the same `build` function
> (possibly indirectly, e.g. as part of a [MaterialApp]), the `context`
> argument to the `build` function can't be used to find the [Theme] (since
> it's "above" the widget being returned). In such cases, the following
> technique with a [Builder] can be used to provide a new scope with a
> [BuildContext] that is "under" the [Theme]:
> 
> ```dart
> @override
> Widget build(BuildContext context) {
> return MaterialApp(
>     theme: ThemeData.light(),
>     home: Builder(
>     // Create an inner BuildContext so that we can refer to
>     // the Theme with Theme.of().
>     builder: (BuildContext context) {
>         return Center(
>         child: Text(
>             'Example',
>             style: Theme.of(context).textTheme.titleLarge,
>         ),
>         );
>     },
>     ),
> );
> }
> ```
> </details>

## Output
<video controls src="exp_6_b_output.mp4" title="Windows App"></video>
<video controls src="exp_6_b_output_2.mp4" title="Android"></video>


## Conclusion
In this experiment, you learned how to create a Flutter app with a custom theme and apply custom styles to the app.

## References
- [ThemeData class](https://api.flutter.dev/flutter/material/ThemeData-class.html)
- [TextTheme class](https://api.flutter.dev/flutter/material/TextTheme-class.html)
- [TextStyle class](https://api.flutter.dev/flutter/painting/TextStyle-class.html)
- [OutlinedButton class](https://api.flutter.dev/flutter/material/OutlinedButton-class.html)
- [SwitchListTile class](https://api.flutter.dev/flutter/material/SwitchListTile-class.html)
- [ColorScheme class](https://api.flutter.dev/flutter/material/ColorScheme-class.html)
- [Flutter Layout](https://docs.flutter.dev/ui/layout)
- [Material Components](https://m3.material.io/components)