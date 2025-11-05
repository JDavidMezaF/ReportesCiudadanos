import 'package:flutter/material.dart';

class MiCuentaPage extends StatelessWidget {
  const MiCuentaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Cuenta')),
      body: const Center(child: Text('Información de la cuenta')),
    );
  }
}