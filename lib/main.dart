import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1. Tema Terang (Default)
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      // 2. Tema Gelap
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      // 3. Paksa aplikasi menggunakan Dark Mode
      themeMode: ThemeMode.dark, 

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 51, 51, 101),
          title: const Text('Tugas 1', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Tugas 1 Flutter Naufal Dariskarim',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                color: const Color.fromARGB(255, 255, 233, 70)
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigoAccent,
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}