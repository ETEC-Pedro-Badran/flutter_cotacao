import 'dart:convert';

import 'package:cotacao/service_moeda.dart';

Future<void> main(List<String> args) async {
  var moedasSerializada = await ServiceMoeda().getAlternativas();
  var moedaList = jsonDecode(moedasSerializada);
  //print(moedaList.entries.map((e)=>e.key).toList());
   
   
 // print(moedaList.entries.map((e)=>e.key).toList()[3]);
  var opcao = moedaList.entries.first.key;
  //print(opcao);
  //print(moedaList[opcao]);

  var cotacaoSerializada = await ServiceMoeda().getCotacao(opcao);
  var cotacao = jsonDecode(cotacaoSerializada) as  Map<String, dynamic>;
  String chave = cotacao.entries.first.key;
  print(cotacao[chave]['ask']);
  
  
}
