import 'package:get/get.dart';
import 'package:peliculas_app_fluter/app_routing/routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() async {
    _init();
    super.onReady();
  }

  void _init() async {
    await Future.delayed(Duration(seconds: 1));

    Get.offAllNamed(AppRoutes.login);
  }
}
