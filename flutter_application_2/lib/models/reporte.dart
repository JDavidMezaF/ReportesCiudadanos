class Reporte {
  final String id;
  final String nombreReporte;
  final String descripcion;
  final String nombre;
  final String tiempoFalla;
  final String calle;
  final String colonia;
  final String fecha;

  Reporte({
    required this.id,
    required this.nombreReporte,
    required this.descripcion,
    required this.nombre,
    required this.tiempoFalla,
    required this.calle,
    required this.colonia,
    required this.fecha,
  });

  // Método para convertir un Map (de Firestore) a un objeto Reporte
  factory Reporte.fromMap(Map<String, dynamic> map, String id) {
    return Reporte(
      id: id,
      nombreReporte: map['nombreReporte'] ?? '',
      descripcion: map['descripcion'] ?? '',
      nombre: map['nombre'] ?? '',
      tiempoFalla: map['tiempoFalla'] ?? '',
      calle: map['calle'] ?? '',
      colonia: map['colonia'] ?? '',
      fecha: map['fecha'] ?? '',
    );
  }

  // Método para convertir un objeto Reporte a Map (para guardar en Firestore)
  Map<String, dynamic> toMap() {
    return {
      'nombreReporte': nombreReporte,
      'descripcion': descripcion,
      'nombre': nombre,
      'tiempoFalla': tiempoFalla,
      'calle': calle,
      'colonia': colonia,
      'fecha': fecha,
    };
  }

  // Método copyWith para crear copias con modificaciones (opcional pero útil)
  Reporte copyWith({
    String? id,
    String? nombreReporte,
    String? descripcion,
    String? nombre,
    String? tiempoFalla,
    String? calle,
    String? colonia,
    String? fecha,
  }) {
    return Reporte(
      id: id ?? this.id,
      nombreReporte: nombreReporte ?? this.nombreReporte,
      descripcion: descripcion ?? this.descripcion,
      nombre: nombre ?? this.nombre,
      tiempoFalla: tiempoFalla ?? this.tiempoFalla,
      calle: calle ?? this.calle,
      colonia: colonia ?? this.colonia,
      fecha: fecha ?? this.fecha,
    );
  }

  @override
  String toString() {
    return 'Reporte{id: $id, nombreReporte: $nombreReporte, nombre: $nombre, fecha: $fecha}';
  }
}