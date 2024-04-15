// main.dart
import 'package:flutter/material.dart';
import 'mis_juegos.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pasanaku Login',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PASANAKU', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        color: Colors.yellow, // Fondo amarillo
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Aquí van los campos de texto para el correo electrónico y la contraseña
            TextField(
              decoration: InputDecoration(
                hintText: 'Correo electrónico',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contraseña',
              ),
            ),
            // Este es el botón de inicio de sesión
            ElevatedButton(
              onPressed: () {
                // Aquí colocas la lógica para verificar el inicio de sesión
                // Por ahora, simplemente navegará a la pantalla de MisJuegosScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MisJuegosScreen()),
                );
              },
              child: Text(
                'Iniciar sesión',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Aquí colocas la lógica para el enlace de "¿Olvidaste tu contraseña?"
              },
              child: Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Cambiar el color del enlace si lo deseas
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido a Juego de PASANAKU!!'),
      ),
      body: Container(
        color: Colors.yellow, // Fondo amarillo
        child: Center(
          child: Text(
            '¡Bienvenido!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
