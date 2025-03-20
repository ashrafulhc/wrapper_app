import 'package:app_one/main.dart';
import 'package:app_three/main.dart';
import 'package:app_two/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const WrapperApp());
}

class WrapperApp extends StatelessWidget {
  const WrapperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Wrapper App',
      home: WrapperHome(),
    );
  }
}

class WrapperHome extends StatelessWidget {
  const WrapperHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrapper App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppOne()),
                );
              },
              child: const Text('Open App A'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppTwo()),
                );
              },
              child: const Text('Open App B'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppThree()),
                );
              },
              child: const Text('Open App C'),
            ),
          ],
        ),
      ),
    );
  }
}
