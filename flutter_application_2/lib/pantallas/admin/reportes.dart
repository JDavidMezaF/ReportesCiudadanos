// Archivo: lib/pantallas/reportes.dart

import 'package:flutter/material.dart';
// 🔑 CORREGIDO: Importamos la clase Reporte desde su nueva ubicación en 'lib/models'.
import 'package:flutter_application_1/models/reporte.dart';
// 🔑 CORREGIDO: Asumimos que 'info_r.dart' está ahora en la misma carpeta 'lib/pantallas' (minúscula).
import 'info_r.dart'; 

class ReportesScreen extends StatefulWidget {
  const ReportesScreen({super.key});

  @override
  State<ReportesScreen> createState() => _ReportesScreenState();
}

class _ReportesScreenState extends State<ReportesScreen> with SingleTickerProviderStateMixin {
  // Datos mock iniciales con la información solicitada
  final List<Reporte> _reportes = [
    Reporte(
      id: '1', 
      nombre: 'GERALDA FLORES', 
      nombreReporte: 'LUZ MERCURIAL NO FUNCIONA',
      descripcion: 'HAY UNA LAMPARA QUE DEJO DE FUNCIONAR Y ESA PARTE DE LA CALLE ESTA OBSCURA', 
      tiempoFalla: '5 DIAS',
      calle: 'OLIVOS',
      colonia: 'LA ALIANZA',
      fecha: '2025-11-05',
    ),
    Reporte(
      id: '2', 
      nombre: 'Paloma Meza', 
      nombreReporte: 'Alcantarilla descubierta',
      descripcion: 'hay una alcantarilla destapada sobre la avenida', 
      tiempoFalla: '1 semana aproximadamente',
      calle: 'Av monterrey',
      colonia: 'Nueva Esperanza',
      fecha: '2025-11-05',
    ),
  ];

  late final AnimationController _listEntryController;

  @override
  void initState() {
    super.initState();
    _listEntryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _listEntryController.forward();
  }

  @override
  void dispose() {
    _listEntryController.dispose();
    super.dispose();
  }

  // Navega a infoR y maneja la respuesta para eliminar el reporte
  void _openInfo(Reporte r) async {
    // La pantalla de detalles devolverá true si el reporte fue 'Aprobado'.
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        // 🔑 CORRECTO: Pasamos el objeto Reporte que ahora proviene del modelo unificado.
        pageBuilder: (_, __, ___) => InfoRScreen(reporte: r),
        transitionsBuilder: (_, animation, __, child) {
          final offset = Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(animation);
          return SlideTransition(position: offset, child: FadeTransition(opacity: animation, child: child));
        },
      ),
    );

    // Si el resultado es true (Aprobado), eliminamos el reporte de la lista.
    if (result == true) {
      setState(() {
        _reportes.removeWhere((reporte) => reporte.id == r.id);
      });
      // Reiniciar la animación de la lista para el nuevo estado
      _listEntryController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color orange = Color(0xFFF07A2E);
    // Usamos placeholder para evitar error de imagen 404
    const String placeholderImageUrl = 'https://placehold.co/36x36/F07A2E/ffffff?text=L';


    return Scaffold(
      appBar: AppBar(
        backgroundColor: orange,
        title: Row(
          children: [
            // ** CÓDIGO DEL LOGO IMPLEMENTADO ** 👇
            Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'img/logo.png',
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Image.network(
                    placeholderImageUrl, 
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // ** FIN DEL CÓDIGO DEL LOGO ** 👆
            const Text('REPORTES', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          children: [
            Expanded(
              child: _reportes.isEmpty ? _emptyState() : _buildListView(),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: orange),
                onPressed: () => Navigator.pop(context),
                child: const Text('Regresar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Text(
        'No hay reportes aún',
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }

  Widget _buildListView() {
    return AnimatedBuilder(
      animation: _listEntryController,
      builder: (context, _) {
        return ListView.separated(
          itemCount: _reportes.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final reporte = _reportes[index];
            final animationValue = (_listEntryController.value - (index * 0.08)).clamp(0.0, 1.0);
            return Opacity(
              opacity: animationValue,
              child: Transform.translate(
                offset: Offset(0, 20 * (1 - animationValue)),
                child: ReportTile(
                  reporte: reporte,
                  onTap: () => _openInfo(reporte),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/// Widget individual que muestra el ícono de hoja, nombre y descripción.
class ReportTile extends StatefulWidget {
  final Reporte reporte; // 🔑 CORRECTO: Usa el Reporte importado del modelo.
  final VoidCallback onTap;

  const ReportTile({super.key, required this.reporte, required this.onTap});

  @override
  State<ReportTile> createState() => _ReportTileState();
}

class _ReportTileState extends State<ReportTile> with SingleTickerProviderStateMixin {
  late final AnimationController _tapController;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _tapController = AnimationController(vsync: this, duration: const Duration(milliseconds: 120), lowerBound: 0.0, upperBound: 0.06);
  }

  @override
  void dispose() {
    _tapController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails _) => _tapController.forward();
  void _onTapUp(TapUpDetails _) {
    _tapController.reverse();
    widget.onTap();
  }

  void _onTapCancel() => _tapController.reverse();

  @override
  Widget build(BuildContext context) {
    final reporte = widget.reporte;
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedBuilder(
          animation: _tapController,
          builder: (context, child) {
            final scale = 1 - _tapController.value;
            return Transform.scale(
              scale: scale,
              child: Container(
                decoration: BoxDecoration(
                  color: _hovering ? Colors.grey.shade50 : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    // ignore: prefer_const_constructors
                    BoxShadow(color: Colors.black12, blurRadius: 6, offset: const Offset(0, 2)),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // ICONO IMAGEN HOJA (usa Image.network o Image.asset)
                    Container(
                      width: 56,
                      height: 56,
                      margin: const EdgeInsets.only(right: 12),
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/1250/1250680.png', // ejemplo: icono hoja
                        fit: BoxFit.contain,
                        color: Colors.orange,
                        errorBuilder: (_, __, ___) => const Icon(Icons.description_outlined, size: 36, color: Colors.orange),
                      ),
                    ),

                    // Texto
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Mostrar el nombre del reporte en lugar del nombre del usuario como título principal
                          Text(reporte.nombreReporte, style: const TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 6),
                          Text('Reportado por: ${reporte.nombre}', style: TextStyle(color: Colors.grey.shade700)),
                          const SizedBox(height: 6),
                          Text(reporte.fecha, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                        ],
                      ),
                    ),

                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}