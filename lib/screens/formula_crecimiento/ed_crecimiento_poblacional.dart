import 'package:flutter/material.dart';
import '../../controller/formulas_crecimiento.dart';
import '../../utils/themes/custom_text_style.dart';
import '../../utils/widgets/app_bar.dart';
import '../../utils/widgets/buttoms.dart';
import '../../utils/widgets/custom_cards.dart';
import '../../utils/widgets/custom_visibility.dart';
import '../../utils/widgets/icon_button.dart';
import '../../utils/widgets/custom_drop_dowm_button.dart';
import '../../utils/widgets/text_form_field.dart';
import '../../utils/widgets/text_items.dart';

class CrecimientoPoblacional extends StatefulWidget {
  const CrecimientoPoblacional({super.key});

  @override
  State<CrecimientoPoblacional> createState() => _CrecimientoPoblacionalState();
}

class _CrecimientoPoblacionalState extends State<CrecimientoPoblacional> {
  final String title = "Crecimiento poblacional";
  String selectedTime = "Segundos";
  String result = '';
  double p2 = 0;
  double t = 0;
  final List<Card> _lista = [];
  final _poController = TextEditingController();
  final _p1Controller = TextEditingController();
  final _p2Controller = TextEditingController();
  final _tController = TextEditingController();
  bool isVisible = false;
  bool tiempoBool = false;
  bool _buttonEnabled = true;
  bool poblacionBool = false;
  bool _textFieldEnabled = true;

  @override
  void dispose() {
    _poController.dispose();
    _p1Controller.dispose();
    _tController.dispose();
    _p2Controller.dispose();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormFields(
              text: "P(0):",
              hintText: "Población inicial.",
              controller: _poController,
              enabled: _textFieldEnabled,
            ),
            CustomTextFormFields(
              text: "P(1):",
              hintText: "Población en tiempo = 1",
              controller: _p1Controller,
              enabled: _textFieldEnabled,
            ),
            const SizedBox(height: 5),
            Visibility(
              visible: _textFieldEnabled,
              child: Row(
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
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customElevatedButton(
                    onPressed: () => setState(() {
                          poblacionBool = true;
                          tiempoBool = false;
                          isVisible = false;
                        }),
                    text: "Calcular Población"),
                const SizedBox(width: 20),
                customElevatedButton(
                    onPressed: () => setState(() {
                          poblacionBool = false;
                          tiempoBool = true;
                          isVisible = false;
                        }),
                    text: "Calcular Tiempo"),
              ],
            ),
            const SizedBox(height: 10),
            VisibilityFormField(
              visible: poblacionBool,
              title: _TextVisibility().poblacion,
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
              hintText: "Población alcanzada:",
              controller: _p2Controller,
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
      )),
    );
  }

  ElevatedButton _buttonReiniciar(BuildContext context) {
    return customElevatedButton(
      text: "Reiniciar",
      onPressed: () {
        setState(() {
          _poController.clear();
          _p1Controller.clear();
          _tController.clear();
          _p2Controller.clear();
          _textFieldEnabled = true;
          isVisible = false;
          tiempoBool = false;
          _buttonEnabled = true;
          poblacionBool = false;
          selectedTime = "Segundos";
        });
      },
    );
  }

  //Botón calcular
  FilledButton _buttonCalcular(BuildContext context) {
    return customFilledButton(
        onPressed: _buttonEnabled
            ? () {
                if (_poController.text.isNotEmpty) {
                  setState(() {
                    _buttonEnabled = false;
                    _textFieldEnabled = false;
                    double p0 = double.parse(_poController.text);
                    double p1 = double.parse(_p1Controller.text);
                    double k = hallarKPoblacion(p0: p0, p1: p1);

                    if (_p2Controller.text.isNotEmpty  && poblacionBool == false) {
                      p2 = double.parse(_p2Controller.text);
                      double finalTime = hallarTiempoP(p0: p0, p2: p2, k: k);
                      result = finalTime.toStringAsFixed(2);
                    } else if (_tController.text.isNotEmpty  && poblacionBool == true) {
                      t = double.parse(_tController.text);
                      double finalPoblation =
                          hallarPoblacionFinal(p0: p0, k: k, t: t);
                          print("Población final $finalPoblation");
                      result = finalPoblation.toStringAsFixed(2);
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
          c: poblacionBool ? t : p2, result: result, timeData: selectedTime),
    );
  }

  CustomTextCards _resulText(BuildContext context,
      {required double c, required String result, required String timeData}) {
    return CustomTextCards(
      text: poblacionBool
          ? "La población alcanzada en ${c.toStringAsFixed(0)} $timeData es de $result individuos"
          : "El tiempo transcurrido para que la población llegara a ${c.toStringAsFixed(0)} individuos es de $result $timeData ",
    );
  }
}

class _TextVisibility {
  final String poblacion =
      "Hallar la población cuando ha transcurrido el siguiente tiempo";
  final String tiempo =
      "Hallar el tiempo transcurrido cuando se ha alcanzdo la siguiente población";

  _TextVisibility();
}
