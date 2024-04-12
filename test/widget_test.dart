import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:logeo/main.dart';

void main() {
  testWidgets('Test de la aplicación de inicio de sesión', (WidgetTester tester) async {
    // Construye nuestra aplicación y dispara un frame.
    await tester.pumpWidget(LoginApp());

    // Verifica que nuestro contador comience en 0.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);

    // Pulsar el botón de inicio de sesión y disparar un frame.
    await tester.tap(find.text('Iniciar sesión'));
    await tester.pump();

    // Verifica que la página de bienvenida se muestra después de iniciar sesión.
    expect(find.text('¡Bienvenido!'), findsOneWidget);
  });
}
