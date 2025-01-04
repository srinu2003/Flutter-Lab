# Experiment 9 - Part A: **Fetch Data from a REST API in Dart**

## Aim
To fetch data from a REST API in Dart.

## Objective
To understand how to fetch data from a REST API in Dart using the `http` package.


## System Requirements
- **Dart SDK**: version 2.12.0 or higher
- **IDE**: Visual Studio Code (latest version) or any text editor
- **Operating System**: Windows (7 or higher), macOS (10.12 or higher), or Linux (Ubuntu, Debian, Fedora, CentOS, or similar)

## Procedure

1. Create a new Dart console project by running the following command in your terminal:
    ```cmd
    dart create console_app
    ```
    The command creates a Dart project directory called `console_app` that contains a simple demo app in the `\bin` directory.

2. Change to the Dart project directory.
    ```cmd
    cd console_app
    ```

3. Add the `http` package to your project by adding the following dependency to the `pubspec.yaml` file:
    ```yaml
    dependencies:
      http: ^1.2.2
    ```
    Save the file.

4. Run the following command to get the dependencies:
    ```cmd
    dart pub get
    ```
    This command downloads the `http` package and adds it to your project.

5. Create a new Dart file called `git_hub_api.dart` in the `lib` directory of your project.

6. Add the following code to the `git_hub_api.dart` file:
    ```dart
    // Utilizing GitHub API service
    import 'package:http/http.dart' as http;
    import 'dart:convert';

    Future<List<dynamic>> fetchRepos(String username) async {
      final response = await http.get(Uri.parse('https://api.github.com/users/$username/repos'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load repos');
      }
    }

    ```

7. Open the `bin/console_app.dart` file in your Dart project.

8. Replace the existing code with the following code snippet:
    ```dart
    // Utilizing GitHub API service from console_app
    import 'package:console_app/git_hub_api.dart' as git_hub_api;
    import 'dart:io';

    void main(List<String> arguments) async {
      String? username = arguments.isNotEmpty ? arguments.first : null;

      if (username == null) {
        stdout.write('Enter GitHub username: ');
        username = stdin.readLineSync();
      }

      if (username != null && username.isNotEmpty) {
        try {
          print('Fetching repositories for user: $username');
          List<dynamic> repos = await git_hub_api.fetchRepos(username);
          // Sort by 'updated_at' in descending order
          repos.sort(
            (a, b) => DateTime.parse(b['updated_at']).compareTo(
              DateTime.parse(a['updated_at']),
            ),
          );
          print('First 5 recent repositories:');
          for (var repo in repos.take(5)) {
            print(repo['name']);
          }
        } catch (e) {
          print('Error: $e');
        }
      } else {
        print('Username cannot be empty');
      }
    }
    ```

9. Save the file.

10. Run your Dart project using the following command:
    ```cmd
    dart run
    ```

## Output
```cmd
C:\path\to\console_app> dart run             
Building package executable... 
Built exp_9_a:exp_9_a.
Enter GitHub username: srinu2003
Fetching repositories for user: srinu2003
First 5 recent repositories:
Flutter-Lab
217Y1A05C0-ML-Lab
LaTex-Resume
FSD-Lab
learning-dashboard
C:\path\to\console_app> 
```

### command line arguments
```cmd
C:\path\to\console_app> dart run .\bin\console_app.dart srinu2003
Fetching repositories for user: srinu2003
First 5 recent repositories:
Flutter-Lab
217Y1A05C0-ML-Lab
LaTex-Resume
FSD-Lab
learning-dashboard
C:\path\to\console_app> 
```


## Conclusion
We have successfully fetched data from a REST API in Dart using the `http` package.


## References
- [Dart HTTP package](https://pub.dev/packages/http)
- [GitHub REST API](https://docs.github.com/en/rest)