import 'package:flutter/material.dart';

class AppStructureDemo extends StatefulWidget {
  const AppStructureDemo({super.key});

  @override
  State<AppStructureDemo> createState() => _AppStructureDemoState();
}

class _AppStructureDemoState extends State<AppStructureDemo> {
  bool _isDarkMode = false;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.indigo,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Exercise 4 – App Structure & Theme'),
          actions: [
            Row(
              children: [
                const Text('Dark', style: TextStyle(color: Colors.white, fontSize: 14)),
                Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() { _isDarkMode = value; });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.white38,
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'This is a simple screen with theme toggle.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Counter: $_counter',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() { _counter++; });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Counter increased to $_counter'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
