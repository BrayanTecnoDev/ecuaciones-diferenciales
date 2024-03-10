import 'package:ecuaciones_diferenciales/utils/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

enum FormulaType { crecimiento, enfriamiento }

Map<String, String> formulas = {
  "Crecimiento": r'P(0) = Ce^{kt}',
  "Enfriamiento": r'T = TA + C e^{kt}'
};

class Formulas extends StatelessWidget {
  final FormulaType formulaType;
  const Formulas({super.key, required this.formulaType});

  @override
  Widget build(BuildContext context) {
    String formulaKey;
    switch (formulaType) {
      case FormulaType.crecimiento:
        formulaKey = "Crecimiento";
        break;
      case FormulaType.enfriamiento:
        formulaKey = "Enfriamiento";
        break;
    }
    return Math.tex(formulas[formulaKey]!, textStyle: textTheme.titleMedium);
  }
}
