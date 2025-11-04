import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double buttonHeight = 100; // 🔧 Ajusta aquí el tamaño de los botones
  double salirButtonHeight = 40; // Tamaño específico para "Salir"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6F00), // Naranja institucional
        centerTitle: true, 
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'img/logo.png', 
              height: 60,
            ),
            const SizedBox(width: 10),
            const Text(
              'GOBIERNO DE NUEVO LEÓN',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 100),
            _buildButton(Icons.add, 'Nuevo Reporte'),
            const SizedBox(height: 20),
            _buildButton(Icons.description, 'Mis reportes'),
            const SizedBox(height: 20),
            _buildButton(Icons.person, 'Mi cuenta'),
            const Spacer(),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 250), // 🔧 Ajusta los lados aquí
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6F00),
                  minimumSize: Size(double.infinity, salirButtonHeight), // Altura
                ),
                onPressed: () {
                  // Acción de salida
                },
                child: const Text(
                  'Salir',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, String label) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: ElevatedButton.icon(
        icon: Icon(icon, color: const Color.fromARGB(255, 0, 0, 0), size:50),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        onPressed: () {
          // Acción para cada botón
        },
      ),
    );
  }
}
