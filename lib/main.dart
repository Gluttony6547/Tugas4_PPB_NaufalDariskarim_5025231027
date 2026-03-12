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
      themeMode: ThemeMode.dark, // karena saya pengen Dark Mode
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18), // Background
      ),
      home: const MyHomePage(),
    );
  }
}

// Menggunakan StatefulWidget biar bisa diubah ubah :")
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 4; // angka awal counter, tapi kayanya saya samakan aja 4 kayak di gambar

  // Fungsi untuk menambah counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 31, 53), // Warna appbar
        title: const Text('My First App', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      // SingleChildScrollView agar layar tidak error 'Overflow' saat di-scroll
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Frame/box Gambar
              Container(
                padding: const EdgeInsets.all(16),
                color: const Color.fromARGB(255, 45, 55, 72), 
                child: Image.network(
                  'https://static.wikia.nocookie.net/evangelion/images/2/2c/NERV_Logo.png/revision/latest?cb=20120312002136', // Link EVANGELIONNN
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10), // Jarak antar kotak

              // 2. Kotak Teks yang "what image issdatt"
              Container(
                padding: const EdgeInsets.all(16),
                color: const Color.fromARGB(255, 112, 36, 89),
                child: const Text(
                  'What image is dat',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),

              // 3. Kotak Deretan Ikon (Warna Emas/Bronze Gelap)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: const Color.fromARGB(255, 116, 66, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconColumn(Icons.restaurant, 'Food'),
                    _buildIconColumn(Icons.landscape, 'Scenery'),
                    _buildIconColumn(Icons.people, 'People'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 4. Kotak Counter & Tombol plus +++
              Container(
                padding: const EdgeInsets.all(16),
                color: const Color.fromARGB(255, 35, 78, 82),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Counter here: $_counter', 
                      style: const TextStyle(fontSize: 16, color: Colors.white)
                    ),
                    // Tombol Plus (+)
                    InkWell(
                      onTap: _incrementCounter, // Panggil fungsi tambah yg counter itu
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        color: const Color.fromARGB(255, 49, 151, 149), // Warna tombol plus
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget bantuan agar kita tidak perlu menulis kode ikon berulang kali
  Widget _buildIconColumn(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: const Color.fromARGB(255, 255, 255, 255)),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
      ],
    );
  }
}