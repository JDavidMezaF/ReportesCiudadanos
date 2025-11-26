// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// 🔑 IMPORTACIÓN CORREGIDA: Importamos la pantalla de cuenta DEL ADMIN
import 'micuenta.dart'; // Asumiendo que están en la misma carpeta (admin/)

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  static const Color orange = Color(0xFFF07A2E);
  static const Color teal = Color(0xFF00897B);
  static const Color indigo = Colors.indigo;
  static const double iconSize = 64;
  
  static const String logoAssetPath = 'img/logo.png'; 

  void _goToReportes(BuildContext context) {
    Navigator.pushNamed(context, '/admin_reportes');
  }

  void _goToMiCuenta(BuildContext context) {
    // 🔑 NAVEGACIÓN CORREGIDA: Navega a MiCuentaAdminScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MiCuentaAdminScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // --- Barra Superior ---
            Container(
              width: double.infinity,
              color: orange,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                  Container(
                    width: 36, height: 36,
                    margin: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        logoAssetPath, 
                        fit: BoxFit.contain, 
                        errorBuilder: (_, __, ___) => Container(color: Colors.white24)
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'GOBIERNO DE NUEVO LEÓN',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),

            // --- Opciones ---
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildOptionCard(
                        context, 
                        'Reportes', 
                        Icons.description_outlined, 
                        teal, 
                        () => _goToReportes(context)
                      ),
                      _buildOptionCard(
                        context, 
                        'Mi cuenta', 
                        Icons.account_circle_outlined, 
                        indigo, 
                        () => _goToMiCuenta(context) // Llama a la función correcta
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // --- Botón Salir ---
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orange,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
                  child: const Text('Salir', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context, String label, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160, height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: color),
            const SizedBox(height: 16),
            Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}