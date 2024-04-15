// mis_juegos.dart
import 'package:flutter/material.dart';
import 'API.dart'; // Importa tu clase InvitacionService
import 'notificacion.dart';

class MisJuegosScreen extends StatefulWidget {
  @override
  _MisJuegosScreenState createState() => _MisJuegosScreenState();
}

class _MisJuegosScreenState extends State<MisJuegosScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final InvitacionService _invitacionService = InvitacionService('URL_DE_TU_API'); // Crea una instancia de InvitacionService

  String idJuego = 'id_juego'; // Definir idJuego
  String email = 'email';
  String estado = 'estado';

void _mostrarNotificaciones(BuildContext context) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => NotificacionesScreen(),
      transitionsBuilder: (context, animation1, animation2, child) {
        return FadeTransition(
          opacity: animation1,
          child: child,
        );
      },
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Juegos'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.yellow, // Fondo amarillo
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      _buildSection(title: 'Jugados'),
                      _buildSection(title: 'Pendientes'),
                      _buildSection(title: 'Finalizados'),
                    ],
                  ),
                ),
                _buildPageIndicator(),
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: () {
                _mostrarNotificaciones(context); // Llama a la función para mostrar las notificaciones
              },
              child: Image.asset('assets/campanita.png', width: 36, height: 36),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title}) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 0, // Sin jugadores por ahora
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Jugador ${index + 1}'),
                  subtitle: Text('Puntuación: ${index * 100}'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Acción al hacer clic en un jugador
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3, // Total de páginas en el PageView
        (index) => _buildIndicator(index),
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
