// Archivo: lib/pantallas/admin/micuenta.dart
import 'package:flutter/material.dart';

class MiCuentaAdminScreen extends StatelessWidget {
  const MiCuentaAdminScreen({super.key});

  // Colores y constantes
  static const Color orange = Color(0xFFF07A2E);
  static const Color green = Color(0xFF4CAF50); 
  
  // *** RUTA DE TU LOGO ***
  static const String logoAssetPath = 'img/logo.png'; 
  
  // Datos del Admin
  final String _nombre = 'David Hazael Medrano Martínez';
  final String _correo = 'davidhazael2006@gmail.com';
  final String _telefono = '8114906150';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- AppBar con Logo y Título ---
      appBar: AppBar(
        backgroundColor: orange,
        title: Row(
          children: [
            // ** Logo **
            Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  logoAssetPath,
                  width: 36,
                  height: 36,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Container(color: Colors.white24),
                ),
              ),
            ),
            // ** Título **
            const Text('MI CUENTA ADMIN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Título Principal ---
              Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 400), 
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'MIS DATOS',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- Contenedor de Información ---
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Stack(
                      children: [
                        // Fondo de marca de agua 'NL'
                        Positioned.fill(
                          child: Center(
                            child: Transform.scale(
                              scale: 2.2,
                              child: Text(
                                'N L',
                                style: TextStyle(
                                  fontSize: 100,
                                  fontWeight: FontWeight.w900,
                                  // ignore: deprecated_member_use
                                  color: Colors.grey.shade300.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Contenido
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildInfoItem(label: 'Nombre:', value: _nombre),
                            const SizedBox(height: 30),
                            _buildInfoItem(label: 'Cambiar contraseña:', value: '********', isLink: true),
                            const SizedBox(height: 30),
                            _buildInfoItem(label: 'Correo electrónico:', value: _correo),
                            const SizedBox(height: 30),
                            _buildInfoItem(label: 'Número de teléfono:', value: _telefono),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),

              // --- Botones de Acción ---
              Row(
                children: [
                  // Botón Regresar
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Regresar', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Botón Cerrar Sesión
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Cerrando sesión...')),
                        );
                      },
                      child: const Text('Cerrar Sesión', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({required String label, required String value, bool isLink = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: isLink ? orange : Colors.black, 
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: isLink ? orange : Colors.black,
              decoration: isLink ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 4),
          child: CustomPaint(
            painter: _DottedLinePainter(color: Colors.grey.shade500),
          ),
        ),
      ],
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  _DottedLinePainter({required this.color, this.dashWidth = 5, this.dashSpace = 5});

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.square;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}