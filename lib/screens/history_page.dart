import 'package:flutter/material.dart';

class History extends StatefulWidget {
  final List<Card> lista;
  const History({super.key, required this.lista});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    final List<Card> listaInvertida = widget.lista.reversed.toList();
    return Scaffold(
      appBar: AppBar(title: const Text("Historial")),
      body: listaInvertida.isEmpty
          ? const Center(child: Text("Historial vacío"))
          : ListView.builder(
              itemCount: listaInvertida.length,
              itemBuilder: (context, index) => Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.93,
                      child: listaInvertida[index])),
            ),
    );
  }
}
