import 'dart:convert';

import 'package:cotacao/service_moeda.dart';

Future<void> main(List<String> args) async {
  var moedasSerializada = await ServiceMoeda().getAlternativas();
}
