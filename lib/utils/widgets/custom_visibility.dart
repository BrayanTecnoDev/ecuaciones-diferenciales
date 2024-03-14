//Widget personalizado para establecer la visibilidad de los textFields.
// Según el botón seleccionado.
import 'package:flutter/material.dart';

import 'text_form_field.dart';

class VisibilityFormField extends StatelessWidget {
  final bool visible;
  final String title;
  final String text;
  final String hintText;
  final TextEditingController controller;
  final Function(String) onChanged;

  const VisibilityFormField({
    super.key,
    required this.visible,
    required this.title,
    required this.text,
    required this.hintText,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Column(
        children: [
          Text(title, textAlign: TextAlign.center,),
          CustomTextFormFields(
              text: text,
              hintText: hintText,
              controller: controller,
              onChanged: onChanged),
        ],
      ),
    );
  }
}
