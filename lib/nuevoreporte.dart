import 'package:flutter/material.dart';

class NuevoReportePage extends StatelessWidget {
  const NuevoReportePage({super.key});

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
        child: ListView(
          children: [
            const Text(
              'NUEVO REPORTE',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            _buildTextField('Nombre'),
            _buildTextField('Nombre del reporte'),
            _buildTextField('Explique el problema', maxLines: 4),
            _buildTextField('¿Cuánto tiempo tiene de falla?'),
            _buildTextField('Calle del lugar a reportar'),
            _buildTextField('Colonia'),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6F00),
                ),
                onPressed: () {
                  // Mostrar mensaje y regresar al main
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Reporte enviado')),
                  );

                  // Esperar un momento y regresar
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pop(context);
                  });
                },
                child: const Text(
                  'Enviar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}