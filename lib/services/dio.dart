import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();

  dio.options.baseUrl = "http://192.168.1.107:8000/api/";
  dio.options.headers["accept"] = "Application/Json";

  return dio;
}
