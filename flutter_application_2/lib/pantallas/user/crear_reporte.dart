import 'package:flutter/material.dart';

class NuevoReportePage extends StatefulWidget {
  const NuevoReportePage({super.key});

  @override
  State<NuevoReportePage> createState() => _NuevoReportePageState();
}

class _NuevoReportePageState extends State<NuevoReportePage> {
  final _formKey = GlobalKey<FormState>();
  
  // Controladores para los campos de texto
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _nombreReporteController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _tiempoFallaController = TextEditingController();
  final TextEditingController _calleController = TextEditingController();
  final TextEditingController _coloniaController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    // Limpieza de controladores
    _nombreController.dispose();
    _nombreReporteController.dispose();
    _descripcionController.dispose();
    _tiempoFallaController.dispose();
    _calleController.dispose();
    _coloniaController.dispose();
    super.dispose();
  }

  // ----------------------------------------------------------------------
  // Función de envío SIMULADO (Sin Firebase)
  // ----------------------------------------------------------------------
  Future<void> _enviarReporte() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    setState(() => _isLoading = true);

    // SIMULACIÓN: Esperamos 2 segundos para imitar una conexión a internet
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Mostrar mensaje de éxito
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ Reporte guardado localmente (Simulación)'),
        backgroundColor: Colors.green,
      ),
    );

    // Regresar a la pantalla anterior
    Navigator.pop(context);
    
    if (mounted) {
      setState(() => _isLoading = false);
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'NUEVO REPORTE',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              _buildTextField(
                'Nombre',
                controller: _nombreController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              
              _buildTextField(
                'Nombre del reporte',
                controller: _nombreReporteController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor ingresa el nombre del reporte';
                  }
                  return null;
                },
              ),
              
              _buildTextField(
                'Explique el problema',
                controller: _descripcionController,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor describe el problema';
                  }
                  return null;
                },
              ),
              
              _buildTextField(
                '¿Cuánto tiempo tiene de falla?',
                controller: _tiempoFallaController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor indica el tiempo de falla';
                  }
                  return null;
                },
              ),
              
              _buildTextField(
                'Calle del lugar a reportar',
                controller: _calleController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor ingresa la calle';
                  }
                  return null;
                },
              ),
              
              _buildTextField(
                'Colonia',
                controller: _coloniaController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor ingresa la colonia';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6F00),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _isLoading ? null : _enviarReporte,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Enviar',
                          style: TextStyle(fontSize: 18),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label, {
    required TextEditingController controller,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}