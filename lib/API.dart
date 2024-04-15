import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  final String apiUrl = 'https://api.example.com';
  final invitacionService = InvitacionService(apiUrl);

  // Ejemplo de llamada a aceptarInvitacion
  invitacionService.EnviarInvitacion('id_juego', 'correo@example.com', 'Estado');
}

class InvitacionService {
  final String baseUrl;

  InvitacionService(this.baseUrl);

  Future<void> EnviarInvitacion(String idJuego, String email, String estado) async {
    final url = '$baseUrl/invitaciones/$idJuego/aceptar';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'id_juego': idJuego,
          'email': email,
          'estado': estado,
        }),
      );
      final responseData = jsonDecode(response.body);
      // Manejo de la respuesta, si es necesario
    } catch (e) {
      // Manejo de errores
    }
  }
}
