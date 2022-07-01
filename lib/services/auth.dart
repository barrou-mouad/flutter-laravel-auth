import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_register/model/user.dart';
import 'package:login_register/services/dio.dart';

// Create storage

class Auth extends ChangeNotifier {
  bool is_loged = false;
  bool get authenticated => is_loged;
  User? user;
  final storage = const FlutterSecureStorage();
  login() async {
    Dio.Response response = await dio().post("login",
        data: {"email": "mouad@gmail.com", "password": "madrid"});
    print(response.data["token"]);
    user = User.fromjson(response.data["user"]);
    storeToken(response.data["token"]);
    is_loged = true;
    notifyListeners();
  }

  logout() {
    is_loged = false;
    notifyListeners();
  }

  checkToken() async {
    Dio.Response response = await dio().get("/user",
        options: Dio.Options(
            headers: {"Authorization": "Bearer " + geToken().toString()}));
  }

  storeToken(String token) async {
    print("Stored : " + token);
    await storage.write(key: "token", value: token.toString());
  }

  Future<String?> geToken() async {
    String? str;
    // Read value
    String? value = await storage.read(key: "token");
    print("this : " + value.toString());
    return value;
  }
}
