import 'package:flutter/material.dart';

class MisReportesPage extends StatelessWidget {
  const MisReportesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Reportes')),
      body: const Center(child: Text('Listado de reportes')),
    );
  }
}