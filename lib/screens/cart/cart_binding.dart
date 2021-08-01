import 'package:get/get.dart';
import 'package:peliculas_app_fluter/screens/cart/cart_controller.dart';

class CartScreenBindings implements Bindings {
  @override
  void dependencies() {
    print("ENTRASTE");
    Get.lazyPut(() => CartScreenController());
  }
}
