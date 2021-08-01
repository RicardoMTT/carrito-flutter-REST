import 'package:get/get.dart';
import 'package:peliculas_app_fluter/models/product.model.dart';

class CartScreenController extends GetxController {
  List<Producto> productAddToCart = [new Producto()].obs;
  RxInt sidebarOption = 0.obs;
  static CartScreenController get to => Get.find();

  @override
  void onReady() async {
    super.onReady();
  }
}
