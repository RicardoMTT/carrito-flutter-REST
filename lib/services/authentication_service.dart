import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app_fluter/app_routing/routes.dart';
import 'dart:convert';

class AuthenticationService {
  static Future<dynamic> signin() async {
    final String url = "https://reqres.in/api/login";

    final response = await http.post(url,
        body: {"email": "eve.holt@reqres.in", "password": "cityslicka"});
    final jsonResponse = json.decode(response.body);

    print("ASDSA ${jsonResponse['token']}");
    Get.offAllNamed(AppRoutes.home);

    return jsonResponse['token'];
  }
}
