import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/splash_page.dart';

void main() {
  /// Desactivar rotación y permitir solo orientación en modo retrato
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  /// Configurar solo modo claro
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecuaciones diferenciales',
      debugShowCheckedModeBanner: false,
      theme: themeData(context),
      home: const SplashScreen(),
    );
  }

  ///[ThemeData] personalizado
  ThemeData themeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(primary: Colors.blueAccent),
    );
  }
}
