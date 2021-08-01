import 'package:get/get.dart';
import 'package:peliculas_app_fluter/screens/splash/screens_controller.dart';

class SplashScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}
