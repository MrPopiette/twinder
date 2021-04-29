import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:twinder/models/user.dart';

Future<User> authLogin(String email, String password) async {
  //Requête
  final http.Response res = await http.post(Uri.http('10.0.2.2:3002', '/user/login', {"email": email, "password": password}));

  if (res.statusCode == 200) {
    return User.fromJson(jsonDecode(res.body)[0]);
  } else {
    throw Exception("Login invalide");
  }
}
