# Experiment 10 - Part B:  **Flutter's Debugging Tool**

## Aim
To explore and demonstrate the use of Flutter’s built-in debugging tools using Visual Studio Code.

## Objective
- To understand how Flutter debugging works.
- To utilize breakpoints, hot reload, and debug console.
- To observe variable state changes during app execution.
- To learn how to monitor app behavior in real-time.

## System Requirements
- **Flutter SDK**: version 2.0.0 or higher
- **Dart SDK**: version 2.12.0 or higher
- **IDE**: Visual Studio Code (latest version) or Android Studio (latest version)
- **Operating System**: Windows (7 or higher), macOS (10.12 or higher), or Linux (Ubuntu, Debian, Fedora, CentOS, or similar)

## Procedure
1. Open Visual Studio Code and create a new Flutter project.
2. In `main.dart` file replace `_counter++;` with `_counter--;`.
3. Place a **breakpoint** on the line where the counter is decremented.
4. Click the **Run and Debug** button or press `F5` to launch the app in debug mode.
5. Observe the output on the emulator or Windows desktop runner.
6. Click the floating action button to trigger the `_incrementCounter` function (which is actually decrementing).
7. The debugger halts at the breakpoint, allowing inspection of variable `_counter`.
8. Resume execution and observe the UI updates in real-time.
9. Modify the code and use **hot reload** to reflect changes without restarting the entire application.

## Output
We understand the feature of debugging in Flutter by hot reloading the application and observing the changes in the UI. 

<picture>
    <source media="(prefers-color-scheme: dark)" srcset="exp_10_b_output_dark.gif">
    <source media="(prefers-color-scheme: light)" srcset="exp_10_b_output_light.gif">
    <img alt="Flutter widget debugging in VS Code (light and dark themes)" src="exp_10_b_output_light.gif">
</picture>

## Conclusion
Using Flutter's debugging tools, we can pause execution, inspect variables, and track application flow. This significantly aids in diagnosing and fixing issues efficiently. The experiment demonstrates how breakpoints and hot reload can improve developer productivity in Flutter development.

## References
- [Flutter Documentation - Debugging](https://flutter.dev/docs/testing/debugging)
- [Visual Studio Code - Debugging Flutter Apps](https://docs.flutter.dev/development/tools/vs-code)
