import 'package:http/http.dart' as http;

class ServiceMoeda {
  //consulta alternativas de conversão
  getAlternativas() async {
    Uri uri = Uri.parse("https://economia.awesomeapi.com.br/json/available");
    var resposta = await http.get(uri);
    if (resposta.statusCode == 200) {
      return resposta.body;
    } else {
      throw Exception();
    }
  }

  //consulta alternativas de conversão
  getCotacao(String opcao) async {
    Uri uri = Uri.parse("https://economia.awesomeapi.com.br/json/last/$opcao");
    var resposta = await http.get(uri);
    if (resposta.statusCode == 200) {
      return resposta.body;
    } else {
      throw Exception();
    }
  }
}
