import 'package:flutter/material.dart';

import '../../controller/formulas_ley_enfriamiento.dart';
import '../../utils/themes/custom_text_style.dart';
import '../../utils/widgets/app_bar.dart';
import '../../utils/widgets/buttoms.dart';
import '../../utils/widgets/custom_cards.dart';
import '../../utils/widgets/custom_drop_dowm_button.dart';
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
  String selectedTime = "Segundos";
  String result = '';
  double t2 = 0;
  double t = 0;
  final List<Card> _lista = [];
  final _t0Controller = TextEditingController();
  final _taController = TextEditingController();
  final _t1Controller = TextEditingController();
  final _t2Controller = TextEditingController();
  final _tController = TextEditingController();
  bool isVisible = false;
  bool tiempoBool = false;
  bool _buttonEnabled = true;
  bool temperaturaBool = false;
  bool _textFieldEnabled = true;

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
        floatingActionButton: _buttonReiniciar(context),
        body: Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.9,
            child: Column(
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
                  hintText: "Temperatura en temperatura =1.",
                  controller: _t1Controller,
                  enabled: _textFieldEnabled,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Expanded(
                        flex: 1, child: CustomTextTitleFields(text: "Tiempo:")),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: CustomDropDownButton(
                          value: selectedTime,
                          onChanged: (String? value) =>
                              setState(() => selectedTime = value.toString())),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                  hintText: "Tiempo",
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
  FilledButton _buttonCalcular(BuildContext context) {
    return customFilledButton(
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

                    if (_t2Controller.text.isNotEmpty && temperaturaBool == false) {
                      t2 = double.parse(_t2Controller.text);
                      double finalTime =
                          hallarTiempoE(t2: t2, ta: ta, k: k, c: c);
                      result = finalTime.toStringAsFixed(2);
                    } else if (_tController.text.isNotEmpty && temperaturaBool == true) {
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
      text: _resulText(context,
          c: temperaturaBool ? t : t2, result: result, timeData: selectedTime),
    );
  }

  CustomTextCards _resulText(BuildContext context,
      {required double c, required String result, required String timeData}) {
    return CustomTextCards(
      text: temperaturaBool
          ? "La temperatura alcanzada en ${c.toStringAsFixed(0)} $timeData es de $result °C"
          : "El tiempo transcurrido para que la temperatura llegara a ${c.toStringAsFixed(0)} °C es de $result $timeData ",
    );
  }

  ElevatedButton _buttonReiniciar(BuildContext context) {
    return customElevatedButton(
      text: "Reiniciar",
      onPressed: () {
        selectedTime = "Segundos";
        _t0Controller.clear();
        _taController.clear();
        _t1Controller.clear();
        _t2Controller.clear();
        _tController.clear();
        isVisible = false;
        tiempoBool = false;
        _buttonEnabled = true;
        temperaturaBool = false;
        _textFieldEnabled = true;
      },
    );
  }
}

class _TextVisibility {
  final String temperatura =
      "Hallar temperatura cuando ha transcurrido el siguiente tiempo" ;
  final String tiempo =
      "Hallar tiempo transcurrido cuando se ha alcanzado la siguiente temperatura";
  _TextVisibility();
}
