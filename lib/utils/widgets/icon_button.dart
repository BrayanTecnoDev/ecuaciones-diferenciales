  //Widget personalizado para el Icono de Historial
  import 'package:flutter/material.dart';

import '../../screens/history_page.dart';
import '../funtions/funtion_navigate_to_page.dart';

IconButton iconButton(BuildContext context, { required List<Card> lista}) {
    return IconButton(
        onPressed: () => navigateToPage(context, History(lista: lista)),
        icon: const Icon(Icons.history));
  }