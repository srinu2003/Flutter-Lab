# STATEFUL and STATELESS widgets in Flutter

## Stateless Widgets

Stateless widgets are immutable, meaning their properties can't change once they're built. They are typically used for widgets that don't require any mutable state (i.e., they don't change over time or in response to user interactions). Examples of stateless widgets include `Text`, `Icon`, and `Container`.

### **Key Points:**
- Immutable
- Used for static content
- Lightweight and simple to use

### **Example:**
```dart
import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateless Widget')),
      body: Center(
        child: Text('Hello, I am a stateless widget!'),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: MyStatelessWidget()));
```

## Stateful Widgets

Stateful widgets are dynamic and can change their state during their lifetime. They are used when the widget needs to update based on user interactions or other factors. Examples of stateful widgets include `Checkbox`, `Radio`, `Slider`, and `TextField`.

Stateful widgets consist of two classes:
1. A `StatefulWidget` class that is immutable and can be used to create an instance of the widget.
2. A `State` class that contains the mutable state for that widget.

### **Key Points:**
- Mutable state
- Used for dynamic content
- More complex than stateless widgets

### **Example:**
```dart
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headline4),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: MyStatefulWidget()));
```

## Key Differences:
- **State Management:** Stateless widgets do not manage any state, while stateful widgets have an internal state that can change over time.
- **Lifecycle:** Stateful widgets have a more complex lifecycle with additional methods such as `initState()`, `setState()`, and `dispose()`, whereas stateless widgets only have the `build()` method.

## Use Cases:
- **Stateless Widgets:** Use these for UI elements that do not change, such as static text, icons, and layout containers.
- **Stateful Widgets:** Use these for UI elements that need to change dynamically based on user input or other factors, such as forms, sliders, and interactive elements.

For more detailed information, you can refer to the 
"Beginning Flutter A Hands-on Guide to App Development" by Marco L Napoli
, which provides in-depth examples and explanations.
<!-- ["Beginning Flutter A Hands-on Guide to App Development" by Marco L Napoli](https://digilib.stekom.ac.id/assets/dokumen/ebook/feb_3872ce7467cbdc7beedfcdc12b2b607b0ba36429_1649057575.pdf#page=36) -->