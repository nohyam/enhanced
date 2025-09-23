import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const seed = Colors.blueGrey;

  bool _isDark = false;

  final lightSeed = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.light,
  );

  final darkSeed = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightSeed,
        scaffoldBackgroundColor: lightSeed.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: lightSeed.primary,
          foregroundColor: lightSeed.onPrimary,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkSeed,
        scaffoldBackgroundColor: darkSeed.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: darkSeed.primary,
          foregroundColor: darkSeed.onPrimary,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'I am rich',
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _isDark = !_isDark;
                });
              },
              icon: Icon(_isDark ? Icons.light_mode : Icons.dark_mode),
            )
          ],
        ),
        body: Center(
          child: Image.asset('images/diamond.png'),
        ),
      ),
    );
  }
}
