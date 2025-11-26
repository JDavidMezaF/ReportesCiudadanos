import 'package:flutter/material.dart';
import 'detallereporte.dart';
import 'package:flutter_application_1/models/reporte.dart'; 

// Página principal de reportes
class MisReportesPage extends StatelessWidget {
  MisReportesPage({super.key}); 

  // ---------------------------------------------------------------------
  // 🔑 DATOS MOCK CORREGIDOS (Incluye los 3 reportes simulados)
  // ---------------------------------------------------------------------
  final List<Reporte> reportes = [
    Reporte(
      id: '1', 
      nombre: 'Ana María López', 
      nombreReporte: 'Bache Profundo',
      descripcion: 'El bache en la entrada es tan profundo que revienta las llantas. Es peligroso y necesita reparación urgente.', 
      tiempoFalla: '3 semanas',
      calle: 'Calle Monte 5',
      colonia: 'La Montaña',
      fecha: '2025-11-25',
    ),
    Reporte(
      id: '2', 
      nombre: 'Carlos R. Jiménez', 
      nombreReporte: 'Grieta en Asfalto y Agua Estancada',
      descripcion: 'Hay una grieta muy ancha que provoca estancamiento de agua de lluvia frente al negocio. Es foco de infección.', 
      tiempoFalla: '1 mes',
      calle: 'Av. Insurgentes 30',
      colonia: 'Juárez',
      fecha: '2025-11-26',
    ),
    Reporte(
      id: '3', 
      nombre: 'Sofía V. Hernández', 
      nombreReporte: 'Coladera Rota',
      descripcion: 'La rejilla de la coladera se hundió por el paso de un camión pesado. La calle se está cayendo y es un riesgo peatonal.', 
      tiempoFalla: '10 días',
      calle: 'Ciclón 18',
      colonia: 'Libertad',
      fecha: '2025-11-26',
    ),
  ];
  // ---------------------------------------------------------------------

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
        child: Column(
          children: [
            const Text(
              'MIS REPORTES',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: reportes.length,
                itemBuilder: (context, index) {
                  final reporte = reportes[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: const Icon(Icons.description, size: 40),
                      title: Text(reporte.nombreReporte), 
                      subtitle: Text(reporte.descripcion), 
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalleReporte(
                              titulo: reporte.nombreReporte,
                              descripcion: reporte.descripcion,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6F00),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Regresar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}