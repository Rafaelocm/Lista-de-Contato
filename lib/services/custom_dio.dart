import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomDio{
  final _dio = Dio();

  Dio get dio => _dio;   

  verificacao(){
    _dio.options.headers["X-Parse-Application-Id"] = dotenv.get("BACK4APPAPLICATION");
    _dio.options.headers["X-Parse-REST-API-Key"] = dotenv.get("BACK4APPRESTAPIKEY");
    _dio.options.headers["CONTENT-TYPE"] = dotenv.get("CONTENTTYPE");
    _dio.options.baseUrl = dotenv.get("BASEURL"); 
  }
}
