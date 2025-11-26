// Archivo: lib/auth/login.dart

import 'package:flutter/material.dart';
import '../main.dart'; 
import '../pantallas/admin/admin.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  // Correo específico para identificar al administrador (simulado)
  static const String adminUser = 'Admin'; 

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  // FUNCIÓN SÍNCRONA para iniciar sesión con datos estáticos
  void _attemptLogin() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final user = _userController.text.trim();
    final pass = _passController.text.trim();
    
    // 1. Lógica de ADMINISTRADOR
    if (user == adminUser && pass == '123456') {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bienvenido Administrador'))
        );
        // Navegamos a la pantalla de Admin
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AdminScreen()), 
        );
      }
      return;
    } 
    
    // 2. Lógica de USUARIO
    if (user == 'User' && pass == '123456') {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bienvenido Usuario'))
        );
        // Navegamos al Dashboard de Usuario (MyHomePage)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => MyHomePage(
              title: 'Flutter Demo Home Page', 
              username: user,
              role: 'User'
            )
          ),
        );
      }
      return;
    }

    // Credenciales incorrectas
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Credenciales inválidas.')),
      );
    }
  }

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
            const SizedBox(height: 60),
            const Text(
              'INICIO DE SESIÓN',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Campo Usuario
                  TextFormField(
                    controller: _userController,
                    decoration: const InputDecoration(
                      labelText: 'Usuario', 
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa usuario';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Campo Contraseña
                  TextFormField(
                    controller: _passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa contraseña';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  
                  // Botón Entrar
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6F00),
                        foregroundColor: Colors.white, // Texto blanco
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _attemptLogin();
                        }
                      },
                      child: const Text('Entrar', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Botón Auto-Relleno User
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                      ),
                      onPressed: () {
                        _userController.text = 'User';
                        _passController.text = '123456';
                      },
                      child: const Text('Auto: User', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Botón Auto-Relleno Admin
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                      ),
                      onPressed: () {
                        _userController.text = adminUser;
                        _passController.text = '123456'; 
                      },
                      child: const Text('Auto: Admin', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}