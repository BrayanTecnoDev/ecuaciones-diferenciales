import 'package:ecuaciones_diferenciales/utils/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

import '../../controller/medidas_tiempo.dart';

class CustomDropDownButton extends StatefulWidget {
  final void Function(String?) onChanged;
  final String value;
  const CustomDropDownButton(
      {super.key, required this.onChanged, required this.value});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  final List<String> medidaTiempoList = timeMeasures;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.value,
      items: timeMeasures.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: widget.onChanged,
      elevation: 2,
      borderRadius: BorderRadius.circular(25),
      style: textTheme.labelSmall,
    );
  }
}
