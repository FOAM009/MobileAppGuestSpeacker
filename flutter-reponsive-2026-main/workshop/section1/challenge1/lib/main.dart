import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ResponsivePaddingPage(),
    );
  }
}

class ResponsivePaddingPage extends StatelessWidget {
  const ResponsivePaddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Padding Challenge')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isSmallScreen = constraints.maxWidth < 600;

          final double padding = isSmallScreen ? 12 : 32;
          final String text = isSmallScreen ? 'Small Screen' : 'Large Screen';

          return Padding(
            padding: EdgeInsets.all(padding),
            child: Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
