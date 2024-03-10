import 'package:flutter/material.dart';

import '../themes/custom_text_style.dart';

Card cardCustom(BuildContext context, {required CustomTextCards text}) {
  return Card(
    elevation: 3,
    child: Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.9,
      child: text,
    ),
  );
}
