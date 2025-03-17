import 'package:flutter/material.dart';
import 'package:app_one/main.dart';
import 'package:app_two/main.dart';
import 'package:app_three/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Wrapper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WrapperHomePage(title: 'App Launcher'),
    );
  }
}

class WrapperHomePage extends StatefulWidget {
  const WrapperHomePage({super.key, required this.title});

  final String title;

  @override
  State<WrapperHomePage> createState() => _WrapperHomePageState();
}

class _WrapperHomePageState extends State<WrapperHomePage> {
  Widget? _currentApp;

  void _loadApp(Widget app) {
    setState(() {
      _currentApp = app;
    });
  }

  @override
  Widget build(BuildContext context) {
    // If an app is loaded, show it
    if (_currentApp != null) {
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) {
            setState(() {
              _currentApp = null;
            });
          }
        },
        child: _currentApp!,
      );
    }

    // Otherwise show the app selection screen
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select an App to Launch',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () => _loadApp(const AppOne()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade100,
                ),
                child: const Text('Launch App One',
                    style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () => _loadApp(const AppTwo()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                ),
                child: const Text('Launch App Two',
                    style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () => _loadApp(const AppThree()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade100,
                ),
                child: const Text('Launch App Three',
                    style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
