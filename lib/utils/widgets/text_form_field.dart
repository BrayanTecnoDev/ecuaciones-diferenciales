import 'package:flutter/material.dart';

import '../themes/custom_text_style.dart';
import '../themes/custom_text_theme.dart';

class TextFormFieldNumbers extends StatelessWidget {
  final String hintText;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool? enabled;

  const TextFormFieldNumbers({
    super.key,
    required this.hintText,
    this.textInputAction,
    this.controller,
    this.onChanged,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w400),
      decoration:
          InputDecoration(hintText: hintText, hintStyle: textTheme.labelSmall),
      enabled: enabled,
      controller: controller,
      keyboardType: TextInputType.number,
      textInputAction: textInputAction,
      onChanged: onChanged,
    );
  }
}

class CustomTextFormFields extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool? enabled;

  const CustomTextFormFields(
      {super.key,
      required this.text,
      required this.hintText,
      this.controller,
      this.onChanged,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: CustomTextTitleFields( text: text,)),
        const SizedBox(width: 10),
        Expanded(
          flex: 7,
          child: Container(
              padding: const EdgeInsets.only(bottom: 5),
              width: MediaQuery.sizeOf(context).width * 0.7,
              child: TextFormFieldNumbers(
                hintText: hintText,
                textInputAction: TextInputAction.next,
                controller: controller,
                onChanged: onChanged,
                enabled: enabled,
              )),
        )
      ],
    );
  }
}
