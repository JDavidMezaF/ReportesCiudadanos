import 'package:flutter/material.dart';

class MisReportesPage extends StatelessWidget {
  const MisReportesPage({super.key});

  // Simulación de datos (esto se reemplaza con datos reales de la BD)
  final List<Map<String, String>> reportes = const [
    {'titulo': 'REPORTE #1', 'descripcion': 'Descripción del reporte 1'},
    {'titulo': 'REPORTE #2', 'descripcion': 'Descripción del reporte 2'},
    {'titulo': 'REPORTE #3', 'descripcion': 'Descripción del reporte 3'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6F00),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('img/logo.png', height: 60),
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
            const Text(
              'MIS REPORTES',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: reportes.length,
                itemBuilder: (context, index) {
                  final reporte = reportes[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: const Icon(Icons.description, size: 40),
                      title: Text(reporte['titulo']!),
                      subtitle: Text(reporte['descripcion']!),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6F00),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Regresar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}