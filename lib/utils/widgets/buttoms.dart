import 'package:flutter/material.dart';

import '../themes/custom_text_style.dart';

ElevatedButton customElevatedButton(
    {void Function()? onPressed, required String text}) {
  return ElevatedButton(
      onPressed: onPressed, child: CustomStyleTextButton(text: text));
}
