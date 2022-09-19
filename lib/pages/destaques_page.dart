import 'package:flut_app_viagem/data/BD.dart';
import 'package:flut_app_viagem/data/pacote-dao.dart';
import 'package:flut_app_viagem/domain/pacote_turistico.dart';
import 'package:flut_app_viagem/pages/pacote_promocional.dart';
import 'package:flut_app_viagem/widget/card_pacote_turistico.dart';

import 'package:flutter/material.dart';

class DestaquesPage extends StatefulWidget {
  const DestaquesPage({Key? key}) : super(key: key);

  @override
  _DestaquesPageState createState() => _DestaquesPageState();
}

class _DestaquesPageState extends State<DestaquesPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<PacoteTuristico>>(
        future: PacoteDao().listarPacotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PacoteTuristico> lista = snapshot.data ?? [];

            return ListView(
              children: [
                buildContainerPropaganda(),
                const SizedBox(height: 16),
                buildListViewBuilder(lista)
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  buildListViewBuilder(List<PacoteTuristico> listaPacotes) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listaPacotes.length,
      itemBuilder: (context, index) {
        return CardPacoteTuristico(
          pacoteTuristico: listaPacotes[index],
        );
      },
    );
  }

  buildContainerPropaganda() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'TOP DESTINOS MAIS BUSCADOS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Corre que ta rolando muita promoção',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PacotePromocional();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Eu quero',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Color(0xFFF8FF04)),
                )
              ],
            ),
          ),
          const SizedBox(width: 24),
          const Placeholder(
            fallbackHeight: 150,
            fallbackWidth: 100,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}