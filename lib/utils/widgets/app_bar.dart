import 'package:flutter/material.dart';

import '../themes/custom_text_style.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      Center(child: AppBarStyle(title: title));
}
