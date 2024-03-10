import 'package:ecuaciones_diferenciales/utils/widgets/formulas.dart';
import 'package:flutter/material.dart';

import '../themes/custom_text_style.dart';

enum CardType { small, medium, big }

class CustomCard extends StatelessWidget {
  final String texto;
  final void Function()? onTap;
  final FormulaType? formulaType;
  final CardType cardType;
  final List<Widget>? children;
  const CustomCard(
      {super.key,
      required this.texto,
      this.formulaType,
      this.onTap,
      required this.cardType,
      this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: InkWell(
          onTap: onTap,
          child: _CustomSizedBox(
            key: key,
            text: texto,
            formulaType: formulaType,
            cardType: cardType,
            children: children,
          )),
    );
  }
}

class _CustomSizedBox extends StatelessWidget {
  final String text;
  final CardType cardType;
  final FormulaType? formulaType;
  final List<Widget>? children;

  const _CustomSizedBox(
      {super.key,
      required this.cardType,
      required this.text,
      this.formulaType,
      this.children});

  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width * 0.9;

    // if (cardType == CardType.small) {
    //   return SizedBox(
    //     width: sizeWidth,
    //     height: MediaQuery.sizeOf(context).width * 0.13,
    //     child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [Text(text)]),
    //   );
    // } else
    if (cardType == CardType.medium) {
      return Container(
        width: sizeWidth,
        padding: const EdgeInsets.all(10),
        height: MediaQuery.sizeOf(context).width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: CustomTextTitleFields(text: text)),
            const SizedBox(height: 10),
            Center(child: Formulas(formulaType: formulaType!))
          ],
        ),
      );
    }
    //  else if (cardType == CardType.big) {
    //   return SizedBox(
    //     width: sizeWidth,
    //     height: MediaQuery.sizeOf(context).width * 0.4,
    //     child: Column(
    //       children: [
    //         Text(text),
    //         Center(child: Formulas(formulaType: formulaType!)),
    //       ],
    //     ),
    //   );
    // }
    return const SizedBox();
  }
}
