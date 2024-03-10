import 'package:flutter/material.dart';

import '../../controller/formulas_ley_enfriamiento.dart';
import '../../utils/themes/custom_text_style.dart';
import '../../utils/widgets/app_bar.dart';
import '../../utils/widgets/buttoms.dart';
import '../../utils/widgets/custom_cards.dart';
import '../../utils/widgets/custom_visibility.dart';
import '../../utils/widgets/icon_button.dart';
import '../../utils/widgets/text_form_field.dart';
import '../../utils/widgets/text_items.dart';

class LeyEnfriamientoNewton extends StatefulWidget {
  const LeyEnfriamientoNewton({super.key});

  @override
  State<LeyEnfriamientoNewton> createState() => _LeyEnfriamientoNewtonState();
}

class _LeyEnfriamientoNewtonState extends State<LeyEnfriamientoNewton> {
  final String title = "Ley de enfriamiento Newton";
  final _t0Controller = TextEditingController();
  final _taController = TextEditingController();
  final _t1Controller = TextEditingController();
  final _t2Controller = TextEditingController();
  final _tController = TextEditingController();
  String result = '';
  double t2 = 0;
  double t = 0;
  final List<Card> _lista = [];
  bool _buttonEnabled = true;
  bool _textFieldEnabled = true;
  bool isVisible = false;
  bool tiempoBool = false;
  bool temperaturaBool = false;

  @override
  void dispose() {
    _t0Controller.dispose();
    _taController.dispose();
    _t1Controller.dispose();
    _t2Controller.dispose();
    _tController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomAppBar(title: title),
          actions: <IconButton>[iconButton(context, lista: _lista)],
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormFields(
                  text: "T(0):",
                  hintText: "Temperatura inicial.",
                  controller: _t0Controller,
                  enabled: _textFieldEnabled,
                ),
                CustomTextFormFields(
                  text: "TA:",
                  hintText: "Temperatura ambiente.",
                  controller: _taController,
                  enabled: _textFieldEnabled,
                ),
                CustomTextFormFields(
                  text: "T(1):",
                  hintText: "Temperatura en t(1).",
                  controller: _t1Controller,
                  enabled: _textFieldEnabled,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customElevatedButton(
                        onPressed: () => setState(() {
                              temperaturaBool = true;
                              tiempoBool = false;
                              isVisible = false;
                            }),
                        text: "Calcular Temperatura"),
                    const SizedBox(width: 15),
                    customElevatedButton(
                        onPressed: () => setState(() {
                              temperaturaBool = false;
                              tiempoBool = true;
                              isVisible = false;
                            }),
                        text: "Calcular Tiempo"),
                  ],
                ),
                const SizedBox(height: 10),
                VisibilityFormField(
                  visible: temperaturaBool,
                  title: _TextVisibility().temperatura,
                  text: "T:",
                  hintText: "tiempo",
                  controller: _tController,
                  onChanged: (text) => setState(() => _buttonEnabled = true),
                ),
                const SizedBox(height: 5),
                VisibilityFormField(
                  visible: tiempoBool,
                  title: _TextVisibility().tiempo,
                  text: "P(t):",
                  hintText: "Temperatura alcanzada:",
                  controller: _t2Controller,
                  onChanged: (text) => setState(() => _buttonEnabled = true),
                ),
                const SizedBox(height: 10),
                Center(child: _buttonCalcular(context)),
                const SizedBox(height: 10),
                const Divider(),
                const TextItems(text: "Resultado:"),
                Visibility(
                  visible: isVisible,
                  child: _cardCustom(context),
                ),
              ],
            ),
          ),
        ));
  }

  //Botón calcular
  ElevatedButton _buttonCalcular(BuildContext context) {
    return customElevatedButton(
        onPressed: _buttonEnabled
            ? () {
                if (_t0Controller.text.isNotEmpty) {
                  setState(() {
                    _buttonEnabled = false;
                    _textFieldEnabled = false;
                    double t0 = double.parse(_t0Controller.text);
                    double ta = double.parse(_taController.text);
                    double t1 = double.parse(_t1Controller.text);
                    double c = hallarC(t0: t0, ta: ta);
                    double k = hallarKEnfriamiento(t1: t1, c: c, ta: ta);

                    if (_t2Controller.text.isNotEmpty) {
                      t2 = double.parse(_t2Controller.text);
                      double finalTime =
                          hallarTiempoE(t2: t2, ta: ta, k: k, c: c);
                      result = finalTime.toStringAsFixed(2);
                    } else if (_tController.text.isNotEmpty) {
                      t = double.parse(_tController.text);
                      double finalTemperatura =
                          hallarTemperaturaFinal(c: c, ta: ta, k: k, t: t);
                      result = finalTemperatura.toStringAsFixed(2);
                    }
                    isVisible = true;
                    _lista.add(_cardCustom(context));
                  });
                }
              }
            : null,
        text: "Calcular");
  }

  Card _cardCustom(BuildContext context) {
    return cardCustom(
      context,
      text: _resulText(context, c: temperaturaBool ? t : t2, result: result),
    );
  }

  CustomTextCards _resulText(BuildContext context,
      {required double c, required String result}) {
    return CustomTextCards(
      text: temperaturaBool
          ? "La temperatura alcanzada en ${c.toStringAsFixed(0)} es de $result °C"
          : "El tiempo transcurrido para que la temperatura llegara a ${c.toStringAsFixed(0)} °C es de $result segundos, ",
    );
  }
}

class _TextVisibility {
  final String temperatura =
      "Hallar temperatura cuando ha transcurrido el siguiente tiempo";
  final String tiempo =
      "Hallar tiempo transcurrido cuando se ha alcanzdo la siguiente temperatura";
  _TextVisibility();
}
