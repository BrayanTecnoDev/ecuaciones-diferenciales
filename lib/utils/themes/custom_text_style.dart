import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'custom_text_theme.dart';

/// Clase para los textos del AppBar
class AppBarStyle extends StatelessWidget {
  final String title;
  const AppBarStyle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(title,
        style: textTheme.titleLarge,
        minFontSize: 23,
        maxFontSize: 35,
        stepGranularity: 1,
        maxLines: 1);
  }
}

///Clase para los subtitulos
class CustomSubtitle extends StatelessWidget {
  final String text;
  const CustomSubtitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text,
        style: textTheme.titleMedium,
        minFontSize: 25,
        maxFontSize: 33,
        stepGranularity: 1,
        maxLines: 1);
  }
}

///Clase para el texto de las Cards.
class CustomTextCards extends StatelessWidget {
  final String text;
  const CustomTextCards({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: textTheme.bodyMedium,
      minFontSize: 18,
      maxFontSize: 25,
      stepGranularity: 1,
      maxLines: 4,
    );
  }
}

///Clase que define los labels de los textFormField
class CustomTextLabelTextFormField extends StatelessWidget {
  final String text;
  const CustomTextLabelTextFormField({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: textTheme.labelSmall,
      minFontSize: 17,
      maxFontSize: 25,
      stepGranularity: 1,
      maxLines: 1,
    );
  }
}

//Clase que define el estilo del texto de
///los titulos de los textFormField
class CustomTextTitleFields extends StatelessWidget {
  final String text;
  const CustomTextTitleFields({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      textAlign: TextAlign.center,
      text,
      style: textTheme.labelMedium,
      minFontSize: 17,
      maxFontSize: 25,
      stepGranularity: 1,
      maxLines: 1,
    );
  }
}

///Clase que define el estilo del texto de los botones
class CustomStyleTextButton extends StatelessWidget {
  final String text;
  const CustomStyleTextButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: textTheme.labelLarge,
      minFontSize: 10,
      maxFontSize: 15,
      stepGranularity: 1,
      maxLines: 1,
    );
  }
}
