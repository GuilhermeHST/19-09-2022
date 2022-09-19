

import 'package:flut_app_viagem/data/BD.dart';
import 'package:flut_app_viagem/domain/pacote_turistico.dart';
import 'package:flut_app_viagem/pages/pacote_promocional.dart';
import 'package:flut_app_viagem/widget/card_pacote_turistico.dart';
import 'package:flutter/material.dart';

class GridPacotesPage extends StatefulWidget {
  const GridPacotesPage({Key? key}) : super(key: key);

  @override
  _GridPacotesPageState createState() => _GridPacotesPageState();
}

class _GridPacotesPageState extends State<GridPacotesPage> {
  List<PacoteTuristico> listaPacotes = BD.lista;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.36,
        ),
        itemCount: listaPacotes.length,
        itemBuilder: (context, index) {
          return CardPacoteTuristico(
            pacoteTuristico: listaPacotes[index],
          );
        },
      ),
    );
  }
}