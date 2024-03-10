import 'package:ecuaciones_diferenciales/screens/informacion.dart';
import 'package:flutter/material.dart';

import '../utils/funtions/funtion_navigate_to_page.dart';
import '../utils/widgets/app_bar.dart';
import '../utils/widgets/custom_container.dart';
import '../utils/widgets/formulas.dart';
import 'formula_enfriamiento/ed_ley_enfriamiento_newton.dart';
import 'formula_crecimiento/ed_crecimiento_poblacional.dart';

class MyHomePage extends StatelessWidget {
  final String title = "Ecuaciones Diferenciales";
  final String text1 = "Ecuación Diferencial crecimiento poblacional";
  final String text2 = "Ecuación Diferencial Ley de enfriamiento de Newton";
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(title: title),
        actions: [
          IconButton(
              onPressed: () => navigateToPage(context, const InformacionApp()),
              icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
                texto: text1,
                cardType: CardType.medium,
                formulaType: FormulaType.crecimiento,
                onTap: () =>
                    navigateToPage(context, const CrecimientoPoblacional())),
            const SizedBox(
              height: 25,
            ),
            CustomCard(
              texto: text2,
              cardType: CardType.medium,
              formulaType: FormulaType.enfriamiento,
              onTap: () =>
                  navigateToPage(context, const LeyEnfriamientoNewton()),
            ),
          ],
        ),
      ),
    );
  }
}
