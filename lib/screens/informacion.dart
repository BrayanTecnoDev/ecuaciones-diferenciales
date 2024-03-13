import 'package:ecuaciones_diferenciales/utils/themes/custom_text_style.dart';
import 'package:flutter/material.dart';

class InformacionApp extends StatelessWidget {
  const InformacionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          children: [
            CustomTextTitleFields(text: "Desarrollado por:"),
            CustomTextCards(text: "Brayan Yesid Lozada Orozco"),
            SizedBox(height: 15),
            CustomTextTitleFields(text: "Materia:"),
            CustomTextCards(text: "Ecuaciones diferenciales"),
            SizedBox(height: 15),
            CustomTextTitleFields(text: "Tema:"),
            CustomTextCards(text: "Crecimiento poblacional"),
            CustomTextCards(text: "Ley de enfriamiento de Newtom"),
          ],
        ),
      ),
    );
  }
}
