import 'package:flutter/material.dart';

import '../themes/custom_text_style.dart';

class TextItems extends StatelessWidget {
  final String text;
  const TextItems({super.key, required this.text});

  @override
  Widget build(BuildContext context) => CustomSubtitle(text: text);
}
