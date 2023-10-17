import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:projeto_lista_contato/model/lista_de_contatos_model.dart';
import 'package:projeto_lista_contato/services/custom_dio.dart';

class Back4App {
  final _customDio = CustomDio();

  Back4App();

  Future<listContatoList> readingObjects() async {
    var dio = Dio(); 
    dio.options.headers["X-Parse-Application-Id"] = dotenv.get("BACK4APPAPLICATION");
    dio.options.headers["X-Parse-REST-API-Key"] = dotenv.get("BACK4APPRESTAPIKEY");
    dio.options.headers["CONTENT-TYPE"] = dotenv.get("CONTENTTYPE");
    var results = await dio.get("https://parseapi.back4app.com/classes/listaDeContato");
    return listContatoList.fromJson(results.data);
  }

  Future<void> creatingObjects(ListaDeContato listaDeContato) async {
    try {
      await _customDio.dio
          .post("/listaDeContato", data: listaDeContato.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatingObjects(ListaDeContato listaDeContato) async {
    try {
      await _customDio.dio.put("/listaDeContato/${listaDeContato.objectId}",
          data: listaDeContato.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletingObjects(String objectId) async {
    try {
      await _customDio.dio.delete("/listaDeContato/$objectId");
    } catch (e) {
      rethrow;
    }
  }
}
