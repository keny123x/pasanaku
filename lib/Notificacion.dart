import 'package:flutter/material.dart';

class NotificacionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notificaciones',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.yellow, // Establecer el color de fondo del Scaffold
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.transparent, // Establecer el color de fondo transparente para el Container
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNotificacion(color: Colors.red, juego: 'Los Pelones', estado: 'Rechazado', tiempo: 'Hace 5 min'),
              SizedBox(height: 16),
              _buildNotificacion(color: Colors.green, juego: 'El Dorado', estado: 'Aceptado', tiempo: 'Hace 10 min'),
              SizedBox(height: 16),
              _buildNotificacion(color: Colors.blue, juego: 'La Isla Misteriosa', estado: 'Invitación Fallida', tiempo: 'Hace 15 min'),
              SizedBox(height: 16),
              _buildNotificacion(color: Colors.red, juego: 'El Laberinto', estado: 'Rechazado', tiempo: 'Hace 20 min'),
              SizedBox(height: 16),
              _buildNotificacion(color: Colors.green, juego: 'La Fortaleza', estado: 'Aceptado', tiempo: 'Hace 25 min'),
              SizedBox(height: 16),
              // Agrega más notificaciones aquí según sea necesario
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificacion({required Color color, required String juego, required String estado, required String tiempo}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Juego: $juego',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Estado: $estado',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Tiempo: $tiempo',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
