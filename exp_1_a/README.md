# Experiment 1  - Part A: **Install Flutter and Dart SDK**

## Aim
To install Flutter and Dart SDK on your local machine.

## System Requirements

### Hardware Requirements
To install and run Flutter, your Windows environment must meet the following hardware requirements:

| Requirement                | Minimum       | Recommended    |
|----------------------------|---------------|----------------|
| x86_64 CPU Cores           | 4             | 8              |
| Memory in GB               | 8             | 16             |
| Display resolution in pixels| WXGA (1366 x 768) | FHD (1920 x 1080) |
| Free disk space in GB      | 11.0          | 60.0           |

### Software Requirements
To write and compile Flutter code for Android, you must have the following version of Windows and the listed software packages.

> **Tip:** You do not need to install Dart separately as the Flutter SDK includes the full Dart SDK.

#### Operating System
Flutter supports 64-bit version of Microsoft Windows 10 or later. These versions of Windows should include the required [Windows PowerShell](https://docs.microsoft.com/powershell/scripting/install/installing-windows-powershell) 5 or later.

#### Development Tools
Download and install the Windows version of the following packages:
- **[Git for Windows](https://gitforwindows.org/) 2.27 or later** to manage source code.
- **[Android Studio](https://developer.android.com/studio) 2023.3.1 (Jellyfish) or later** to debug and compile Java or Kotlin code for Android. Flutter requires the full version of Android Studio.

The developers of the preceding software provide support for those products. To troubleshoot installation issues, consult that product's documentation.

When you run the current version of `flutter doctor`, it might list a different version of one of these packages. If it does, install the version it recommends.

### Configure a Text Editor or IDE
You can build apps with Flutter using any text editor or integrated development environment (IDE) combined with Flutter's command-line tools.

Using an IDE with a Flutter extension or plugin provides code completion, syntax highlighting, widget editing assists, debugging, and other features.

Popular options include:
- **[Visual Studio Code](https://code.visualstudio.com/docs/setup/windows) 1.77 or later** with the [Flutter extension for VS Code](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter).
- **[Android Studio](https://developer.android.com/studio/install#windows) 2023.3.1 (Jellyfish) or later** with the [Flutter plugin for IntelliJ](https://plugins.jetbrains.com/plugin/9212-flutter).
- **[IntelliJ IDEA](https://www.jetbrains.com/help/idea/installation-guide.html) 2023.3 or later** with the [Flutter plugin for IntelliJ](https://plugins.jetbrains.com/plugin/9212-flutter).

> **Recommended:** The Flutter team recommends installing [Visual Studio Code](https://code.visualstudio.com/docs/setup/windows) 1.77 or later and the [Flutter extension for VS Code](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) This combination simplifies installing the Flutter SDK.

## Procedure

### Step 1: Download Flutter SDK
1. Visit the [Flutter official website](https://flutter.dev/docs/get-started/install).
2. Choose your operating system (Windows, macOS, Linux).
3. Download the Flutter SDK zip file.

### Step 2: Extract Flutter SDK
1. Extract the downloaded zip file to a desired location on your system.
2. Add the `flutter/bin` directory to your system's PATH environment variable.

### Step 3: Verify Installation
1. Open a command line interface.
2. Run the command:
    ```sh
    flutter doctor
    ```
3. Follow any additional setup instructions provided by `flutter doctor`.

### Step 4: Install Dart SDK
1. Dart SDK is bundled with Flutter, so no separate installation is required.
2. Verify Dart installation by running:
    ```sh
    dart --version
    ```

## Conclusion
You have successfully installed Flutter and Dart SDK on your machine. You are now ready to start developing Flutter applications.

## References
- [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)

## Questions
1. What is the purpose of the `flutter doctor` command?
2. How can you verify the installation of Dart SDK?
3. What are the system requirements for installing Flutter and Dart SDK?
4. Why is it important to add the `flutter/bin` directory to the system's PATH environment variable?
5. Can you install Dart SDK separately from Flutter? Explain.