import 'dart:convert';

import 'package:cotacao/service_moeda.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<List<dynamic>> carregarMoedas() async {
  var value = await ServiceMoeda().getAlternativas();
  var _moedas = <String>[];
  var moedasSerializada = value;
  var moedaList = jsonDecode(moedasSerializada);
  var lista = moedaList.entries.map((e) => e.key).toList();
  return lista;
}

Future<double?> obterCotacao(String moeda) async {
  var cotacaoSerializada = await ServiceMoeda().getCotacao(moeda);
  var cotacao = jsonDecode(cotacaoSerializada) as Map<String, dynamic>;
  String chave = cotacao.entries.first.key;
  return double.tryParse(cotacao[chave]['ask']);
}

class _HomePageState extends State<HomePage> {
  final moedas = <String>[];
  String? moeda;
  double valor = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0, title: const Text("Cotação")),
        body: FutureBuilder<List<dynamic>>(
            future: carregarMoedas(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.grey)));
              } else {
                final moedasDMI = snapshot.data!
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ),
                    )
                    .toList();

                return Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            decoration: InputDecoration(label: Text("Valor")),
                            onChanged: (value) => setState(() {
                                  valor = double.tryParse(value) ?? 0.0;
                                })),
                      ),
                      DropdownButton(
                        value: moeda,
                        items: moedasDMI,
                        onChanged: (value) {
                          setState(() {
                            moeda = value as String?;
                          });
                        },
                      )
                    ],
                  ),
                  FutureBuilder<double?>(
                      future: obterCotacao(moeda ?? ""),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var convertido = snapshot.data ?? 0.0 * valor;
                          return Text("Valor da conversão: $convertido");
                        } else {
                          return Text("Selecione uma opção.");
                        }
                      })
                ]);
              }
            }));
  }
}
