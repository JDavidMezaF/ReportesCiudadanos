// Archivo: lib/auth/create_account.dart

import 'package:flutter/material.dart';
import '../main.dart'; // Sube un nivel (../) para encontrar main.dart

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _createAccount() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final name = _nameController.text.trim();
    
    // SIMULACIÓN de creación de cuenta
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('¡Cuenta creada con éxito (Simulación)!')),
    );
    
    // Navegar a la pantalla principal como 'User'
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(
          title: 'Flutter Demo Home Page', 
          username: name.isEmpty ? 'Usuario' : name, 
          role: 'User'
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // El build es idéntico, solo cambia la función _createAccount
    // ... (Usa el build que ya tenías, o el que te pasé anteriormente, 
    // eliminando solo la variable _isLoading si quieres simplificar al máximo)
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
              'CREAR CUENTA',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text('Registra tu cuenta', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Nombre Completo', border: OutlineInputBorder()),
                    validator: (v) => v!.isEmpty ? 'Ingresa nombre' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Correo', border: OutlineInputBorder()),
                    validator: (v) => v!.isEmpty ? 'Ingresa correo' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Contraseña', border: OutlineInputBorder()),
                    validator: (v) => v!.length < 6 ? 'Mínimo 6 caracteres' : null,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF6F00)),
                      onPressed: _createAccount, 
                      child: const Text('Crear cuenta', style: TextStyle(fontSize: 18)),
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