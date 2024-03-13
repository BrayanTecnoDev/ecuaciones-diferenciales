import 'package:flutter/material.dart';
import '../../controller/formulas_crecimiento.dart';
import '../../utils/themes/custom_text_style.dart';
import '../../utils/widgets/app_bar.dart';
import '../../utils/widgets/buttoms.dart';
import '../../utils/widgets/custom_cards.dart';
import '../../utils/widgets/custom_visibility.dart';
import '../../utils/widgets/icon_button.dart';
import '../../utils/widgets/text_form_field.dart';
import '../../utils/widgets/text_items.dart';

class CrecimientoPoblacional extends StatefulWidget {
  const CrecimientoPoblacional({super.key});

  @override
  State<CrecimientoPoblacional> createState() => _CrecimientoPoblacionalState();
}

class _CrecimientoPoblacionalState extends State<CrecimientoPoblacional> {
  final String title = "Crecimiento poblacional";
  final _poController = TextEditingController();
  final _p1Controller = TextEditingController();
  final _p2Controller = TextEditingController();
  final _tController = TextEditingController();
  String result = '';
  double p2 = 0;
  double t = 0;
  final List<Card> _lista = [];
  bool _buttonEnabled = true;
  bool _textFieldEnabled = true;
  bool isVisible = false;
  bool tiempoBool = false;
  bool poblacionBool = false;

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
              hintText: "Población en t(1)",
              controller: _p1Controller,
              enabled: _textFieldEnabled,
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

  //Botón calcular
  ElevatedButton _buttonCalcular(BuildContext context) {
    return customElevatedButton(
        onPressed: _buttonEnabled
            ? () {
                if (_poController.text.isNotEmpty) {
                  setState(() {
                    _buttonEnabled = false;
                    _textFieldEnabled = false;
                    double p0 = double.parse(_poController.text);
                    double p1 = double.parse(_p1Controller.text);
                    double k = hallarKPoblacion(p0: p0, p1: p1);

                    if (_p2Controller.text.isNotEmpty) {
                      p2 = double.parse(_p2Controller.text);
                      double finalTime = hallarTiempoP(p0: p0, p2: p2, k: k);
                      result = finalTime.toStringAsFixed(2);
                    } else if (_tController.text.isNotEmpty) {
                      t = double.parse(_tController.text);
                      double finalPoblation =
                          hallarPoblacionFinal(p0: p0, k: k, t: t);
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
      text: _resulText(context, c: poblacionBool ? t : p2, result: result),
    );
  }

  CustomTextCards _resulText(BuildContext context,
      {required double c, required String result}) {
    return CustomTextCards(
      text: poblacionBool
          ? "La población alcanzada en ${c.toStringAsFixed(0)} es de $result individuos"
          : "El tiempo transcurrido para que la población llegara a ${c.toStringAsFixed(0)} individuos es de $result segundos, ",
    );
  }
}

class _TextVisibility {
  final String poblacion =
      "Hallar población cuando ha transcurrido el siguiente tiempo";
  final String tiempo =
      "Hallar tiempo transcurrido cuando se ha alcanzdo la siguiente población";

  _TextVisibility();
}