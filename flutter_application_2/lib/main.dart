import 'package:flutter/material.dart';

// --------------------------------------------------------------------------
// CORRECCIÓN DE IMPORTACIONES: Usamos rutas completas 'package:'
// Esto soluciona los errores de "Ambiguous import" y "URI doesn't exist"
// --------------------------------------------------------------------------

// Autenticación
import 'package:flutter_application_1/auth/auth_entry.dart';
import 'package:flutter_application_1/auth/login.dart';
import 'package:flutter_application_1/auth/create_account.dart';

// Admin
import 'package:flutter_application_1/admin/reportes.dart';
import 'package:flutter_application_1/pantallas/admin/admin.dart';
import 'package:flutter_application_1/pantallas/admin/reportes.dart';

// Usuario
import 'package:flutter_application_1/pantallas/user/crear_reporte.dart';
import 'package:flutter_application_1/pantallas/user/misreportes.dart';
import 'package:flutter_application_1/pantallas/user/micuenta.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Reportes NL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF6F00)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        // Rutas de Autenticación
        '/': (context) => const AuthEntryPage(),
        '/login': (context) => const LoginPage(),
        '/create_account': (context) => const CreateAccountPage(),

        // Ruta de Home Genérica
        '/home': (context) => const MyHomePage(title: 'Home', username: 'Usuario', role: 'User'),

        // Rutas específicas de Admin
        '/admin_home': (context) => const AdminScreen(),
        '/admin_reportes': (context) => const ReportesScreen(), // Verifica que la clase en reportes.dart sea ReportesScreen

        // Rutas específicas de Usuario
        '/nuevo_reporte': (context) => const NuevoReportePage(),
        '/mis_reportes': (context) => const MisReportesPage(),
        '/micuenta_user': (context) => const MiCuentaPage(),
      },
    );
  }
}

// MyHomePage - El widget principal que maneja la vista post-login
class MyHomePage extends StatelessWidget {
  final String title;
  final String? username;
  final String? role;

  const MyHomePage({super.key, required this.title, this.username, this.role});

  @override
  Widget build(BuildContext context) {
    if (role == 'Admin') {
      return const AdminScreen();
    } else {
      // Dashboard de usuario
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF6F00),
          title: Text('Bienvenido, $username'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDashboardButton(context, 'Crear Nuevo Reporte', Icons.add_box, '/nuevo_reporte'),
              _buildDashboardButton(context, 'Mis Reportes', Icons.list_alt, '/mis_reportes'),
              _buildDashboardButton(context, 'Mi Cuenta', Icons.person, '/micuenta_user'),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Cierra la sesión y regresa a la pantalla de entrada principal
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                },
                child: const Text('Cerrar Sesión'),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildDashboardButton(BuildContext context, String text, IconData icon, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton.icon(
          onPressed: () => Navigator.pushNamed(context, route),
          icon: Icon(icon, size: 30),
          label: Text(text, style: const TextStyle(fontSize: 18)),
          style: ElevatedButton.styleFrom(
            // ignore: deprecated_member_use
            backgroundColor: const Color(0xFFFF6F00).withOpacity(0.9),
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}