import 'dart:convert';

import 'package:cotacao/service_moeda.dart';

Future<void> main(List<String> args) async {
  var moedasSerializada = await ServiceMoeda().getAlternativas();
  var moedaList = json.decode(moedasSerializada);
  var opcao = 'USD-BRL';
//  print(moedaList['USD-BRL']);

  var cotacaoSerializada = await ServiceMoeda().getCotacao(opcao);
}
