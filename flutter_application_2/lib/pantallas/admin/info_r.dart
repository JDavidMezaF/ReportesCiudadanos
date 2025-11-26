// Archivo: lib/pantallas/admin/info_r.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/reporte.dart';

class InfoRScreen extends StatefulWidget {
  final Reporte reporte;

  const InfoRScreen({super.key, required this.reporte});

  @override
  State<InfoRScreen> createState() => _InfoRScreenState();
}

class _InfoRScreenState extends State<InfoRScreen> {
  @override
  Widget build(BuildContext context) {
    const Color orange = Color(0xFFF07A2E);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orange,
        title: const Text('Detalle del Reporte', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.reporte.nombreReporte,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            _buildInfoRow('Reportado por:', widget.reporte.nombre),
            _buildInfoRow('Fecha:', widget.reporte.fecha),
            _buildInfoRow('Calle:', widget.reporte.calle),
            _buildInfoRow('Colonia:', widget.reporte.colonia),
            _buildInfoRow('Tiempo de falla:', widget.reporte.tiempoFalla),
            
            const SizedBox(height: 16),
            const Text('Descripción:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Text(widget.reporte.descripcion),
            
            const Spacer(),
            
            // Botones de acción (Simulados)
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // SIMULACIÓN: Regresar true para indicar que fue aprobado
                      Navigator.pop(context, true);
                    },
                    child: const Text('Aprobar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    onPressed: () {
                      // SIMULACIÓN: Regresar false para indicar que fue rechazado
                      Navigator.pop(context, false);
                    },
                    child: const Text('Rechazar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}