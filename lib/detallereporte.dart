import 'package:flutter/material.dart';

class DetalleReporte extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const DetalleReporte({
    super.key,
    required this.titulo,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6F00),
        title: const Text('Detalle del Reporte'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              descripcion,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}